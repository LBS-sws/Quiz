 <?php
class MonthlyCommand extends CConsoleCommand {
	protected $webroot;

	protected $year;
	protected $month;
	
//
// Initiate Records in Database for Monthly Report
// TABLE: swo_monthly_hdr, swo_monthly_dtl
//	
	public function actionInitRecord($year='', $month='') {
		$this->year = (empty($year)) ? date('Y') : $year;
		$this->month = (empty($month)) ? date('m') : $month;
		echo "YEAR: ".$this->year."\tMONTH: ".$this->month."\n";

		$suffix = Yii::app()->params['envSuffix'];
		$sql = "select a.code
				from security$suffix.sec_city a left outer join security$suffix.sec_city b on a.code=b.region 
				where b.code is null 
				order by a.code
			";
		$rows = Yii::app()->db->createCommand($sql)->queryAll();
		if (count($rows) > 0) {
			foreach ($rows as $row) {
				$city = $row['code'];
				echo "CITY: $city\n";
				$sql = "select count(id) from swo_monthly_hdr 
						where city='$city' and year_no=".$this->year." and month_no=".$this->month
					;
				$rc = Yii::app()->db->createCommand($sql)->queryScalar();
				if ($rc!==false && $rc==0) {
					echo "RECORD INIT...\n";
					$connection = Yii::app()->db;
					$transaction=$connection->beginTransaction();
				
					try {
						$hid = $this->addHeader($connection, $city);
						$this->addDetail($connection, $hid);
						$transaction->commit();
					} catch(Exception $e) {
						$transaction->rollback();
						echo "EXCEPTION ERROR: ".$e->getMessage()."\n";
						Yii::app()->end();
					}
				}
			}
		}
	}
	
	// Add monthly header records
	protected function addHeader(&$connection, $city) {
		$sql = "insert into swo_monthly_hdr(city, year_no, month_no, status, lcu, luu) 
				values(:city, :year, :month, 'Y', :uid, :uid)
			";
		$uid = 'admin';
		$command=$connection->createCommand($sql);
		if (strpos($sql,':city')!==false) $command->bindParam(':city',$city,PDO::PARAM_STR);
		if (strpos($sql,':year')!==false) $command->bindParam(':year',$this->year,PDO::PARAM_INT);
		if (strpos($sql,':month')!==false) $command->bindParam(':month',$this->month,PDO::PARAM_INT);
		if (strpos($sql,':uid')!==false) $command->bindParam(':uid',$uid,PDO::PARAM_STR);
		$command->execute();
		return Yii::app()->db->getLastInsertID();
	}
	
	// Add monthly detail records
	protected function addDetail(&$connection, $hid) {
		$select = "select code from swo_monthly_field 
					where status='Y'
					order by code
				";
		$rows = Yii::app()->db->createCommand($select)->queryAll();
		if (count($rows) > 0) {
			foreach ($rows as $row) {
				$sql = "insert into swo_monthly_dtl(hdr_id, data_field, lcu, luu) 
						values(:hid, :code, :uid, :uid)
					";
				$uid = 'admin';
				$command=$connection->createCommand($sql);
				if (strpos($sql,':hid')!==false) $command->bindParam(':hid',$hid,PDO::PARAM_INT);
				if (strpos($sql,':code')!==false) $command->bindParam(':code',$row['code'],PDO::PARAM_STR);
				if (strpos($sql,':uid')!==false) $command->bindParam(':uid',$uid,PDO::PARAM_STR);
				$command->execute();
			}
		}
	}
	
//
// Calculate Monthly Statistics and Store the Results in Database
//	
	public function actionCalculate($year='', $month='', $lastmonth='N') {
		if ($lastmonth=='Y') {
			$this->year = date('Y', strtotime('-1 month'));
			$this->month = date('m', strtotime('-1 month'));
		} else {
			$this->year = (empty($year)) ? date('Y') : $year;
			$this->month = (empty($month)) ? date('m') : $month;
		}
		echo "YEAR: ".$this->year."\tMONTH: ".$this->month."\n";

		$header = $this->getHeaderIdList();
		$funclist = $this->getItemProcedureList();
		foreach ($funclist as $code=>$func) {
			if ($func!=null) {
				echo "CODE: $code\n";
				$func_name = '';
				$params = array($this->year, $this->month);
				$args = explode(',',$func);
				foreach ($args as $i=>$item) {
					if ($i==0) {
						$func_name = $item;
					} else {
						$params[] = $item;
					}
				}
				$this->resetStatistic($code, $this->year, $this->month);
				$result = call_user_func_array($func_name, $params);
				if (!empty($result)) $this->saveStatistic($code, $header, $result);
			}
		}
		$this->fillEmptyFieldtoZero($this->year, $this->month);
	}
	
