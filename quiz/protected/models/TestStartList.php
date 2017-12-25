<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/20 0020
 * Time: 11:07
 */
header("Content-type: text/html; charset=utf-8");
class TestStartList extends CListPageModel
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
        $tableFuss = Yii::app()->params['jsonTableName'];
        $quiz="blog".$tableFuss.".quiz";  //测验主表 应该包含员工外键和题目外键的测验单  首先这里查出哪些员工可以在某个测验单操作
        $employee_info="blog".$tableFuss.".employee_info";

        //quiz :quiz_date quiz_correct_rate    employee_info:employee_info_name   conditions:a.id=b.id
        $sql1 = "select a.quiz_date,a.quiz_correct_rate,b.employee_info_name
				from $quiz as a LEFT JOIN $employee_info as b ON a.id=b.id
				where 1=1 ";

        $sql2 = "select count(id)
				from $quiz
				where 1=1 ";
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
        //PS:在quiz_name输入6的 $clause结果如左边
        //$clause :string(25) "and quiz_name like '%6%' "
        $order = "";
        if (!empty($this->orderField)) {
            $order .= " order by " . $this->orderField . " ";
            if ($this->orderType == 'D') $order .= "desc ";
        }
        $sql = $sql2 . $clause;  //select count(id) from blog_test.quiz where 1=1
        $this->totalRow = Yii::app()->db->createCommand($sql)->queryScalar();  //一共多少条

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