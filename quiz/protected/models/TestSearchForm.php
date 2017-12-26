<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/20 0020
 * Time: 14:35
 */
header("Content-type: text/html; charset=utf-8");
class TestSearchForm extends CFormModel
{
    /* User Fields */
    public $id;
    Public $city_privileges;
    public $quiz_date;
    public $quiz_name;
    Public $quiz_correct_rate;
    Public $quiz_start_dt;
    Public $quiz_employee_name;
    Public $employee_name_show;
    Public $quiz_exams_count;
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
            'QuizDate'=>Yii::t('quiz','Quiz Date'),
            'quiz_name'=>Yii::t('quiz','quiz_name'),
            'city_privileges'=>Yii::t('quiz','city_privileges'),
            'quiz_start_dt'=>Yii::t('quiz','quiz_start_dt'),
        );
    }
    /**
     * Declares the validation rules.
     */
    public function rules()
    {
        return array(
            array('quiz_date','required'),
            array('id,quiz_start_dt,quiz_name,quiz_correct_rate,quiz_employee_name,quiz_employee_id,quiz_exams_count,city_privileges','safe'),
        );
    }
    Public function retrieveData($index)
    {
        $tableFuss=Yii::app()->params['jsonTableName'];
        $sql = "select * from blog$tableFuss.quiz where id=".$index."";
        $rows = Yii::app()->db->createCommand($sql)->queryAll();
        $id_array_employee=$rows[0]['quiz_employee_id'];
        if(!empty($id_array_employee)){
            $employee_name="select * from blog$tableFuss.employee_info where id IN ($id_array_employee)";
            $final_info = Yii::app()->db->createCommand($employee_name)->queryAll();
            if(count($final_info)>0){
                for($i=0;$i<count($final_info);$i++){
                    $this->employee_name_show.='姓名:'.$final_info[$i]['employee_info_name']."\n";
                }
            }
        }
        if (count($rows) > 0)
        {
            foreach ($rows as $row)
            {
                $this->id = $row['id'];
                $this->quiz_date = $row['quiz_date'];
                $this->quiz_name = $row['quiz_name'];
                $this->city_privileges = $row['city_privileges'];
                $this->quiz_correct_rate = $row['quiz_correct_rate'];
                $this->quiz_exams_count=$row['quiz_exams_count'];
                break;
            }
        }
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