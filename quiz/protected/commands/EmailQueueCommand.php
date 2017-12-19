 <?php
class EmailQueueCommand extends CConsoleCommand {
	protected $webroot;

/*	public function index(){
		echo 'demo study';
	}


	public function demo(){
		$sql="select * from demo where id>:0;";
		$result=Yii::app()->db->createCommand($sql)->queryAll();
		if($result){
			return '1';
		}
		else{
			return '2';
		}
	}*/
	public function run($args) {
		$this->webroot = Yii::app()->params['webroot'];
		$sql = "select a.id, a.ts, a.from_addr, a.to_addr, a.cc_addr, 
					a.subject, a.description, a.message, a.lcu  
				from swo_email_queue a
				where a.status='P' and (a.request_dt <= now() or a.request_dt is null) order by a.lcd limit 1";
		$rows = Yii::app()->db->createCommand($sql)->queryAll();
		if (count($rows) > 0) {
			$id = 0;
			$ts = '';
			$from_addr = '';
			$to_addr = array();
			$cc_addr = array();
			$subject = '';
			$description = '';
			$message = '';
			$uid = '';
			
			foreach ($rows as $row) {
				$id = $row['id'];
				$ts = $row['ts'];
				$from_addr = $row['from_addr'];
				if (strpos($row['to_addr'],'[')!==false) {
					$to_addr = json_decode($row['to_addr']);
				} elseif (strpos($row['to_addr'],',')!==false) {
					$to_addr = explode(',', $row['to_addr']);
				} else {
					$to_addr = array($row['to_addr']);
				}
				if (strpos($row['cc_addr'],'[')!==false) {
					$cc_addr = json_decode($row['cc_addr']);
				} elseif (strpos($row['cc_addr'],',')!==false) {
					$cc_addr = explode(',', $row['cc_addr']);
				} else {
					$cc_addr = array($row['cc_addr']);
				}
				$subject = $row['subject'];
				$description = $row['description'];
				$message = $row['message'];
				$uid = $row['lcu'];
				break;
			}
			
			if (($id!=0) && !empty($to_addr) && $this->markStatus($id, $ts, 'I')) {
				$ts = $this->getTimeStamp($id);
				
				$attachment = array();
				$sql = "select * from swo_email_queue_attm where queue_id=$id";
				$attms = Yii::app()->db->createCommand($sql)->queryAll();
				if (!empty($attms)) {
					foreach ($attms as $attm) {
						$tmpfname = tempnam("/tmp", "mail");
						$handle = fopen($tmpfname, "w");
						fwrite($handle, $attm['content']);
						fclose($handle);
						$attachment[$tmpfname] = $attm['name'];
					}
				}
			
				$to_addr = General::dedupToEmailList($to_addr);
				$cc_addr = General::dedupCcEmailList($cc_addr, $to_addr);
				
				$to_str = implode(',',$to_addr);
				$cc_str = implode(',',$cc_addr);
				$mesg = "ID:$id USER:$uid FROM:$from_addr TO:$to_str CC:$cc_str\n";
				echo $mesg;
				
				$mail = new YiiMailer;

				$mail->setView('report');
				$data = array('message' => $message, 'description'=>$description, 'mailer'=>$mail);
				$mail->setData($data);

				$mail->setFrom($from_addr);
				$mail->setSubject($subject);
				$mail->setTo($to_addr);
				$mail->setCc($cc_addr);
				$mail->addBCC('system@lbsgroup.com.cn');
				if (!empty($attachment)) $mail->setAttachment($attachment);
				$rtn = $mail->send();

				if (!empty($attachment)) {
					foreach($attachment as $fname=>$content) {
						unlink($fname);
					}
				}

				if ($rtn) {
					$this->markStatus($id, $ts, 'C');
					echo "\t-SUCCESS\n";
				} else {
					$err = $mail->getError();
					echo "\t-FAIL ($err)\n";
					$this->markStatus($id, $ts, 'F');
				}
			} else {
				if (empty($to_addr) && $id!=0) {
					echo "\t-FAIL empty address\n";
					$ts = $this->getTimeStamp($id);
					$this->markStatus($id, $ts, 'F');
				}
			}
		}
	}
	
	protected function markStatus($id, $ts, $sts) {
		$sql = "update swo_email_queue set status=:status where id=:id and ts=:ts";
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
	
	protected function getTimeStamp($id) {
		$ts = '';
		$sql = "select ts from swo_email_queue where id=".$id;
		$rows = Yii::app()->db->createCommand($sql)->queryAll();
		if (count($rows) > 0) {
			foreach ($rows as $row) {
				$ts = $row['ts'];
				break;
			}
		}
		return $ts;
	}
}
?>