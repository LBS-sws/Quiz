<?php
/**
 * Created by PhpStorm.
 * User: json
 * Date: 2018/1/17 0017
 * Time: 16:18
 */
header("Content-type: text/html; charset=utf-8");


Class EmployeehistoryList extends CListPageModel
{
    /**
     * Declares customized attribute labels.
     * If not declared here, an attribute would have a label that is
     * the same as its name with the first letter in upper case.
     */
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
        $sql1 = "SELECT a.employee_name,a.user_name,COUNT(b.quiz_employee_id)
FROM employee_user_bind_v as a
LEFT JOIN employee_correct_rate
as b on a.employee_id=b.quiz_employee_id; ";
        $sql2 = "SELECT a.employee_name,a.user_name,COUNT(b.quiz_employee_id)
FROM employee_user_bind_v as a
LEFT JOIN employee_correct_rate as b on a.employee_id=b.quiz_employee_id; ";
        $clause = "";

        //searchField =>字段名   searchValue =>字段值  日期  名字 描述
        if (!empty($this->searchField) && !empty($this->searchValue)) {

            $svalue = str_replace("'", "\'", $this->searchValue);

            switch ($this->searchField) {
                case 'employee_name':
                    $clause .= General::getSqlConditionClause('employee_name', $svalue);
                    break;
                case 'user_name':
                    $clause .= General::getSqlConditionClause('user_name', $svalue);
                    break;
                case 'count':
                    $clause .= General::getSqlConditionClause('count', $svalue);
                    break;
            }
        }
        $order = "";
        if (!empty($this->orderField)) {
            $order .= " order by " . $this->orderField . " ";
            if ($this->orderType == 'D') $order .= "desc ";
        }
        $sql = $sql2 . $clause;
        $this->totalRow = Yii::app()->db2->createCommand($sql)->queryScalar();

        $sql = $sql1 . $clause . $order;
        $sql = $this->sqlWithPageCriteria($sql, $this->pageNum);
        $records = Yii::app()->db2->createCommand($sql)->queryAll();

        // $list = array();
        $this->attr = array();
        if (count($records) > 0) {
            // $startrow = ($this->noOfItem != 0) ? ($this->pageNum - 1) * $this->noOfItem : 0;
            // $itemcnt = 0;
            foreach ($records as $k => $record) {
                //  if ($k >= $startrow && ($itemcnt <= $this->noOfItem || $this->noOfItem == 0)) {
                $this->attr[] = array(
                    'employee_name' => $record['employee_name'],
                    'user_name' => $record['user_name'],
                    'count' => $record['COUNT(b.quiz_employee_id)'],
                );
                //  $itemcnt++;
//				}
                //   }
            }
            $session = Yii::app()->session;
            $session['criteria_c01'] = $this->getCriteria();
            return true;
        }

    }
}
?>