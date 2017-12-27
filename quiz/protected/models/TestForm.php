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
    public $id;
    Public $city_privileges;
    public $quiz_date;
    public $quiz_name;

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
            'quiz_id'=>Yii::t('quiz','quiz_id'),
            'employee_id'=>Yii::t('quiz','employee_id'),
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

        $tableFuss=Yii::app()->params['jsonTableName'];
        $test_exams_count_set="select * from quiz WHERE id=$quiz_id";
        $test_exams_count_get=Yii::app()->db2->createCommand($test_exams_count_set)->queryAll();//该测验单的题目条数
        $test_exams_count_getValue=$test_exams_count_get[0]['quiz_exams_count'];
        $Wrong_Employee_Value_Set="select * from employee_middle_wrong_exams WHERE employee_middle_wrong_info_id=$employee_id";   //因为员工与题目的关系是多对多且为不重复 所以不能加入quiz_id该条件
        $Wrong_Employee_Value_Get = Yii::app()->db2->createCommand($Wrong_Employee_Value_Set)->queryAll();  //错题的所有集合
        $wrong_exams_id_str="";
        for($i=0;$i<count($Wrong_Employee_Value_Get);$i++){
            $wrong_exams_id_str.=$Wrong_Employee_Value_Get[$i]['employee_middle_test_exams_id'].',';
        }
        $wrong_exams_id_str=rtrim($wrong_exams_id_str,',');
        if(!empty($employee_id)){

                if(count($Wrong_Employee_Value_Get)>1){  //错题大于一
                    $wrong_exams_count=count($Wrong_Employee_Value_Get);
                    $split_exams_count=$wrong_exams_count/2;
                    $getTheCountValue=$test_exams_count_getValue-floor($split_exams_count);  //题库的选择数量 有可能为负数 当错题的一半数量向下取整的结果值大于或等于本次该测验单的数量时 那么随机出来的题目将全部为该员工做错过的题目
                    if($getTheCountValue<=0){  //错题一半的向下取整大于或等于该次测验单数量 =>仅有错题库提供题目
                        $employeeSelf_info_set = "select * from blog$tableFuss.employee_correct_rate where employee_correct_rate_info_id=".$quiz_id." AND quiz_employee_id=$employee_id";
                        $employeeSelf_info_get = Yii::app()->db2->createCommand($employeeSelf_info_set)->queryAll();  //每次测验单的数据
                        $test_exams_id_set ="SELECT employee_middle_test_exams_id FROM employee_middle_wrong_exams WHERE id >= (SELECT floor(RAND() * (SELECT MAX(id) FROM employee_middle_wrong_exams))) ORDER BY id LIMIT $test_exams_count_getValue";
                        $test_exams_id_get = Yii::app()->db2->createCommand($test_exams_id_set)->queryAll(); //随机且不包含错题的test_exam=>id合集

                        $finalTestExamsStr="";
                        for($j=0;$j<count($test_exams_id_get);$j++){
                            $finalTestExamsStr.=$test_exams_id_get[$j]['employee_middle_test_exams_id'].',';
                        }
                        $finalTestExamsStr=rtrim($finalTestExamsStr,',');
                        $finalTestExamsStrResultSet ="SELECT * FROM test_exams WHERE id IN ($finalTestExamsStr)";
                        $finalTestExamsStrResultGet = Yii::app()->db2->createCommand($finalTestExamsStrResultSet)->queryAll();  //完结:错题一半的向下取整大于或等于该次测验单数量时的题目集合
                        var_dump($finalTestExamsStrResultGet);die;
                    }
                    else{                   //错题一半的向下取整小于该次测验单数量=>由错题和题库一起提供
                        $employeeSelf_info_set = "select * from blog$tableFuss.employee_correct_rate where employee_correct_rate_info_id=".$quiz_id." AND quiz_employee_id=$employee_id";
                        $employeeSelf_info_get = Yii::app()->db2->createCommand($employeeSelf_info_set)->queryAll();  //每次测验单的数据
                        $test_exams_id_set ="SELECT id FROM test_exams WHERE id >= (SELECT floor(RAND() * (SELECT MAX(id) FROM test_exams))) AND id NOT IN ($wrong_exams_id_str) ORDER BY id LIMIT $getTheCountValue";
                        $test_exams_id_get = Yii::app()->db2->createCommand($test_exams_id_set)->queryAll(); //随机且不包含错题的test_exam=>id合集
                        var_dump($test_exams_id_get);die;
                    }
                }
            elseif(count($Wrong_Employee_Value_Get)==1){  //错题为1

                $getTheCountValue=$test_exams_count_getValue-count($Wrong_Employee_Value_Get);
                var_dump($getTheCountValue);die;
                $employeeSelf_info_set = "select * from blog$tableFuss.employee_correct_rate where employee_correct_rate_info_id=".$quiz_id." AND quiz_employee_id=$employee_id";
                $test_exams_id_set ="SELECT id FROM test_exams WHERE id >= (SELECT floor(RAND() * (SELECT MAX(id) FROM test_exams)))  ORDER BY id LIMIT $getTheCountValue";
                $test_exams_id_get = Yii::app()->db2->createCommand($test_exams_id_set)->queryAll(); //随机且不包含错题的test_exam=>id合集
                $employeeSelf_info_get = Yii::app()->db2->createCommand($employeeSelf_info_set)->queryAll();  //每次测验单的数据
            }
            else{
                var_dump("员工无错题");die;
            }
        }
        else {
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