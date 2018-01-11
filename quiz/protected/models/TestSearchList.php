<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/20 0020
 * Time: 14:35
 */

header("Content-type: text/html; charset=utf-8");
class TestSearchList extends CListPageModel
{
    public function attributeLabels()
    {
        return array(
            'quiz_date' => Yii::t('quiz', 'quiz_date'),
            'quiz_exams_id' => Yii::t('quiz', 'quiz_exams_id'),
            'quiz_name' => Yii::t('quiz', 'quiz_name'),
            'quiz_correct_rate' => Yii::t('quiz', 'quiz_correct_rate'),
            'quiz_start_dt' => Yii::t('quiz', 'quiz_start_dt'),
        );
    }
    public function retrieveDataByPage($pageNum = 1)
    {
        $quiz_session_login_id=Yii::app()->user->name;
        $employee_middle_value_set="select * from employee_user_bind_v WHERE user_id='$quiz_session_login_id'";
        $employee_middle_value_get=Yii::app()->db2->createCommand($employee_middle_value_set)->queryAll();
        $employee_id_pass="";
        if(!empty($employee_middle_value_get[0]['employee_id'])){
            $employee_id_pass=$employee_middle_value_get[0]['employee_id'];
        }else{
            $employee_id_pass=0;
        }
        $tableFuss = Yii::app()->params['jsonTableName'];
        $sql1 = "select *
				from blog$tableFuss.quiz
				where 1=1 AND FIND_IN_SET($employee_id_pass,quiz_employee_id)";
        $sql2 = "select count(id)
				from blog$tableFuss.quiz
				where 1=1 AND FIND_IN_SET($employee_id_pass,quiz_employee_id)";
        $clause = "";
        //searchField =>字段名   searchValue =>字段值  日期  名字 描述
        if (!empty($this->searchField) && !empty($this->searchValue)) {
            $svalue = str_replace("'", "\'", $this->searchValue);
            switch ($this->searchField) {
                case 'quiz_date':
                    $clause .= General::getSqlConditionClause('quiz_date', $svalue);
                    break;
                case 'quiz_name':
                    $clause .= General::getSqlConditionClause('quiz_name', $svalue);
                    break;
                case 'quiz_correct_rate':
                    $clause .= General::getSqlConditionClause('quiz_correct_rate', $svalue);
                    break;
                case 'quiz_start_dt':
                    $clause .= General::getSqlConditionClause('quiz_start_dt', $svalue);
                    break;
            }
        }
        $order = "";
        if (!empty($this->orderField)) {
            $order .= " order by " . $this->orderField . " ";
            if ($this->orderType == 'D') $order .= "desc ";
        }
        $sql = $sql2 . $clause;
        $this->totalRow = Yii::app()->db->createCommand($sql)->queryScalar();
        $sql = $sql1 . $clause . $order;
        $sql = $this->sqlWithPageCriteria($sql, $this->pageNum);
        $records = Yii::app()->db->createCommand($sql)->queryAll();
        // $list = array();
        $this->attr = array();
        if (count($records) > 0) {
            // $startrow = ($this->noOfItem != 0) ? ($this->pageNum - 1) * $this->noOfItem : 0;
            // $itemcnt = 0;
            foreach ($records as $k => $record) {
                //  if ($k >= $startrow && ($itemcnt <= $this->noOfItem || $this->noOfItem == 0)) {
                $this->attr[] = array(
                    'id' => $record['id'],
                    'quiz_exams_count' => $record['quiz_exams_count'],
                    'quiz_date' => $record['quiz_date'],
                    'quiz_name' => $record['quiz_name'],
                    'quiz_exams_id' => $record['quiz_exams_id'],
                    'quiz_correct_rate' => $record['quiz_correct_rate'],
                    'quiz_start_dt' => $record['quiz_start_dt'],
                );
            }
            $session = Yii::app()->session;
            $session['criteria_c01'] = $this->getCriteria();
            return true;
        }
    }
}