<?php
class JobQueueCommand extends CConsoleCommand {
	protected $webroot;
	
	public function run($args) {
		$this->webroot = Yii::app()->params['webroot'];
		$sql = "select a.id, a.ts, a.rpt_type, a.username, a.rpt_desc, a.req_dt  
					from swo_queue a
				where a.status='P' order by a.req_dt limit 1";
		$rows = Yii::app()->db->createCommand($sql)->queryAll();
		if (count($rows) > 0) {
			$id = 0;
			$ts = '';
			$format = '';
			$uid = '';
			$param = array();
			foreach ($rows as $row) {
				$id = $row['id'];
				$ts = $row['ts'];
				$format = empty($row['rpt_type']) ? 'EXCEL' : $row['rpt_type'];
				$uid = $row['username'];
				break;
			}
			
			if ($id!=0) $param = $this->getQueueParam($id);
			
			if (($id!=0) && !empty($param) && $this->markStatus($id, $ts, 'I')) {
				if (isset($param['LANGUAGE'])) Yii::app()->language = $param['LANGUAGE'];
				$param['UID'] = $uid;
				$param['REQ_DT'] = $row['req_dt'];
				$param['RPT_DESC'] = $row['rpt_desc'];
				$ts = $this->getTimeStamp($id);
				
				$rpt_desc = $param['RPT_DESC'];
				$mesg = "ID:$id NAME:$rpt_desc FORMAT:$format USER:$uid\n";
				echo $mesg;
				
				$out = $this->genReport($id, $param, $format);
				if (!empty($out)) {
					$sts = 'F';
					switch ($format) {
						case 'FEED':
							$this->saveOutput($id, $ts, $out, 'C');
							$to = $this->getEmailAddress($param['TOUSER']);
							$cc = $this->getCcEmailAddress(json_decode($param['CCUSER']));
							$bosses = Yii::app()->params['feedbackCcBoss'];
							$ic = array();
							foreach (City::model()->getAncestorInChargeList($param['CITY']) as $usr) {
								if (!in_array($usr,$bosses)) $ic[] = $usr;
							}
							$this->updateQueueUser($id, $ic);
							$cc2 = General::getEmailByUserIdArray($ic);
							$cc = array_merge($cc, $cc2);

							if (!empty($to)) {
								$result = $this->sendReportLink2($to,$cc,$param,$id);
								echo (($result) ? "\t-Send report done (feed)\n" : "\t-Send report fail (feed)\n");
//								if ($result) $result = $this->sendFeedbackLink($to,$param,$id);
//								echo (($result) ? "\t-Send url done (feed)\n" : "\t-Send url fail (feed)\n");
//								if ($result) $sts = 'E';
							}
							echo "\t-Done (feed)\n";
							break;
						
						case 'EMAIL':
							$to = $param['EMAIL'];
							$sts = ($this->sendReport($to,'',$param,$out))?'E':$sts;
							$this->saveOutput($id, $ts, $out, $sts);
							echo "\t-Done (email)\n";
							break;
						
						default:
							$this->saveOutput($id, $ts, $out, 'C');
							echo "\t-Done (default)\n";
					}
				} else {
					$this->markStatus($id, $ts, 'F');
					echo "\t-FAIL\n";
				}
			}
		}
	}
	
	protected function updateQueueUser($id, $users) {
		if (!empty($users)) {
			foreach ($users as $username) {
				$sql = "select id from swo_queue_user where queue_id=$id and username='$username' limit 1";
				if (Yii::app()->db->createCommand($sql)->queryRow()===false) {
					$sql = "insert into swo_queue_user (queue_id, username)
							values(:queue_id, :username)
					";

					$command=Yii::app()->db->createCommand($sql);
					if (strpos($sql,':queue_id')!==false)
						$command->bindParam(':queue_id',$id,PDO::PARAM_INT);
					if (strpos($sql,':username')!==false)
						$command->bindParam(':username',$username,PDO::PARAM_STR);
					$command->execute();
				}
			}
		}
	}
	
