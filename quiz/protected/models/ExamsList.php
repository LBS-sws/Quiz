<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/19 0019
 * Time: 16:18
 */

class LogisticList extends CListPageModel
{
    /**
     * Declares customized attribute labels.
     * If not declared here, an attribute would have a label that is
     * the same as its name with the first letter in upper case.
     */
    public function attributeLabels()
    {
        return array(
            'log_dt'=>Yii::t('logistic','Date'),
            'seq'=>Yii::t('logistic','No.'),
            'company_name'=>Yii::t('logistic','Customer'),
            'follow_staff'=>Yii::t('logistic','Resp. Staff'),
            'pay_method'=>Yii::t('logistic','Payment Method'),
            'location_desc'=>Yii::t('logistic','Location'),
            'finish'=>Yii::t('logistic','Finished'),
            'deadline'=>Yii::t('logistic','Deadline'),
            'city_name'=>Yii::t('misc','City'),
        );
    }

    public function retrieveDataByPage($pageNum=1)
    {
        $suffix = Yii::app()->params['envSuffix'];
        $city = Yii::app()->user->city_allow();
        $sql1 = "select a.*, b.description as location_desc, c.name as city_name
				from (swo_logistic a inner join security$suffix.sec_city c on a.city=c.code)
					left outer join swo_location b on a.location=b.id
				where a.city in ($city)
			";
        $sql2 = "select count(a.id)
				from (swo_logistic a inner join security$suffix.sec_city c on a.city=c.code)
					left outer join swo_location b on a.location=b.id
				where a.city in ($city)
			";
        $clause = "";
        if (!empty($this->searchField) && !empty($this->searchValue)) {
            $svalue = str_replace("'","\'",$this->searchValue);
            switch ($this->searchField) {
                case 'city_name':
                    $clause .= General::getSqlConditionClause('c.name',$svalue);
                    break;
                case 'log_dt':
                    $clause .= "and a.log_dt = '" . $svalue . "' ";
                    break;
                case 'company_name':
                    $clause .= General::getSqlConditionClause('a.company_name',$svalue);
                    break;
                case 'follow_staff':
                    $clause .= General::getSqlConditionClause('a.follow_staff',$svalue);
                    break;
                case 'location_desc':
                    $clause .= General::getSqlConditionClause('b.description',$svalue);
                    break;
                case 'pay_method':
                    $clause .= General::getSqlConditionClause('a.pay_method',$svalue);
                    break;
                case 'deadline':
                    $clause .= "and a.deadline = '" . $svalue . "' ";
                    break;
            }
        }

        $order = "";
        if (!empty($this->orderField)) {
            $order .= " order by ".$this->orderField." ";
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
                    'id'=>$record['id'],
                    'log_dt'=>General::toDate($record['log_dt']),
                    'seq'=>$record['seq'],
                    'company_name'=>$record['company_name'],
                    'follow_staff'=>$record['follow_staff'],
                    'location_desc'=>((empty($record['location_desc']) ? '' : $record['location_desc']).
                        ' '.(empty($record['location_dtl']) ? '' : '('.$record['location_dtl'].')')),
                    'pay_method'=>General::getPayMethodDesc($record['pay_method']),
                    'finish'=>($record['finish']=='Y'?Yii::t('misc','Yes'):Yii::t('misc','No')),
                    'deadline'=>$record['deadline'],
                    'city_name'=>$record['city_name'],
                );
            }
        }
        $session = Yii::app()->session;
        $session['criteria_a05'] = $this->getCriteria();
        return true;
    }

}