	protected function getHeaderIdList() {
		$rtn = array();
		$sql = "select city, id from swo_monthly_hdr 
				where year_no=".$this->year." and month_no=".$this->month;
		$rows = Yii::app()->db->createCommand($sql)->queryAll();
		if (count($rows) > 0) {
			foreach ($rows as $row) $rtn[$row['city']] = $row['id'];
		}
		return $rtn;
	}
	
	protected function getItemProcedureList() {
		$rtn = array();
		$sql = "select code, function_name from swo_monthly_field 
				where status='Y' and function_name is not null order by code
			";
		$rows = Yii::app()->db->createCommand($sql)->queryAll();
		if (count($rows) > 0) {
			foreach ($rows as $row) $rtn[$row['code']] = $row['function_name'];
		}
		return $rtn;
	}
	
	protected function fillEmptyFieldtoZero($year, $month) {
		$sql = "update swo_monthly_dtl set data_value='0' 
				where data_field in (select code from swo_monthly_field where status='Y' and field_type='N' and upd_type='Y')
				and data_value is null or trim(data_value)=''
				and hdr_id in (select id from swo_monthly_hdr where year_no=$year and month_no=$month and status='Y')
			";
		try {
			Yii::app()->db->createCommand($sql)->execute();
		} catch(Exception $e) {
			echo "EXCEPTION ERROR: ".$e->getMessage()."\n";
		}
	}
	
	protected function resetStatistic($code, $year, $month) {
		$sql = "select field_type, upd_type from swo_monthly_field where code='$code' and status='Y'";
		$row = Yii::app()->db->createCommand($sql)->queryRow();
		if ($row!==false) {
			if ($row['upd_type']=='Y') {
				$value = ($row['field_type']=='N' ? '0' : '');
				$sql = "update swo_monthly_dtl set data_value='$value' 
						where data_field='$code' 
						and hdr_id in (select id from swo_monthly_hdr where year_no=$year and month_no=$month and status='Y')
						and manual_input <> 'Y' 
					";
				try {
					Yii::app()->db->createCommand($sql)->execute();
				} catch(Exception $e) {
					echo "EXCEPTION ERROR: ".$e->getMessage()."\n";
				}
			}
		}
	}
	
	protected function saveStatistic($field, $header, $result) {
		if (!empty($result)) {
			$sql = "update swo_monthly_dtl set data_value=:value
					where hdr_id=:hid and data_field=:field and manual_input='N' 
				";
			foreach ($result as $city=>$value) {
				if (isset($header[$city])) {
					echo "CITY: $city VALUE: $value ... saving \n";
					$hid = $header[$city];
					try {
						$command=Yii::app()->db->createCommand($sql);
						if (strpos($sql,':hid')!==false)
							$command->bindParam(':hid',$hid,PDO::PARAM_INT);
						if (strpos($sql,':field')!==false)
							$command->bindParam(':field',$field,PDO::PARAM_STR);
						if (strpos($sql,':value')!==false)
							$command->bindParam(':value',$value,PDO::PARAM_STR);
						$cnt = $command->execute();
					} catch(Exception $e) {
						echo "EXCEPTION ERROR: ".$e->getMessage()."\n";
					}
				}
			}
		}
	}
}
?>