	protected function sendReport($to, $cc, $param, $attach) {
		$name = Yii::t('report',$param['RPT_DESC']).(isset($param['CITY_NAME'])?'-'.$param['CITY_NAME']:'');
		$subject = $name.' ('.Yii::t('report','Date').':'.$param['REQ_DT'].')';
		$fname = $name.'.xlsx';
		$msg1 = Yii::t('report','Please find the attached report file for your reference.');
		$message = <<<EOF
		$msg1<br>
EOF;
		$data = array('message'=>$message, 'description'=>$name);
		return $this->sendEmail($to, $cc, $subject, $data, $fname, $attach);
	}
	
	protected function sendReportLink($to, $cc, $param, $qid) {
		$url = ($qid==0) ? '#' : $this->webroot.'/index.php/queue/download?index='.$qid;
		$name = Yii::t('report',$param['RPT_DESC']).(isset($param['CITY_NAME'])?'-'.$param['CITY_NAME']:'');
		$subject = $name.' ('.Yii::t('report','Date').':'.$param['REQ_DT'].')';
		$message = str_replace('{url}',$url, Yii::t('report',"Please click <a href=\"{url}\" onClick=\"return popup(this,'Daily Report');\">here</a> to download the report."));
		$data = array('message'=>$message, 'description'=>$name);
		return $this->sendEmail($to, $cc, $subject, $data, '', '');
	}

	protected function sendReportLink2($to, $cc, $param, $qid) {
		$name = Yii::t('report',$param['RPT_DESC']).(isset($param['CITY_NAME'])?'-'.$param['CITY_NAME']:'');
		$subject = $name.' ('.Yii::t('report','Date').':'.$param['REQ_DT'].')';

		$url = ($qid==0) ? '#' : $this->webroot.'/index.php/queue/download?index='.$qid;
		$msgall = Yii::t('report','Dear All');
		$msgrpt = str_replace('Please','please',str_replace('{url}',$url, Yii::t('report',"Please click <a href=\"{url}\" onClick=\"return popup(this,'Daily Report');\">here</a> to download the report.")));

		$fburl = $this->generateFeedbackUrl($param['TOUSER'],$param['UID'],$param['REQ_DT'],$param['CITY'],$qid);
		$msgusr = Yii::t('report','Also').', '.str_replace('{ac}',$param['TOUSER'],Yii::t('report','the user (login id {ac})'));
		$msgfb = str_replace('Please','please',str_replace('{fburl}',$fburl, Yii::t('report',"Please click <a href=\"{fburl}\" onClick=\"return popup(this,'Daily Report');\">here</a> to go to system to feedback All Daily Reports.")));

		$message = "<p>$msgall, $msgrpt</p>
				<p>$msgusr, $msgfb</p>
			";
		
		$data = array('message'=>$message, 'description'=>$name);
		return $this->sendEmail($to, $cc, $subject, $data, '', '');
	}

	protected function sendFeedbackLink($to,$param,$qid){
		$url = $this->generateFeedbackUrl($param['TOUSER'],$param['UID'],$param['REQ_DT'],$param['CITY'],$qid);
		if (!empty($url)) {
			$description = Yii::t('app','Feedback').(isset($param['CITY_NAME'])?'-'.$param['CITY_NAME']:'');
			$subject = str_replace('{date}', $param['REQ_DT'], Yii::t('report','Please fill in Feedback on All Daily Reports (Date: {date})'));
			$message = str_replace('{fburl}',$url, Yii::t('report',"Please click <a href=\"{fburl}\" onClick=\"return popup(this,'Daily Report');\">here</a> to go to system to feedback All Daily Reports."));
			$data = array('message' => $message,'description' => $description);
			return $this->sendEmail($to, '', $subject, $data, '', '');
		} else 
			return false;
	}
	
