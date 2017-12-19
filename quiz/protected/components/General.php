<?php
// Common Functions

class General {
	public static function toDate($value) {
		return (empty($value) || $value==0) ? '' :
			date_format(date_create($value),"Y/m/d");
	}

	public static function toDateTime($value) {
		return (empty($value) || $value==0) ? '' :
			date_format(date_create($value),"Y/m/d H:i:s");
	}

	public static function toMyDate($value) {
		return (empty($value) || $value==0) ? null :
			date_format(date_create($value),"Y-m-d");
	}
	
	public static function toMyNumber($value) {
		return (empty($value) || $value==0 || !is_numeric($value)) ? null : $value;
	}

	public static function isDate($i_sDate) {
	/*
		function isDate
		boolean isDate(string)
		Summary: checks if a date is formatted correctly: mm/dd/yyyy (US English)
		Author: Laurence Veale (modified by Sameh Labib)
		Date: 07/30/2001
	*/
 
		$blnValid = TRUE;
   
		if ( $i_sDate == "0000/00/00" ) { return $blnValid; }
   
	// check the format first (may not be necessary as we use checkdate() below)
		if(!ereg ("^[0-9]{4}/[0-9]{2}/[0-9]{2}$", $i_sDate)) {
			$blnValid = FALSE;
		} else {
	//format is okay, check that days, months, years are okay
			$arrDate = explode("/", $i_sDate); // break up date by slash
			$intMonth = $arrDate[1];
			$intDay = $arrDate[2];
			$intYear = $arrDate[0];
 
			$intIsDate = checkdate($intMonth, $intDay, $intYear);
     
			if(!$intIsDate) {
				$blnValid = FALSE;
			}
		}//end else
   
		return ($blnValid);
	} //end function isDate

	public static function isJSON($sting) {
		call_user_func_array('json_decode',func_get_args());
		return (json_last_error()===JSON_ERROR_NONE);
	}
	
	public static function getSqlConditionClause($field, $value)
	{
		$return = '';
		if (!empty($field)){
			$val = trim($value);
			if (substr($val,0,1)=='"' && substr($val,-1)=='"') {
				$return = "and ".$field." = '" . substr(substr($val,1),0,-1) . "' ";
			} else {
				$return = "and ".$field." like '%" . $value . "%' ";
			}
		}
		return $return;
	}
	
	public static function getGroupList()
	{
		$list = array(0=>Yii::t('misc','-- None --'));
		$sql = "select group_id, group_name from swo_group where group_id <> 1 order by group_name";
		$rows = Yii::app()->db->createCommand($sql)->queryAll();
		if (count($rows) > 0) {
			foreach ($rows as $row) {
				$list[$row['group_id']] = $row['group_name'];
			}
		}
		return $list;
	}
	
	public static function getStaffList()
	{
		$list = array(0=>Yii::t('misc','-- None --'));
		$sql = "select id, name from swo_staff 
			where leave_dt is null or leave_dt=0 or leave_dt > now()  
			order by name ";
		$rows = Yii::app()->db->createCommand($sql)->queryAll();
		if (count($rows) > 0) {
			foreach ($rows as $row) {
				$list[$row['id']] = $row['name'];
			}
		}
		
		$sql = "select id, name from swo_staff 
			where leave_dt is not null and leave_dt<>0 and leave_dt <= now()  
			order by name ";
		$rows = Yii::app()->db->createCommand($sql)->queryAll();
		if (count($rows) > 0) {
			foreach ($rows as $row) {
				$list[$row['id']] = Yii::t('app','(Resign)').' '.$row['name'];
			}
		}
		
		return $list;
	}

	public static function getCustomerList()
	{
		$list = array(0=>Yii::t('misc','-- None --'));
		$sql = "select id, name from swo_company order by name";
		$rows = Yii::app()->db->createCommand($sql)->queryAll();
		if (count($rows) > 0) {
			foreach ($rows as $row) {
				$list[$row['id']] = $row['name'];
			}
		}
		return $list;
	}
	
