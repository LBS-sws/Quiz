<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/14 0014
 * Time: 11:05
 */
header("Content-type: text/html; charset=utf-8");
class QuestionsList extends CListPageModel
{

    /**
     * Declares customized attribute labels.
     * If not declared here, an attribute would have a label that is
     * the same as its name with the first letter in upper case.
     */
    public function attributeLabels()
    {
        return array(
            'test_exams_contents'=>Yii::t('quiz','test_exams_contents'),
            'test_exams_answer_right'=>Yii::t('quiz','test_exams_answer_right'),
            'test_exams_answer_faultf'=>Yii::t('quiz','test_exams_answer_faultf'),
            'test_exams_answer_faults'=>Yii::t('quiz','test_exams_answer_faults'),
            'test_exams_answer_faultt'=>Yii::t('quiz','test_exams_answer_faultt'),
            'test_exams_kinds'=>Yii::t('quiz','test_exams_kinds'),
            'city_privileges'=>Yii::t('quiz','city_privileges'),

        );
    }

    public function retrieveDataByPage($pageNum=1)
    {
        $tableFuss=Yii::app()->params['jsonTableName'];

        $sql1 = "select *
				from blog$tableFuss.test_exams
				where 1=1 ";
        $sql2 = "select count(id)
				from blog$tableFuss.test_exams
				where 1=1 ";
        $clause = "";

        //searchField =>字段名   searchValue =>字段值  日期  名字 描述
        if (!empty($this->searchField) && !empty($this->searchValue)) {
            $svalue = str_replace("'","\'",$this->searchValue);
            switch ($this->searchField) {
                case 'test_exams_contents':
                    $clause .= General::getSqlConditionClause('test_exams_contents',$svalue);
                    break;
                case 'test_exams_answer_right':
                    $clause .= General::getSqlConditionClause('test_exams_answer_right',$svalue);
                    break;
                case 'test_exams_answer_faultf':
                    $clause .= General::getSqlConditionClause('test_exams_answer_faultf',$svalue);
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

        // $list = array();
        $this->attr = array();
        if (count($records) > 0) {
//			$startrow = ($this->noOfItem != 0) ? ($this->pageNum-1) * $this->noOfItem : 0;
//			$itemcnt = 0;
            foreach ($records as $k=>$record) {
//				if ($k >= $startrow && ($itemcnt <= $this->noOfItem || $this->noOfItem == 0)) {
                $this->attr[] = array(
                    'id'=>$record['id'],
                    'test_exams_contents'=>$record['test_exams_contents'],
                    'test_exams_answer_right'=>$record['test_exams_answer_right'],
                    'test_exams_answer_faultf'=>$record['test_exams_answer_faultf'],
                );
//					$itemcnt++;
//				}
            }
        }
        $session = Yii::app()->session;
        $session['criteria_c01'] = $this->getCriteria();
        return true;
    }
      Public function demo(){
          $tableFuss=Yii::app()->params['jsonTableName'];
          $sql1 = "select *
				from blog$tableFuss.test_exams
				where 1=1 AND test_exams_kinds=1";
          return $sql1;
      }
}
?>