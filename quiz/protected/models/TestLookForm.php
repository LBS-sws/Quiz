<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/30 0030
 * Time: 14:16
 */
header("Content-type: text/html; charset=utf-8");
class TestLookForm extends CFormModel
{
    /* User Fields */
    public $id;
    Public $quiz_name;      //测验单名
    public $quiz_rate;      //该测验单的平均正确率
    public $employee_rate;  //本次正确率
    Public $should_answer_count;  //本次应答题目数
    Public $fact_answer_count; //本次实答题目数
    Public $wrong_answer_count; //本次错题数目
    Public $this_time_for; //本次答题的时间段
    Public $quiz_exams_count;
    Public $employee_info;
    Public $answer_wrong_contents=array();
    Public $check;
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
            'QuizDate'=>Yii::t('quiz','quiz Date'),
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

    /**
     * @param $correct_id
     * @return bool
     *
     */

    Public function retrieveData($correct_id)
    {
        if(!empty($correct_id)){
        $city = Yii::app()->user->city_allow();
        //$select_set="select * from employee_correct_rate where employee_correct_rate_id=$correct_id";
        $select_set = "select * from employee_correct_rate where employee_correct_rate_id=".$correct_id." and city_privileges in ($city)";
        $select_get=Yii::app()->db2->createCommand($select_set)->queryAll();
        $correct_data=$select_get[0];
        if(count($select_get)>0){
           $quiz_id= $correct_data['employee_correct_rate_info_id'];  //quiz主键
            $quiz_select_set="select * from quiz WHERE id=$quiz_id";
            $quiz_select_get=Yii::app()->db2->createCommand($quiz_select_set)->queryAll();
            $this->quiz_name=$quiz_select_get[0]['quiz_name'];
            $this->quiz_rate=$quiz_select_get[0]['quiz_correct_rate'];
       /* var_dump($quiz_select_get);die;*/
            $employee_id=$correct_data['quiz_employee_id'];   //员工主键
            $this->employee_rate=$correct_data['employee_correct_rate'];  //本次正确率
            $count_questions_all_str=$correct_data['employee_quiz_questions_all']; //实际做的题目
            $answer_count=explode('-',$count_questions_all_str);
            $this->fact_answer_count=count($answer_count);
            $count_questions_wrong_str=$correct_data['employee_quiz_questions_wrong']; //做错的题目以及错误选项
            $count_questions_wrong_arr_str=explode('-',$count_questions_wrong_str);
            if(!empty($count_questions_wrong_str)) {
                $temporary = array();  //错题id以及错题的错误选项
                for ($ct = 0; $ct < count($count_questions_wrong_arr_str); $ct++) {
                    $demo = array();
                    $demo = explode('*', $count_questions_wrong_arr_str[$ct]);
                    $temporary[$ct]['id'] = $demo[0];
                    $temporary[$ct]['contents'] = $demo[1];
                }
                $outContents = array();
                for ($y = 0; $y < count($temporary); $y++) {
                    $temporary_id_test = $temporary[$y]['id'];      //题目主键
                    $temporary_contents_test = $temporary[$y]['contents']; //错误选项(字段名)
                    $sql_select_test_set = "select * from test_exams WHERE id=$temporary_id_test";
                    $sql_select_test_get = Yii::app()->db2->createCommand($sql_select_test_set)->queryAll();
                    $outContents[$y][] = $sql_select_test_get[0];
                    $outContents[$y][] = $sql_select_test_get[0][$temporary_contents_test];
                }
                $this->answer_wrong_contents=$outContents;
            }else{
                $this->answer_wrong_contents="";
            }
            $this->should_answer_count=$correct_data['employee_quiz_questions_count'];//应做数量
            $this->wrong_answer_count=$correct_data['employee_quiz_wrong_questions_count']; //错的题目数量
            $this->this_time_for=$correct_data['employee_correct_rate_date'];  //答题时间段
        }
        }
        else{
            $this->check=0;
            $this->answer_wrong_contents='';
            $this->should_answer_count='0';
            $this->wrong_answer_count='0';
            $this->this_time_for='0';
        }
        return true;
    }
    public function isOccupied($index){
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