	public static function getNatureList()
	{
		$list = array();
		$sql = "select id, description from swo_nature order by id";
		$rows = Yii::app()->db->createCommand($sql)->queryAll();
		if (count($rows) > 0) {
			foreach ($rows as $row) {
				$list[$row['id']] = $row['description'];
			}
		}
		return $list;
	}

	public static function getCustTypeList()
	{
		$list = array();
		$sql = "select id, description from swo_customer_type order by description";
		$rows = Yii::app()->db->createCommand($sql)->queryAll();
		if (count($rows) > 0) {
			foreach ($rows as $row) {
				$list[$row['id']] = $row['description'];
			}
		}
		return $list;
	}

	public static function getLocationList()
	{
		$city = Yii::app()->user->city();
		$list = array();
		$sql = "select id, description from swo_location where city='".$city."'  order by id";
		$rows = Yii::app()->db->createCommand($sql)->queryAll();
		if (count($rows) > 0) {
			foreach ($rows as $row) {
				$list[$row['id']] = $row['description'];
			}
		}
		return $list;
	}

	public static function getTaskList()
	{
		$city = Yii::app()->user->city();
		$list = array(0=>Yii::t('misc','-- None --'));
		$sql = "select id, description from swo_task where city='".$city."' order by id";
		$rows = Yii::app()->db->createCommand($sql)->queryAll();
		if (count($rows) > 0) {
			foreach ($rows as $row) {
				$list[$row['id']] = $row['description'];
			}
		}
		return $list;
	}

	public static function getCityList()
	{
		$list = array();
		$suffix = Yii::app()->params['envSuffix'];
		$sql = "select code, name from security$suffix.sec_city order by name";
		$rows = Yii::app()->db->createCommand($sql)->queryAll();
		if (count($rows) > 0) {
			foreach ($rows as $row) {
				$list[$row['code']] = $row['name'];
			}
		}
		return $list;
	}

	public static function getCityListWithNoDescendant($city_allow='') {
		$list = array();
		$suffix = Yii::app()->params['envSuffix'];
		$clause = !empty($city_allow) ? "and a.code in ($city_allow)" : "";
		$sql = "select distinct a.code, a.name from security$suffix.sec_city a 
					left outer join security$suffix.sec_city b on a.code=b.region 
					where b.code is null 
					$clause 
					order by a.code
			";
		$rows = Yii::app()->db->createCommand($sql)->queryAll();
		if (count($rows) > 0) {
			foreach ($rows as $row) {
				$list[$row['code']] = $row['name'];
			}
		}
		return $list;
	}
	
	public static function getMgrFeedbackList()
	{
		$list = array();
		$suffix = Yii::app()->params['envSuffix'];
		$sysid = Yii::app()->user->system();
		$sql = "select a.username, a.disp_name, a.email 
				from security$suffix.sec_user a, security$suffix.sec_user_access b
				where a.username = b.username
				and b.system_id = '$sysid' 
				and	a.city='".Yii::app()->user->city()."' 
				and b.a_read_write like '%A08%' 
				and a.email is not null and a.email<>''
				and a.status='A' 
				order by a.disp_name
		";
		$rows = Yii::app()->db->createCommand($sql)->queryAll();
		if (count($rows) > 0) {
			foreach ($rows as $row) {
				$list[$row['username']] = $row['disp_name'].' ('.$row['email'].')';
			}
		}
		return $list;
	}

	public static function getFeedbackCatList() {
		$list = array();
		$model = new FeedbackForm;
		$rows = $model->cats;
		foreach ($rows as $key=>$value) {
			$list[$key] = Yii::t('app',$value);
		}
		return $list;
	}
	
	public static function getEmailListboxData()
	{
		$list = array();
		$city = Yii::app()->user->city();
		$cities = City::model()->getAncestorList($city);
		$cities .= ($cities=='') ? "'$city'" : ",'$city'";
		$suffix = Yii::app()->params['envSuffix'];
		$sql = "select a.username, a.disp_name, a.email 
				from security$suffix.sec_user a
				where a.city in ($cities) 
				and a.email is not null and a.email<>''
				and a.status='A' 
				order by a.disp_name
		";
		$rows = Yii::app()->db->createCommand($sql)->queryAll();
		if (count($rows) > 0) {
			foreach ($rows as $row) {
				$list[$row['username']] = $row['disp_name'].' ('.$row['email'].')';
			}
		}
		return $list;
	}

