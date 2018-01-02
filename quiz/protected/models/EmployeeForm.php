<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/1/2 0002
 * Time: 09:50
 */
header("Content-type: text/html; charset=utf-8");
class EmployeeForm extends CFormModel
{ /* User Fields */
    public $id;
    Public $quiz_id;
    Public $employee_info_arr=array();
    public $employee_info_name;
    Public $quiz_info_show;
    //Public $scenario;
    /**
     * Declares customized attribute labels.
     * If not declared here, an attribute would have a label that is
     * the same as its name with the first letter in upper case.
     */
    public function attributeLabels()
    {
        return array(
            'employee_info_name_get'=>Yii::t('quiz','employee_info_name_get'),
            'quiz_correct_rate'=>Yii::t('quiz','quiz_correct_rate'),
            'quiz_info_show'=>Yii::t('quiz','quiz_info_show'),
        );
    }
    /**
     * Declares the validation rules.
     */
    public function rules()
    {
        return array(
            array('id','safe'),
        );
    }
    public function retrieveData($quiz_id)
    {

        $city = Yii::app()->user->city_allow();
        $sql = "select quiz_employee_id,quiz_name from quiz where id=".$quiz_id." AND city_privileges IN ($city)";
        $rows = Yii::app()->db2->createCommand($sql)->queryAll();
        if(count($rows)>0){
            $this->quiz_info_show=$rows[0]['quiz_name'];
            $employee_id_str=$rows[0]['quiz_employee_id'];
            $employee_info_set="select * from employee_info WHERE id IN ($employee_id_str) AND city_privileges IN ($city)";
            $employee_info_get=Yii::app()->db2->createCommand($employee_info_set)->queryAll();
            if(count($employee_info_get)>0){
                    for($i=0;$i<count($employee_info_get);$i++){
                        $this->employee_info_arr[$i]['id']=$employee_info_get[$i]['id'];
                        $this->employee_info_arr[$i]['employee_info_name']=$employee_info_get[$i]['employee_info_name'];
                        }
            }
            $this->quiz_id=$quiz_id;
        }

        return true;
    }
}