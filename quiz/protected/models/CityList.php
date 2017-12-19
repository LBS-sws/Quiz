<?php

class CityList extends CListPageModel
{
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
			'region_name'=>Yii::t('code','Region'),
			'incharge'=>Yii::t('code','In Charge'),
		);
	}
	
	public function retrieveDataByPage($pageNum=1)
	{
		$suffix = Yii::app()->params['envSuffix'];
		$sql1 = "select a.*, b.name as region_name, c.disp_name as incharge 
				from security$suffix.sec_city a left outer join security$suffix.sec_city b on a.region=b.code 
					left outer join security$suffix.sec_user c on a.incharge= c.username 
				where 1=1 
			";
		$sql2 = "select count(a.code)
				from security$suffix.sec_city a left outer join security$suffix.sec_city b on a.region=b.code 
					left outer join security$suffix.sec_user c on a.incharge= c.username 
				where 1=1 
			";
		$clause = "";
		if (!empty($this->searchField) && !empty($this->searchValue)) {
			$svalue = str_replace("'","\'",$this->searchValue);
			switch ($this->searchField) {
				case 'code':
					$clause .= General::getSqlConditionClause('a.code',$svalue);
					break;
				case 'name':
					$clause .= General::getSqlConditionClause('a.name',$svalue);
					break;
				case 'region_name':
					$clause .= General::getSqlConditionClause('b.name',$svalue);
					break;
				case 'incharge':
					$clause .= General::getSqlConditionClause('c.disp_name',$svalue);
					break;
			}
		}
		
		$order = "";
		if (!empty($this->orderField)) {
			switch ($this->orderField) {
				case 'code':
					$order .= " order by a.code ";
					break;
				case 'name':
					$order .= " order by a.name ";
					break;
				case 'region_name':
					$order .= " order by b.name ";
					break;
				case 'incharge':
					$order .= " order by c.disp_name ";
					break;
			}
			if ($this->orderType=='D') $order .= "desc ";
		}

		$sql = $sql2.$clause;
		$this->totalRow = Yii::app()->db->createCommand($sql)->queryScalar();
		
		$sql = $sql1.$clause.$order;
		$sql = $this->sqlWithPageCriteria($sql, $this->pageNum);
		$records = Yii::app()->db->createCommand($sql)->queryAll();
		
		$list = array();
		$this->attr = array();
		if (count($records) > 0) {
			foreach ($records as $k=>$record) {
					$this->attr[] = array(
						'code'=>$record['code'],
						'name'=>$record['name'],
						'region_name'=>$record['region_name'],
						'incharge'=>$record['incharge'],
					);
			}
		}
		$session = Yii::app()->session;
		$session['criteria_c05'] = $this->getCriteria();
		return true;
	}

}