	protected function generateFeedbackUrl($tuser, $oper, $rdate, $city, $qid) {
		$id = 0;
		$d = General::toMyDate($rdate);
		$sql = "select id, username, status from swo_mgr_feedback
				where city='".$city."' 
				and year(request_dt)=year('".$d."') and month(request_dt)=month('".$d."') and day(request_dt)=day('".$d."')
			";
		$rows = Yii::app()->db->createCommand($sql)->queryAll();
		if (count($rows) > 0) {
			foreach ($rows as $row) {
				$id = $row['id'];
				$ouser = $row['username'];
				break;
			}
			if ($ouser!=$tuser) {
				$sql = "update swo_mgr_feedback set username=:uid, rpt_id=:qid, luu=:oper where id=:id";
				$command=Yii::app()->db->createCommand($sql);
				if (strpos($sql,':id')!==false)
					$command->bindParam(':id',$id,PDO::PARAM_INT);
				if (strpos($sql,':qid')!==false)
					$command->bindParam(':qid',$qid,PDO::PARAM_INT);
				if (strpos($sql,':uid')!==false)
					$command->bindParam(':uid',$tuser,PDO::PARAM_STR);
				if (strpos($sql,':oper')!==false)
					$command->bindParam(':oper',$oper,PDO::PARAM_STR);
				$cnt = $command->execute();
			}
		} else {
			$sql = " insert into swo_mgr_feedback(username, request_dt, city, status, rpt_id, lcu)
					values(:uid, :req_dt, :city, 'N', :qid, :oper)
				";
			$command=Yii::app()->db->createCommand($sql);
			if (strpos($sql,':uid')!==false)
				$command->bindParam(':uid',$tuser,PDO::PARAM_STR);
			if (strpos($sql,':qid')!==false)
				$command->bindParam(':qid',$qid,PDO::PARAM_INT);
			if (strpos($sql,':req_dt')!==false)
				$command->bindParam(':req_dt',$d,PDO::PARAM_STR);
			if (strpos($sql,':city')!==false)
				$command->bindParam(':city',$city,PDO::PARAM_STR);
			if (strpos($sql,':oper')!==false)
				$command->bindParam(':oper',$oper,PDO::PARAM_STR);
			$cnt = $command->execute();
			$id = Yii::app()->db->getLastInsertID();
		}
		$url = ($id==0) ? '' : $this->webroot.'/index.php/feedback/edit?index='.$id;
		return $url;
	}
	
	protected function sendEmail($to, $cc, $subject, $data=array(), $filename, $attach){
		$mail = new YiiMailer;

		$mail->setView('report');
		$data['mailer'] = $mail;
		$mail->setData($data);

		$mail->setFrom(Yii::app()->params['systemEmail'],Yii::t('app',Yii::app()->name));
		$mail->setSubject($subject);
//		$mail->setBody('Testing');
		$to = General::dedupToEmailList($to);
		$mail->setTo($to);
		if (!empty($cc) && is_array($cc)) {
			$cc = General::dedupCcEmailList($cc, $to);
			$mail->setCc($cc);
		}
		$mail->addBCC('system@lbsgroup.com.cn');
		if (!empty($filename) && !empty($attach)) $mail->AddStringAttachment($attach,$filename);

//		$mail->setSmtp('smtp3.securemail.hk', 1025, 'none', true, 'smtp@lbsgroup.com.hk', 'U4gApuat'); // GMail example
		$to_str = is_array($to) ? implode(',',$to) : $to;
		$cc_str = is_array($cc) ? implode(',',$cc) : $cc;
		$mesg = "TO:$to_str CC:$cc_str\n";
		echo $mesg;
		$rtn = $mail->send();
		if ($rtn) 
			echo 'Mail sent successfully';
		else
			echo 'Error while sending email: '.$mail->getError();
		return $rtn;
	}
	
	protected function getEmailAddress($uid) {
		$suffix = Yii::app()->params['envSuffix'];
		$sql = "select email from security$suffix.sec_user where username='".$uid."'";
		$row = Yii::app()->db->createCommand($sql)->queryRow();
		return (isset($row['email']))?$row['email']:'';
	}
	
