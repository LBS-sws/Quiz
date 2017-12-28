<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/20 0020
 * Time: 14:35
 */
header("Content-type: text/html; charset=utf-8");
class TestForm extends CFormModel
{
    /* User Fields */
    Public $quiz_id;
    Public $employee_id;
    public $id;
    Public $city_privileges;
    public $quiz_date;
    public $quiz_name;
    Public $scenario;
    Public $employee_info;
    Public $quiz_exams_count;
    Public $quiz_employee_title;
    Public $radio_value;
    //Public $scenario;
    /**
     * Declares customized attribute labels.
     * If not declared here, an attribute would have a label that is
     * the same as its name with the first letter in upper case.
     */
    public function attributeLabels()
    {

        return array(
            'employee_name_show'=>Yii::t('quiz','employee_name_show'),
            'quiz_correct_rate'=>Yii::t('quiz','quiz_correct_rate'),
            'quiz_employee_name'=>Yii::t('quiz','quiz_employee_name'),
            'quiz_employee_id'=>Yii::t('quiz','quiz_employee_id'),
            'quiz_exams_count'=>Yii::t('quiz','quiz_exams_count'),
            'quiz_date'=>Yii::t('quiz','Question Name'),
            'now_time'=>Yii::t('quiz','now_time'),
            'quiz_name'=>Yii::t('quiz','quiz_name'),
            'city_privileges'=>Yii::t('quiz','city_privileges'),
            'quiz_start_dt'=>Yii::t('quiz','quiz_start_dt'),
            'quiz_id'=>Yii::t('quiz','quiz_id'),
            'employee_id'=>Yii::t('quiz','employee_id'),
            'quiz_exams_count_show'=>Yii::t('quiz','quiz_exams_count_show'),
            'quiz_employee_title'=>Yii::t('quiz','quiz_employee_title'),
        );
    }
    /**
     * Declares the validation rules.
     */
    public function rules()
    {
        return array(
            array('quiz_id,employee_id','required'),
            array('id,quiz_start_dt,quiz_name,quiz_correct_rate,quiz_employee_name,quiz_employee_id,quiz_exams_count,city_privileges','safe'),
        );
    }

    /**
     * @param $quiz_id::employee_correct_rate表的quiz外键
     * @param $employee_id::employee_correct_rate表的employee_info外键
     * @return bool
     */
    Public function retrieveData($quiz_id,$employee_id)
    {
        $sql = "select * from quiz where id=".$quiz_id."";
        $rows = Yii::app()->db2->createCommand($sql)->queryAll();
        $sql_employee="select * from employee_info WHERE id=".$employee_id."";
        $sql_employee_get=Yii::app()->db2->createCommand($sql_employee)->queryAll();
        $this->employee_info=$sql_employee_get[0]['employee_info_name'];
        if (count($rows) > 0)
        {
            foreach ($rows as $row)
            {
                $this->id = $row['id'];
                $this->quiz_date = date('Y-m-d H:i:s',time());
                $this->quiz_employee_title = $row['quiz_name'];
                $this->city_privileges = $row['city_privileges'];
                $this->quiz_exams_count=$row['quiz_exams_count'];
                break;
            }
        }
        $this->quiz_id=$quiz_id;
        $this->employee_id=$employee_id;
        return true;
    }
    public function isOccupied($index) {
        $rtn = false;
        $sql = "select a.id from swo_service a where a.cust_type=".$index." limit 1";
        $rows = Yii::app()->db->createCommand($sql)->queryAll();
        foreach ($rows as $row) {
            $rtn = true;
            break;
        }
        return $rtn;
    }
}