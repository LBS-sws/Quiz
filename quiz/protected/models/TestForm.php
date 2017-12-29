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
    Public $quiz_correct_employee_id;
    Public $quiz_count;
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
    Public function retrieveData($quiz_id,$employee_id,$quiz_Correct_rate_id)
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
        $this->quiz_correct_employee_id=$quiz_Correct_rate_id;
        $this->quiz_id=$quiz_id;
        $this->employee_id=$employee_id;

        return true;
    }

    /**
     * @param $final_result
     * final_result:员工提交的做的题id 和 做题结果(选择的参数)array(n)([0]=>array(2){('id'=>'','test_result'=>'')}[1]...)
     * 员工id=>employee_id  测验单id=>id  每次测验的数据单quiz_correct_employee_id
     * count($_REQUEST['contents']) represents the counts of the exams which have been done in this test(代表了本次测验实际做的题目数量)
     * $_REQUEST['quiz_exams_count']代表了本次测验实际的测验题目数量
     *在做过的题目上进行正错判断  对于没有做的题目不会做任何判断 且正确率是做过的题除以$_REQUEST['quiz_exams_count'] 不是指做的题目count($_REQUEST['contents'])
     * 这里不再记录员工的未做的题目,原因:该员工没有做对 也没有做错 所以不做记录,也不录入错误表
     */
    Public function saveData($final_result){
        $fact_exams_count=count($final_result);
        $k=0;  //本测验单的本次错题的数量
        $should_exams_count=$_REQUEST['TestForm']['quiz_exams_count'];   //本次测验应当做的测验题目数量int
        $correct_id=$_REQUEST['TestForm']['quiz_correct_employee_id'];  //employee_correct_rate 表主键int
        $quiz_id=$_REQUEST['TestForm']['id'];                         //quiz主键
        $employee_id=$_REQUEST['TestForm']['employee_id'];                  //employee_info主键int
        $wrong_test_exams_id="";
        $all_test_exams_id="";
        for($i=0;$i<$fact_exams_count;$i++){
            $all_test_exams_id.=$final_result[$i]['id'].'-';
            if($final_result[$i]['test_result']!='test_exams_answer_right'){
                $wrong_test_exams_id.=$final_result[$i]['id'].'-';
                $k++;
            }
        }
        $all_test_exams_id=trim($all_test_exams_id,'-');    //本次测验做的题目
        $wrong_test_exams_id=trim($wrong_test_exams_id,'-'); //错题的题目主键集合(char)
        $right_test_exams_count=$fact_exams_count-$k;
        $rate=round($right_test_exams_count/$should_exams_count*100,2)."%";  //本次测验的正确率char
        //echo $k."个错题";
        $correct_id_set="update employee_correct_rate set
(employee_correct_rate,employee_quiz_questions_all,employee_quiz_questions_wrong,employee_quiz_questions_count,employee_quiz_wrong_questions_count) VALUES (".$rate.",".$all_test_exams_id.",".$wrong_test_exams_id.",".$should_exams_count.",".$k.")WHERE employee_correct_rate_id=$correct_id";
        $correct_id_get=Yii::app()->db2->createCommand($correct_id_set)->execute();
        var_dump($correct_id_get);die;
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