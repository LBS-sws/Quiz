<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/14 0014
 * Time: 11:05
 */
header("Content-type: text/html; charset=utf-8");
class QuizList extends CListPageModel
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
        $tableFuss = Yii::app()->params['jsonTableName'];

        $sql1 = "select *
				from blog$tableFuss.quiz
				where 1=1 ";
        $sql2 = "select count(id)
				from blog$tableFuss.quiz
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
            $startrow = ($this->noOfItem != 0) ? ($this->pageNum - 1) * $this->noOfItem : 0;
            $itemcnt = 0;
            foreach ($records as $k => $record) {
                if ($k >= $startrow && ($itemcnt <= $this->noOfItem || $this->noOfItem == 0)) {
                    $this->attr[] = array(
                        'id' => $record['id'],
                        'quiz_exams_count' => $record['quiz_exams_count'],
                        'quiz_date' => $record['quiz_date'],
                        'quiz_name' => $record['quiz_name'],
                        'quiz_exams_id' => $record['quiz_exams_id'],
                        'quiz_correct_rate' => $record['quiz_correct_rate'],
                        'quiz_start_dt' => $record['quiz_start_dt'],
                    );
                    $itemcnt++;
//				}
                }
            }
            $session = Yii::app()->session;
            $session['criteria_c01'] = $this->getCriteria();
            return true;
        }

    }
}
?>