	protected function getCcEmailAddress($uids) {
		$rtn = array();
		if (is_array($uids)) {
			foreach ($uids as $uid) {
				$rtn[] = $this->getEmailAddress($uid);
			}
		}
		return $rtn;
	}
	
	protected function getQueueParam($qid) {
		$rtn = array();
		$sql = "select * from swo_queue_param where queue_id=".$qid;
		$rows = Yii::app()->db->createCommand($sql)->queryAll();
		if (count($rows) > 0) {
			foreach ($rows as $row) {
				$param_field = $row['param_field'];
				$param_value = $row['param_value'];
				$rtn[$param_field] = $param_value; 
			}
		}
		return $rtn;
	}
	
	protected function markStatus($id, $ts, $sts) {
		$sql = "update swo_queue set status=:status where id=:id and ts=:ts";
		$command=Yii::app()->db->createCommand($sql);
		if (strpos($sql,':id')!==false)
			$command->bindParam(':id',$id,PDO::PARAM_INT);
		if (strpos($sql,':status')!==false)
			$command->bindParam(':status',$sts,PDO::PARAM_STR);
		if (strpos($sql,':ts')!==false)
			$command->bindParam(':ts',$ts,PDO::PARAM_STR);
		$cnt = $command->execute();
		return ($cnt>0);
	}
	
	protected function saveOutput($id, $ts, $outstring, $sts) {
		try {
			$sql = "update swo_queue set status=:sts, fin_dt=now(), rpt_content=:content where id=:id and ts=:ts";
			$command=Yii::app()->db->createCommand($sql);
			if (strpos($sql,':id')!==false)
				$command->bindParam(':id',$id,PDO::PARAM_INT);
			if (strpos($sql,':content')!==false)
				$command->bindParam(':content',$outstring,PDO::PARAM_LOB);
			if (strpos($sql,':ts')!==false)
				$command->bindParam(':ts',$ts,PDO::PARAM_STR);
			if (strpos($sql,':sts')!==false)
				$command->bindParam(':sts',$sts,PDO::PARAM_STR);
			$cnt = $command->execute();
		}
		catch(Exception $e) {
			throw new CDbException($e->getMessage(),$e->getCode());
		}
		return ($cnt>0);
	}
	
	protected function getTimeStamp($id) {
		$ts = '';
		$sql = "select ts from swo_queue where id=".$id;
		$rows = Yii::app()->db->createCommand($sql)->queryAll();
		if (count($rows) > 0) {
			foreach ($rows as $row) {
				$ts = $row['ts'];
				break;
			}
		}
		return $ts;
	}

