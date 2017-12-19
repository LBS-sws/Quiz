<?php 
class DocMan {

	public $docType;
	
	public $docId;
	
	protected $baseDir;
		
	public function __construct($type, $id) {
		$this->docType = $type;
		$this->id = $id;
	}
	
	public function save($data) {
		$connection = Yii::app()->db;
		$transaction=$connection->beginTransaction();
		try {
			$this->saveMaster($connection, $data);
			$this->saveFile($connection, $data);
			$this->saveDetail($connection, $data);
			
			$transaction->commit();
		}
		catch(Exception $e) {
			$transaction->rollback();
			throw new CHttpException(404,'Cannot update.');
		}
	}
	
	protected function saveMaster(&$connection, $data) {
		$sql = '';
		switch ($type) {
			case 'delete':
				$sql = "delete from docman.dm_master where id = :id";
				break;
			default:
				$sql = "insert into docman.dm_master(doc_type_code, doc_id, lcu) 
						values (:doc_type_code, :doc_id, :lcu)
						on duplicate key update luu = :luu
					";
				break;
		}

		$uid = Yii::app()->user->id;

		$command=$connection->createCommand($sql);
		if (strpos($sql,':doc_type_code')!==false)
			$command->bindParam(':code',$this->docType,PDO::PARAM_STR);
		if (strpos($sql,':doc_id')!==false)
			$command->bindParam(':doc_id',$this->docId,PDO::PARAM_INT);
		if (strpos($sql,':id')!==false)
			$command->bindParam(':id',$data['id'],PDO::PARAM_INT);
		if (strpos($sql,':lcu')!==false)
			$command->bindParam(':lcu',$uid,PDO::PARAM_STR);
		if (strpos($sql,':luu')!==false)
			$command->bindParam(':luu',$uid,PDO::PARAM_STR);
		$command->execute();
	}
	
	protected function saveFile(&$connection, $type, $data) {
		$sql = '';
		switch ($type) {
			case 'delete':
				$sql = "update docman.dm_file set remove = 'Y' where id = :id";
				break;
			default:
				$sql = "insert into docman.dm_file
							(dm_mast_id, phy_file_name, phy_path_name,
							display_name, archive, remove, lcu)
						values 
							(:dm_mast_id, :phy_file_name, :phy_path_name,
							:display_name, 'N', 'N', :lcu)
					";
				break;
		}

		$uid = Yii::app()->user->id;

		$command=$connection->createCommand($sql);
		if (strpos($sql,':id')!==false)
			$command->bindParam(':id',$data['id'],PDO::PARAM_INT);
		if (strpos($sql,':dm_mast_id')!==false)
			$command->bindParam(':dm_mast_id',$data['dm_mast_id'],PDO::PARAM_INT);
		if (strpos($sql,':phy_file_name')!==false)
			$command->bindParam(':phy_file_name',$data['phy_file_name'],PDO::PARAM_STR);
		if (strpos($sql,':phy_path_name')!==false)
			$command->bindParam(':phy_path_name',$data['phy_path_name'],PDO::PARAM_STR);
		if (strpos($sql,':display_name')!==false)
			$command->bindParam(':display_name',$data['display_name'],PDO::PARAM_STR);
		if (strpos($sql,':lcu')!==false)
			$command->bindParam(':lcu',$uid,PDO::PARAM_STR);
		$command->execute();
	}
	
	protected function saveDetail(&$connection, $type, $data) {
		$sql = '';
		switch ($type) {
			case 'delete':
				$sql = "delete from docman.dm_detail where id = :id";
				break;
			default:
				$sql = "insert into dm_detail
							(dm_mast_id, field_code, field_value, lcu, luu)
						values 
							(:dm_mast_id, :field_code, :field_value, :lcu, :luu)
						on duplicate key
							field_value = :field_value,
							luu = :luu
					";
				break;
		}

		$uid = Yii::app()->user->id;

		foreach ($date as $record) {
			$command=$connection->createCommand($sql);
			if (strpos($sql,':id')!==false)
				$command->bindParam(':id',$record['id'],PDO::PARAM_INT);
			if (strpos($sql,':dm_master_id')!==false)
				$command->bindParam(':dm_mast_id',$record['doc_type_code'],PDO::PARAM_INT);
			if (strpos($sql,':field_code')!==false)
				$command->bindParam(':field_code',$record['field_code'],PDO::PARAM_STR);
			if (strpos($sql,':field_value')!==false)
				$command->bindParam(':field_value',$record['field_value'],PDO::PARAM_STR);
			if (strpos($sql,':lcu')!==false)
				$command->bindParam(':lcu',$uid,PDO::PARAM_STR);
			if (strpos($sql,':luu')!==false)
				$command->bindParam(':luu',$uid,PDO::PARAM_STR);
			$command->execute();
		}
	}

	public function retrieve() {
		$rtn = array();

		$type = $this->docType;
		$id = $this->docId;
		$sql = "select
					a.id, a.doc_type_code, a.doc_id, 
					b.id as file_id, b.display_name, b.archive, b.lcd, 
					c.id as field_id, c.field_code, c.field_value 
				from 
					docman.dm_master a inner join docman.dm_file b on a.id=b.mast_id 
					left outer join docman.dm_detail c on a.id=c.mast_id 
				where 
					a.doc_type_code='$type' and a.doc_id=$id and b.remove='N'
			";
		$rows = Yii::app()->db->createCommand($sql)->queryAll();
		if (count($rows) > 0) {
			$oid = 0;
			$temp = array();
			$orow = array();
			foreach ($rows as $row) {
				if ($oid == 0) $oid = $row['file_id'];
				if ($row['file_id'] != $oid) {
					$rtn[] = array(
								'id'=>$orow['id'],
								'doc_type_code'=>$orow['doc_type_code'],
								'doc_id'=>$orow['doc_id'],
								'file_id'=>$orow['file_id'],
								'display_name'=>$orow['display_name'],
								'archive'=>$orow['archive'],
								'detail'=>$temp,
							);
					$oid = $row['file_id'];
					$temp = array();
				} else {
					$orow = $row;
					$temp[$row['field_code']] = array('id'=>$row['field_id'],'value'=>$row['field_value']);
				}
			}
		}
		
		return $rtn;
	}

}
?>