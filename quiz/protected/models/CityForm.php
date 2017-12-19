<?php

class CityForm extends CFormModel
{
	/* User Fields */
	public $code;
	public $name;
	public $region;
	public $incharge;
	public $currency;

	protected $dynamic_fields = array(
								'currency',
							);
	
	/**
	 * Declares customized attribute labels.
	 * If not declared here, an attribute would have a label that is
	 * the same as its name with the first letter in upper case.
	 */
	public function attributeLabels()
	{
		return array(
			'code'=>Yii::t('code','Code'),
			'name'=>Yii::t('code','Name'),
			'region'=>Yii::t('code','Region'),
			'incharge'=>Yii::t('code','In Charge'),
			'currency'=>Yii::t('code','Currency'),
		);
	}

	/**
	 * Declares the validation rules.
	 */
	public function rules()
	{
		return array(
			array('code','unique','allowEmpty'=>false,
					'attributeName'=>'code',
					'caseSensitive'=>false,
					'className'=>'City',
					'on'=>'new',
				),
			array('name,code','required'),
			array('region,incharge,currency','safe'),
		);
	}

	public function retrieveData($index)
	{
		$suffix = Yii::app()->params['envSuffix'];
		$sql = "select * from security$suffix.sec_city where code='".$index."'";
		$row = Yii::app()->db->createCommand($sql)->queryRow();
		if ($row!==false) {
			$this->code = $row['code'];
			$this->name = $row['name'];
			$this->region = $row['region'];
			$this->incharge = $row['incharge'];
			
			$sql = "select * from security$suffix.sec_city_info where code='".$index."'";
			$rows = Yii::app()->db->createCommand($sql)->queryAll();
			if (count($rows) > 0) {
				foreach ($rows as $row) {
					if (in_array($row['field_id'],$this->dynamic_fields)) {
						$fieldid = $row['field_id'];
						$this->$fieldid = $row['field_value'];
					}
				}
			}
		}
		return true;
	}
	
	public function saveData()
	{
		$connection = Yii::app()->db;
		$transaction=$connection->beginTransaction();
		try {
			$this->saveCity($connection);
			$this->saveCityInfo($connection);
			$transaction->commit();
		}
		catch(Exception $e) {
			$transaction->rollback();
			throw new CHttpException(404,'Cannot update.');
		}
	}

	protected function saveCity(&$connection)
	{
		$suffix = Yii::app()->params['envSuffix'];
		$sql = '';
		switch ($this->scenario) {
			case 'delete':
				$sql = "delete from security$suffix.sec_city where code = :code";
				break;
			case 'new':
				$sql = "insert into security$suffix.sec_city(
						code, name, region, lcu, luu) values (
						:code, :name, :region, :lcu, :luu)";
				break;
			case 'edit':
				$sql = "update security$suffix.sec_city set 
					name = :name, 
					region = :region,
					incharge = :incharge, 
					luu = :luu
					where code = :code";
				break;
		}

		$uid = Yii::app()->user->id;

		$command=$connection->createCommand($sql);
		if (strpos($sql,':code')!==false)
			$command->bindParam(':code',$this->code,PDO::PARAM_STR);
		if (strpos($sql,':name')!==false)
			$command->bindParam(':name',$this->name,PDO::PARAM_STR);
		if (strpos($sql,':region')!==false)
			$command->bindParam(':region',$this->region,PDO::PARAM_STR);
		if (strpos($sql,':incharge')!==false)
			$command->bindParam(':incharge',$this->incharge,PDO::PARAM_STR);
		if (strpos($sql,':lcu')!==false)
			$command->bindParam(':lcu',$uid,PDO::PARAM_STR);
		if (strpos($sql,':luu')!==false)
			$command->bindParam(':luu',$uid,PDO::PARAM_STR);
		$command->execute();

		return true;
	}

	protected function saveCityInfo(&$connection)
	{
		$suffix = Yii::app()->params['envSuffix'];
		$sql = '';
		switch ($this->scenario) {
			case 'delete':
				$sql = "delete from security$suffix.sec_city_info where code = :code";
				break;
			default:
				$sql = "insert into security$suffix.sec_city_info(
						code, field_id, field_value, lcu, luu) values (
						:code, :field_id, :field_value, :lcu, :luu)
						on duplicate key
						update field_value=:field_value, luu=:luu
					";
				break;
		}

		$uid = Yii::app()->user->id;

		foreach ($this->dynamic_fields as $field_id) {
			$command=$connection->createCommand($sql);
			if (strpos($sql,':code')!==false)
				$command->bindParam(':code',$this->code,PDO::PARAM_STR);
			if (strpos($sql,':field_id')!==false)
				$command->bindParam(':field_id',$field_id,PDO::PARAM_STR);
			$value = $this->$field_id;
			if (strpos($sql,':field_value')!==false)
				$command->bindParam(':field_value',$value,PDO::PARAM_STR);
			if (strpos($sql,':lcu')!==false)
				$command->bindParam(':lcu',$uid,PDO::PARAM_STR);
			if (strpos($sql,':luu')!==false)
				$command->bindParam(':luu',$uid,PDO::PARAM_STR);
			$command->execute();
		}	

		return true;
	}

	public function isOccupied($index) {
		$rtn = false;
		$suffix = Yii::app()->params['envSuffix'];
		$sql = "select a.username from security$suffix.sec_user a where a.city='".$index."' limit 1";
		$rows = Yii::app()->db->createCommand($sql)->queryAll();
		foreach ($rows as $row) {
			$rtn = true;
			break;
		}
		return $rtn;
	}
	
	public function getCityInChargeList() {
		$rtn = array();
		$suffix = Yii::app()->params['envSuffix'];
		$city = $this->code;
		$sql = "select a.username, a.disp_name 
				from security$suffix.sec_user a
				where a.city = '$city' 
				and a.status='A' 
				order by a.disp_name
			";
		$rows = Yii::app()->db->createCommand($sql)->queryAll();
		foreach ($rows as $row) {
			$rtn[$row['username']] = $row['disp_name'];
		}
		return $rtn;
	}
}