	protected function genReport($id, $param, $format) {
		$criteria = new ReportForm();
		$criteria->id = $param['RPT_ID'];
		$criteria->name = $param['RPT_NAME'];
		$criteria->start_dt = $param['START_DT'];
		$criteria->end_dt = $param['END_DT'];
		$criteria->target_dt = $param['TARGET_DT'];
		$criteria->fields = $param['FIELD_LST'];
		$criteria->year = isset($param['YEAR']) ? $param['YEAR'] : '';
		$criteria->month = isset($param['MONTH']) ? $param['MONTH'] : '';
		$criteria->uid = $param['UID'];
		$criteria->city = $param['CITY'];
		$criteria->type = isset($param['TYPE']) ? $param['TYPE'] : '';
		$criteria->email = isset($param['EMAIL']) ? $param['EMAIL'] : '';
		$criteria->emailcc = isset($param['EMAILCC']) ? $param['EMAILCC'] : '';
		$criteria->touser = isset($param['TOUSER']) ? $param['TOUSER'] : '';
		$criteria->ccuser = isset($param['CCUSER']) ? $param['CCUSER'] : '';
		$criteria->type = isset($param['TYPE']) ? $param['TYPE'] : '';
		$paper_sz = $param['PAPER_SZ'];
		$rpt_array = json_decode($param['RPT_ARRAY']);

		switch($format) {
			case 'PDF':
				$model = $this->getModelById($criteria->id);
				$model->criteria = $criteria;
				$model->retrieveData();
				$output = $this->printPdfReport($model,$paper_sz);
				break;
			case 'MTHRPT':
				$model = $this->getModelById($criteria->id);
				$model->criteria = $criteria;
				$model->retrieveData();
				$output = $this->printMonthlyReport($model);
				break;
			case 'FEED':
			case 'EMAIL':
			case 'EXCEL':
				$rptdata = array();
				foreach ($rpt_array as $rpt_id=>$rpt_name) {
					$criteria->id = $rpt_id;
					$criteria->name = $rpt_name;
					$model = $this->getModelById($criteria->id);
					$model->criteria = $criteria;
					$model->retrieveData();
					$rptdata[] = array(
							'headertitle'=>$model->getReportName(),
							'headerstring'=>$model->getSelectString(),
							'groupdefinition'=>$model->groups(),
							'headerdefinition'=>$model->header_structure(),
							'linedefinition'=>$model->fields(),
							'linegroupdefinition'=>$model->line_group(),
							'sublinedefinition'=>$model->subsections(),
							'reportstructure'=>$model->report_structure(),
							'data'=>$model->data,
						);
				}
				$sheet = 0;
				$excel = new MyExcel(); 
				$excel->init();
				foreach ($rptdata as $report) {
					$excel->SetHeaderTitle($report['headertitle']);
					$excel->SetHeaderString($report['headerstring']);

					$excel->SetGroupDefinition($report['groupdefinition']);
					$excel->SetHeaderDefinition($report['headerdefinition']);
					$excel->SetLineDefinition($report['linedefinition']);
					$excel->SetLineGroupDefinition($report['linegroupdefinition']);
					$excel->SetSublineDefinition($report['sublinedefinition']);
					$excel->SetReportStructure($report['reportstructure']);
					
					$excel->generateOutput($report['data'], $sheet);
					$sheet++;
				}
				$output = $excel->getOutput();
				break;
			default:
				$output = '';
		}
		return $output;
	}

	protected function getModelById($rptid) {
		$model = null;
		switch ($rptid) {
			case 'RptCustnew': $model = new RptCustnew(); break;
			case 'RptCustrenew': $model = new RptCustrenew(); break;
			case 'RptCustamend': $model = new RptCustamend(); break;
			case 'RptCustsuspend': $model = new RptCustsuspend(); break;
			case 'RptCustresume': $model = new RptCustresume(); break;
			case 'RptCustterminate': $model = new RptCustterminate(); break;
			case 'RptComplaint': $model = new RptComplaint(); break;
			case 'RptQc': $model = new RptQc(); break;
			case 'RptLogistic': $model = new RptLogistic(); break;
			case 'RptStaff': $model = new RptStaff(); break;
			case 'RptEnquiry': $model = new RptEnquiry(); break;
			case 'RptRenewal': $model = new RptRenewal(); break;
			case 'RptFeedbackstat': $model = new RptFeedbackstat(); break;
			case 'RptFeedback': $model = new RptFeedback(); break;
			case 'RptMonthly': $model = new RptMonthly(); break;
		}
		return $model;
	}
	
	protected function setExcelDefinition(&$excel, $model) {
		$excel->SetHeaderTitle($model->getReportName());
		$excel->SetHeaderString($model->getSelectString());

		$excel->SetGroupDefinition($model->groups());
		$excel->SetHeaderDefinition($model->header_structure());
		$excel->SetLineDefinition($model->fields());
		$excel->SetLineGroupDefinition($model->line_group());
		$excel->SetSublineDefinition($model->subsections());
		$excel->SetReportStructure($model->report_structure());
	}
	