	public static function getServiceTypeList($descOnly=false)
	{
		$list = array();
		$sql = "select id, description from swo_service_type order by description";
		$rows = Yii::app()->db->createCommand($sql)->queryAll();
		if (count($rows) > 0) {
			foreach ($rows as $row) {
				if ($descOnly)
					$list[$row['description']] = $row['description'];
				else
					$list[$row['id']] = $row['description'];
			}
		}
		return $list;
	}

	public static function getStatusDesc($invalue) {
		switch ($invalue) {
			case 'N':
				return Yii::t('app','New');
				break;
			case 'A':
				return Yii::t('app','Amend');
				break;
			case 'R':
				return Yii::t('app','Resume');
				break;
			case 'S':
				return Yii::t('app','Suspend');
				break;
			case 'T':
				return Yii::t('app','Terminate');
				break;
			case 'C':
				return Yii::t('app','Renew');
				break;
			default:
				return '';
		}
	}
	
	public static function getActiveStatusDesc($invalue) {
		switch ($invalue) {
			case 'I':
				return Yii::t('app','Inactive');
				break;
			case 'A':
				return Yii::t('app','Active');
				break;
			default:
				return '';
		}
	}

	public static function getJobStatusDesc($invalue) {
		switch ($invalue) {
			case 'P':
				return Yii::t('app','Pending');
				break;
			case 'I':
				return Yii::t('app','In Progress');
				break;
			case 'C':
				return Yii::t('app','Complete');
				break;
			case 'F':
				return Yii::t('app','Fail');
				break;
			case 'E':
				return Yii::t('app','Sent');
				break;
			default:
				return '';
		}
	}
	
	public static function getStaffTypeDesc($invalue) {
		switch ($invalue) {
			case 'OFFICE':
				return Yii::t('staff','Office');
				break;
			case 'SALES':
				return Yii::t('staff','Sales');
				break;
			case 'TECHNICIAN':
				return Yii::t('staff','Technician');
				break;
			case 'OTHER':
				return Yii::t('staff','Others');
				break;
			default:
				return '';
		}
	}

	public static function getLeaderDesc($invalue) {
		switch ($invalue) {
			case 'NIL':
				return Yii::t('staff','Nil');
				break;
			case 'GROUP':
				return Yii::t('staff','Group Leader');
				break;
			case 'TEAM':
				return Yii::t('staff','Team Leader');
				break;
			default:
				return '';
		}
	}

	public static function getPayMethodDesc($invalue) {
		switch ($invalue) {
			case 'MONTHLY':
				return Yii::t('logistic','Monthly');
				break;
			case 'QUARTERLY':
				return Yii::t('logistic','Quarterly');
				break;
			case 'COD':
				return Yii::t('logistic','COD');
				break;
			case 'CBD':
				return Yii::t('logistic','CBD');
				break;
			case 'FREE':
				return Yii::t('logistic','Free');
				break;
			default:
				return '';
		}
	}

	public static function getSourceDesc($invalue) {
		switch ($invalue) {
			case '1':
				return Yii::t('enquiry','Phone Call');
				break;
			case '2':
				return Yii::t('enquiry','Refer By Staff');
				break;
			case '3':
				return Yii::t('enquiry','400 Customer');
				break;
			case '4':
				return Yii::t('enquiry','Others');
				break;
			default:
				return '';
		}
	}
	
	public static function getFeedbackStatusDesc($invalue) {
		switch ($invalue) {
			case 'Y':
				return Yii::t('feedback','Done');
				break;
			case 'N':
				return Yii::t('feedback','Not Yet');
				break;
			default:
				return '';
		}
	}

	public static function getEmailByUserId($uid) {
		$suffix = Yii::app()->params['envSuffix'];
		$sql = "select email from security$suffix.sec_user where username='".$uid."'";
		$row = Yii::app()->db->createCommand($sql)->queryRow();
		return (isset($row['email']))?$row['email']:'';
	}

