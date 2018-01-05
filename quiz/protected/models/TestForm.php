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
        $sql_employee="select * from employee_user_bind_v WHERE employee_id=".$employee_id."";
        $sql_employee_get=Yii::app()->db2->createCommand($sql_employee)->queryAll();
        $this->employee_info=$sql_employee_get[0]['employee_name'];
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
        $city_user=Yii::app()->user->city();
        $fact_exams_count=count($final_result);
        $this_count_wrong=0;  //本测验单的本次错题的数量
        $now_time=date('Y-m-d H:i:s',time());
        $quiz_date=floor((strtotime($now_time)-strtotime($_REQUEST['TestForm']['quiz_date']))%86400%60);
        $should_exams_count=$_REQUEST['TestForm']['quiz_exams_count'];   //本次测验应当做的测验题目数量int
        $correct_id=$_REQUEST['TestForm']['quiz_correct_employee_id'];  //employee_correct_rate 表主键int
        $quiz_id=$_REQUEST['TestForm']['id'];                         //quiz主键
        $employee_id=$_REQUEST['TestForm']['employee_id'];                  //employee_info主键int
        $wrong_test_exams_id="";
        $all_test_exams_id="";
        $test_each_exams_id=array();  //当前错题主键集合
        for($i=0;$i<$fact_exams_count;$i++){   //实际做题数量
            $all_test_exams_id.=$final_result[$i]['id'].'-';
            if($final_result[$i]['test_result']!='test_exams_answer_right'){
                $wrong_test_exams_id.=$final_result[$i]['id'].'*'.$final_result[$i]['test_result'].'-';
                $test_each_exams_id[]=$final_result[$i]['id'];  //每次的做错的题目主键
                //echo $final_result[$i]['test_result'].$final_result[$i]['id']."<br/>";
                $this_count_wrong++;
            }
        }
        $middle_wrong_query_info_id_set="select employee_middle_test_exams_id from employee_middle_wrong_exams WHERE employee_middle_wrong_info_id=$employee_id";
        $middle_wrong_query_info_id_get=Yii::app()->db2->createCommand($middle_wrong_query_info_id_set)->queryAll(); //错题历史记录主键集合
        $previous_id_delete="";
        for($x=0;$x<count($middle_wrong_query_info_id_get);$x++){
            $previous_id_delete.=$middle_wrong_query_info_id_get[$x]['employee_middle_test_exams_id'].',';
            $test_each_exams_id[]=  $middle_wrong_query_info_id_get[$x]['employee_middle_test_exams_id'];
            }
        $previous_id_delete=trim($previous_id_delete,',');
        if(!empty($previous_id_delete)){  //错题历史主键集合
            $delete_previous_sql_set="delete from employee_middle_wrong_exams WHERE employee_middle_test_exams_id IN ($previous_id_delete) AND employee_middle_wrong_info_id=$employee_id";
            Yii::app()->db2->createCommand($delete_previous_sql_set)->execute();
        }
        $test_each_exams_id=array_unique($test_each_exams_id);
        if(!empty($test_each_exams_id)){
            foreach($test_each_exams_id as $k=>$v){
                $for_exams_id=$v;
                $insert_middle_wrong_exams_set="insert into employee_middle_wrong_exams
(employee_middle_wrong_info_id,employee_middle_test_exams_id,employee_middle_quiz_id,city_privileges,employee_middle_wrong_choice) VALUES
($employee_id,$for_exams_id,$quiz_id,'$city_user','');";
                Yii::app()->db2->createCommand($insert_middle_wrong_exams_set)->execute();
            }
        }
        //quiz正确率计算
        $select_quiz_count_result_set="select quiz_total_test_all,quiz_total_test_wrong_all from quiz WHERE id=$quiz_id";
        $select_quiz_count_result_get=Yii::app()->db2->createCommand($select_quiz_count_result_set)->queryAll();
        $total_quiz_count_record=$select_quiz_count_result_get[0]['quiz_total_test_all']+$should_exams_count;
        $total_quiz_wrong_count_record=$select_quiz_count_result_get[0]['quiz_total_test_wrong_all']+$this_count_wrong;
        $betweenValue=$total_quiz_count_record-$total_quiz_wrong_count_record;
        $quiz_this_right_rate=round($betweenValue/$total_quiz_count_record*100,2);
        $quiz_data_update_set="update quiz set quiz_correct_rate=$quiz_this_right_rate,quiz_total_test_all=$total_quiz_count_record,quiz_total_test_wrong_all=$total_quiz_wrong_count_record WHERE id=$quiz_id";
        Yii::app()->db2->createCommand($quiz_data_update_set)->execute();
        $all_test_exams_id=trim($all_test_exams_id,'-');    //本次测验实做的题目
        $wrong_test_exams_id=trim($wrong_test_exams_id,'-'); //错题的题目主键集合(char)
        $right_test_exams_count=$fact_exams_count-$this_count_wrong;

        $rate=round($right_test_exams_count/$should_exams_count*100,2);  //本次测验的正确率char
        $correct_id_set="UPDATE employee_correct_rate SET employee_correct_rate_info_id=$quiz_id,quiz_employee_id=$employee_id,employee_correct_rate=$rate,city_privileges='$city_user',employee_quiz_questions_all='$all_test_exams_id',employee_quiz_questions_wrong='$wrong_test_exams_id',employee_quiz_questions_count=$should_exams_count,employee_quiz_wrong_questions_count=$this_count_wrong,employee_correct_rate_date='$quiz_date'
        WHERE employee_correct_rate_id=$correct_id;";
        Yii::app()->db2->createCommand($correct_id_set)->execute();
        return $correct_id;
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