	protected function printMonthlyReport($model) {
		$excel = new MyExcel();
		$excel->init();
		$path = Yii::app()->basePath.'/commands/template/m_template.xlsx';
		$excel->readFile($path);
		$month = 0;
		$city_name = $this->getCityName($model->criteria->city);
		for ($i=0; $i < 13; $i++) {
			$ws = $excel->setActiveSheet($i);
			$title = ($i+1 > 12) 
				? $excel->getCellValue('A',1).' - '.$city_name.' ('.$model->criteria->year.')'
				: $excel->getCellValue('A',1).' - '.$city_name.' ('.$model->criteria->year.'/'.($i+1).')';
			$excel->setCellValue('A',1,$title);
			$excel->getActiveSheet()->getProtection()->setPassword('lbs9876');
			$excel->getActiveSheet()->getProtection()->setSheet(true);
//			$ws->getStyle('B3:B71')->getProtection()->setLocked(PHPExcel_Style_Protection::PROTECTION_UNPROTECTED);
		}
		foreach ($model->data as $row) {
			if ($month!=$row['month_no']) {
				$month = $row['month_no'];
				$excel->setActiveSheet($month-1);
			}
			$excel->setCellValue('B', $row['row_no'], $row['value']);
		}
		if ($month < 12) {
			for ($i=0; $i < 13; $i++) {
				echo $i;
				if ($i!=$month-1) {
					$excel->setActiveSheet($i);
					$active = $excel->getActiveSheet();
					$active->setSheetState(PHPExcel_Worksheet::SHEETSTATE_VERYHIDDEN);
				}
			}
		}
		return $excel->getOutput();
	}
	
	protected function printExcelReport($model) {
		$excel = new MyExcel();
//		$excel->SetTitle($model->getReportName());
		
		$excel->SetHeaderTitle($model->getReportName());
		$excel->SetHeaderString($model->getSelectString());

		$excel->SetGroupDefinition($model->groups());
		$excel->SetHeaderDefinition($model->header_structure());
		$excel->SetLineDefinition($model->fields());
		$excel->SetLineGroupDefinition($model->line_group());
		$excel->SetSublineDefinition($model->subsections());
		$excel->SetReportStructure($model->report_structure());

		$outstring = $excel->generate($model->data);
		return $outstring;
	}

	protected function printPdfReport($model,$papersize) {
		ob_start();
		$pdf = new MyPDF2('L', 'mm', $papersize, true, 'UTF-8', false);
		
		// set default header data
		$pdf->SetTitle($model->getReportName());
		
		$pdf->SetHeaderTitle($model->getReportName());
		$pdf->SetHeaderString($model->getSelectString());

		$pdf->SetGroupDefinition($model->groups());
		$pdf->SetHeaderDefinition($model->header_structure());
		$pdf->SetLineDefinition($model->fields());
		$pdf->SetLineGroupDefinition($model->line_group());
		$pdf->SetSublineDefinition($model->subsections());
		$pdf->SetReportStructure($model->report_structure());

		// set header and footer fonts
		$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
		$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

		// set default monospaced font
		$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

		// set margins
//		$t_margin=28;
		$t_margin= $pdf->getHeaderHeight()+17; 
		$r_margin=5;
		$l_margin=5;
		$pdf->SetMargins($l_margin, $t_margin, $r_margin);
		
		$h_margin=5;
		$pdf->SetHeaderMargin($h_margin);
		
		$f_margin=5;
		$pdf->SetFooterMargin($f_margin);

		// set auto page breaks
		$b_margin=15;
		$pdf->SetAutoPageBreak(TRUE, $b_margin);

		// add a page
		$pdf->AddPage();

		// print content
		$pdf->Content($model->data);
//			$pdf->MultiCell(12, 8, $t_margin, 1, 'C', 
//					true, 0, '', '', true, 0, false, true, 9, 'B');

		//Close and output PDF document
		$output = $model->getReportId().'.pdf';
		ob_end_clean();
		$outstring = $pdf->Output('', 'S');
		return $outstring;
	}
	
	protected function getCityName($code) {
		$suffix = Yii::app()->params['envSuffix'];
		$sql = "select name from security$suffix.sec_city where code='$code'";
		return Yii::app()->db->createCommand($sql)->queryScalar();
	}
}
?>