	public static function getEmailByUserIdArray($uids) {
		$rtn = array();
		if (is_array($uids)) {
			foreach ($uids as $uid) {
				$rtn[] = self::getEmailByUserId($uid);
			}
		}
		return $rtn;
	}

	public static function dedupToEmailList($to) {
		if (empty($to) || !is_array($to))
			return $to;
		else {
			$rtn = array();
			$email = array_pop($to);
			while ($email !== null) {
				if (!empty($email) && !in_array($email,$to)) $rtn[] = $email;
				$email = array_pop($to);
			} 
			return array_reverse($rtn);
		}
	}
	
	public static function dedupCcEmailList($cc, $to) {
		if (empty($cc) || !is_array($cc))
			return $cc;
		else {
			$rtn = array();
			$email = array_pop($cc);
			while ($email !== null) {
				if (!empty($email) && !in_array($email,$cc)) {
					if (empty($to)) {
						$rtn[] = $email;
					} else {
						if (!is_array($to)) {
							if ($to!=$email) $rtn[] = $email;
						} else {
							if (!in_array($email,$to)) $rtn[]= $email;
						}
					}
				}
				$email = array_pop($cc);
			} 
			return array_reverse($rtn);
		}
	}

	public static function getCityName($code) {
		$suffix = Yii::app()->params['envSuffix'];
		$sql = "select name from security$suffix.sec_city where code='$code'";
		return Yii::app()->db->createCommand($sql)->queryScalar();
	}

	public function getInstalledSystemList() {
		$rtn = array();
		$systems = Yii::app()->params['systemMapping'];
		foreach ($systems as $key=>$value) {
			$rtn[$key] = Yii::t('app',$value['name']);
		}
		return $rtn;
	}

	public function getInstalledSystemFunctions() {
		$rtn = array();
		$sysid = Yii::app()->user->system();
		$basePath = Yii::app()->basePath;
		$systems = Yii::app()->params['systemMapping'];
		$cpathid = end(explode('/',$systems[$sysid]['webroot']));
		foreach ($systems as $key=>$value) {
			$rtn[$key] = array('name'=>$value['name'], 'item'=>array());
			$pathid = end(explode('/',$systems[$key]['webroot']));
			$confFile = ((strpos($basePath, '/'.$pathid.'/')===false) ? str_replace('/'.$cpathid.'/','/'.$pathid.'/',$basePath) : $basePath).'/config/menu.php';
			$menuitems = require($confFile);
			foreach ($menuitems as $group=>$items) {
				foreach ($items['items'] as $k=>$v){
					$aid = $v['access'];
					$rtn[$key]['item'][$group][$aid]['name'] = $k;
					$rtn[$key]['item'][$group][$aid]['tag'] = isset($v['tag']) ? $v['tag'] : '';
				}
			}
			
			$confFile = ((strpos($basePath, '/'.$pathid.'/')===false) ? str_replace('/'.$cpathid.'/','/'.$pathid.'/',$basePath) : $basePath).'/config/control.php';
			if (file_exists($confFile)) {
				$cntitems = require($confFile);
				foreach ($cntitems as $name=>$items) {
					$aid = $items['access'];
					$rtn[$key]['item']['zzcontrol'][$aid]['name'] = $name;
					$rtn[$key]['item']['zzcontrol'][$aid]['tag'] = '';
				}
			}
		}
		return $rtn;
	}

	public function getLocaleAppLabels() {
		$rtn = array();
		$sysid = Yii::app()->user->system();
		$basePath = Yii::app()->basePath;
		$lang = Yii::app()->language;
		if (Yii::app()->sourceLanguage!=$lang) {
			$systems = Yii::app()->params['systemMapping'];
			$cpathid = end(explode('/',$systems[$sysid]['webroot']));
			foreach ($systems as $key=>$value) {
				$pathid = end(explode('/',$systems[$key]['webroot']));
				$msgFile = ((strpos($basePath, '/'.$pathid.'/')===false) ? str_replace('/'.$cpathid.'/','/'.$pathid.'/',$basePath) : $basePath)
					.'/messages/'.$lang.'/app.php';
				$tmp = require($msgFile);
				$rtn = array_merge($rtn, $tmp);
			}
		}
		return $rtn;
	}
}

?>
