<?php
header("Content-type: text/html; charset=utf-8");
Class Quiz{

    /**
     * just for selecting the numbers
     */
    Public static function listReturn(){
        $city = Yii::app()->user->city();
        $list = array(0=>Yii::t('quiz','question_count_choose'));
        $data=array();  //需求数组
        for($i=5;$i<101;$i++){
            $data[$i]['id']=$i;
            $data[$i]['value_count']=$i;
        }
        if (count($data) > 0) {
            foreach ($data as $row) {
                $list[$row['id']] = $row['value_count'];
            }
        }
        return $list;
    }
/*
 * add info_id
 */
    Public static function SelectReturn($info_id){
        $tableFuss=Yii::app()->params['jsonTableName'];
        $city = Yii::app()->user->city();
/*        $list = array(0=>Yii::t('quiz','question_count_choose'));*/
        $list=array();
        if(!empty($info_id)){   //修改测验单员工
            $sql = "select id,employee_info_name from blog$tableFuss.employee_info where 1=1";
            $data = Yii::app()->db2->createCommand($sql)->queryAll();
        }
        else{   //新增测验单员工
            $sql = "select id,employee_info_name from blog$tableFuss.employee_info where 1=1";
            $data = Yii::app()->db2->createCommand($sql)->queryAll();
        }
        if (count($data) > 0) {
            foreach ($data as $row) {
                $list[$row['id']] = $row["employee_info_name"];
            }
        }
        return $list;
    }
    /**
     * @param array $id array pass  return the result of the querying
     * @return array
     */
    Public static function EmployeeIdGet($id){
        if(!empty($id)){
            $tableFuss=Yii::app()->params['jsonTableName'];
            $sql="select quiz_employee_id from blog$tableFuss.quiz WHERE id=$id";
            $quizEmployeeId = Yii::app()->db2->createCommand($sql)->queryAll();  //set $date[0]['quiz_employee_id'] to get the value
            $data_employee_id_data_pass=$quizEmployeeId[0]['quiz_employee_id'];   //获取quiz表 关联的员工id 字符串  for instance string(9) "1,2,3,4,5"
            $newArrayString=explode(',',$data_employee_id_data_pass);
            if(is_array($newArrayString)){
                return $newArrayString;
            }
            else{
                $id=array();
                return "";
            }
        }
        else{
            return "";
        }
    }
    Public static function demoData(){
        $list = array(0=>Yii::t('quiz','employee_name_show'));
        return $list;
    }
    Public static function QuestionsSelect(){
        $city = Yii::app()->user->city_allow();
        $list = array(0=>Yii::t('quiz','Quiz_select_choose'));
        $tableFuss=Yii::app()->params['jsonTableName'];
        $sql="select id,quiz_name,quiz_start_dt from blog$tableFuss.quiz WHERE 1=1 and city_privileges in($city)";
        $select_quiz_result = Yii::app()->db2->createCommand($sql)->queryAll();
        $result=array();
        $nowTime=strtotime(date("Y-m-d H:i:s")); //当前时间
    /*    $zero2=strtotime($select_quiz_result[0]['quiz_start_dt']);  //测验时间
        $dateShow=ceil(($zero2-$nowTime)/86400); //60s*60min*24h*/
        for($k=0;$k<count($select_quiz_result);$k++){
            $quiz_time=strtotime($select_quiz_result[$k]['quiz_start_dt']);
            $dateShow=ceil(($quiz_time-$nowTime)/86400);
            if($dateShow>0){
                $result[]=$select_quiz_result[$k];
            }
        }

        if (count($result) > 0) {
            foreach ($result as $row) {
                $list[$row['id']] = $row['quiz_name'];
            }
        }
        return $list;
    }

    Public static function selectEmployee(){
        $list=array();
        $select_quiz_result=array();
        $select_quiz_result[0]=array('id'=>0,'showAnswer'=>'请选择测验单');
        if (count($select_quiz_result) > 0) {
            foreach ($select_quiz_result as $row) {
                $list[$row['id']] = $row['showAnswer'];
            }
        }
        return $list;
    }

    Public static function checkRadioDemo(){
        $list=array();
        $select_quiz_result=array();
        $select_quiz_result[0]=array('id'=>0,'showAnswer'=>'请选择测验单');
        if (count($select_quiz_result) > 0) {
            foreach ($select_quiz_result as $row) {
                $list[$row['id']] = $row['showAnswer'];
            }
        }
        return $list;

        }
    Public static function checkRadioValueGet($quiz_id,$employee_id){
        $test_exams_count_set="select * from quiz WHERE id=$quiz_id";
        $test_exams_count_get=Yii::app()->db2->createCommand($test_exams_count_set)->queryAll();
        $test_exams_count_getValue=$test_exams_count_get[0]['quiz_exams_count']; //该测验单的admin后台出的题目条数
        $Wrong_Employee_Value_Set="select * from employee_middle_wrong_exams WHERE employee_middle_wrong_info_id=$employee_id";   //因为员工与题目的关系是多对多且为不重复 所以不能加入quiz_id该条件
        $Wrong_Employee_Value_Get = Yii::app()->db2->createCommand($Wrong_Employee_Value_Set)->queryAll();  //该员工的错题的所有集合
        $wrong_exams_id_str="";
        for($i=0;$i<count($Wrong_Employee_Value_Get);$i++){
            $wrong_exams_id_str.=$Wrong_Employee_Value_Get[$i]['employee_middle_test_exams_id'].',';
        }
        $wrong_exams_id_str=rtrim($wrong_exams_id_str,',');//该员工的错题id的所有集合
        $finalResult=array();
        if(!empty($employee_id)&&!empty($quiz_id)){

            if(count($Wrong_Employee_Value_Get)>1){  //错题大于一
                $wrong_exams_count=count($Wrong_Employee_Value_Get);
                $split_exams_count=floor($wrong_exams_count/2);
                $getTheCountValue=$test_exams_count_getValue-$split_exams_count;  //题库的选择数量 有可能为负数 当错题的一半数量向下取整的结果值大于或等于本次该测验单的数量时 那么随机出来的题目将全部为该员工做错过的题目
                if($getTheCountValue<=0){  //错题一半的向下取整大于或等于该次测验单数量 =>仅有错题库提供题目
                    $test_exams_id_set ="SELECT employee_middle_test_exams_id FROM employee_middle_wrong_exams WHERE id >= (SELECT floor(RAND() * (SELECT MAX(id) FROM employee_middle_wrong_exams))) AND employee_middle_wrong_info_id=$employee_id  LIMIT $test_exams_count_getValue";
                    $test_exams_id_get = Yii::app()->db2->createCommand($test_exams_id_set)->queryAll(); //随机且包含错题的test_exam=>id合集  数量为该次测验单的题目数
                    $finalTestExamsStr="";
                    for($j=0;$j<count($test_exams_id_get);$j++){
                        $finalTestExamsStr.=$test_exams_id_get[$j]['employee_middle_test_exams_id'].',';
                    }
                    $finalTestExamsStr=rtrim($finalTestExamsStr,','); //得到本次测验的所有题目id
                    $finalTestExamsStrResultSet ="SELECT * FROM test_exams WHERE id IN ($finalTestExamsStr)";
                    $finalTestExamsStrResultGet = Yii::app()->db2->createCommand($finalTestExamsStrResultSet)->queryAll();  //完结:错题一半的向下取整大于或等于该次测验单数量时的题目集合
                    $finalResult=$finalTestExamsStrResultGet;
                }
                else{         //错题一半的向下取整小于该次测验单数量=>由错题和题库一起提供 即为错题的计算结果数量-本次测验的题目数量<-1(错题取值在1到题目数-1的开区间内)

                    $test_exams_id_set ="SELECT id FROM test_exams WHERE id >= (SELECT floor(RAND() * (SELECT MAX(id) FROM test_exams))) AND id NOT IN ($wrong_exams_id_str) LIMIT $getTheCountValue";
                    $test_exams_id_get = Yii::app()->db2->createCommand($test_exams_id_set)->queryAll(); //随机且不包含错题的test_exam=>id合集
                    //开始获取非错题的题目id结果集
                    $test_exams_final="";//得到本次测验的所有非错题的题目id
                    for($k=0;$k<count($test_exams_id_get);$k++){
                        $test_exams_final.=$test_exams_id_get[$k]['id'].',';
                    }
                    $test_exams_wrong_id_set ="SELECT employee_middle_test_exams_id FROM employee_middle_wrong_exams WHERE id >= (SELECT floor(RAND() * (SELECT MAX(id) FROM employee_middle_wrong_exams))) AND employee_middle_wrong_info_id=$employee_id LIMIT $split_exams_count";
                    $test_exams_wrong_id_get = Yii::app()->db2->createCommand($test_exams_wrong_id_set)->queryAll(); //错题的集合
                    for($l=0;$l<count($test_exams_wrong_id_get);$l++){
                        $test_exams_final.=$test_exams_wrong_id_get[$l]['employee_middle_test_exams_id'].',';
                    }
                    $test_exams_final=trim($test_exams_final,',');
                    $test_exams_final_arr=explode(',',$test_exams_final);
                    shuffle($test_exams_final_arr);
                    $upLow_test_examsId_get=implode($test_exams_final_arr,',');
                    $finalTestExamsStrResultSet ="SELECT * FROM test_exams WHERE id IN ($upLow_test_examsId_get)";
                    $finalTestExamsStrResultGet = Yii::app()->db2->createCommand($finalTestExamsStrResultSet)->queryAll();
                    $finalResult=$finalTestExamsStrResultGet;
                }
            }
            elseif(count($Wrong_Employee_Value_Get)==1){  //错题为1 PS:每次出的测验题目 至少应大于10题 所以这里不判断当测验题为1时
                $get_The_Count_Value_on=$test_exams_count_getValue-count($Wrong_Employee_Value_Get);  //题库非错题的题目数量
                $test_exams_id_set ="SELECT id FROM test_exams WHERE id >= (SELECT floor(RAND() * (SELECT MAX(id) FROM test_exams))) AND id NOT IN ($wrong_exams_id_str)ORDER BY id LIMIT $get_The_Count_Value_on";
                $test_exams_id_get = Yii::app()->db2->createCommand($test_exams_id_set)->queryAll(); //随机且不包含错题的test_exam=>id合集
                $test_examsId_final_result="";
                for($m=0;$m<count($test_exams_id_get);$m++){
                    $test_examsId_final_result.=$test_exams_id_get[$m]['id'].',';
                }
                $test_examsId_final_result=trim($test_examsId_final_result,',').",".$wrong_exams_id_str; //获取本次测验的所有题目id
                $on_arr_test_exams=explode(',',$test_examsId_final_result);
                shuffle($on_arr_test_exams);
                $on_str_test_exams=implode($on_arr_test_exams,',');
                $TestExamsOnResultSet ="SELECT * FROM test_exams WHERE id IN ($on_str_test_exams)";
                $TestExamsOnResultGet = Yii::app()->db2->createCommand($TestExamsOnResultSet)->queryAll();
                $finalResult=$TestExamsOnResultGet;
            }
            else{   //错题为0
                $test_exams_id_none_set ="SELECT * FROM test_exams WHERE id >= (SELECT floor(RAND() * (SELECT MAX(id) FROM test_exams))) LIMIT $test_exams_count_getValue";
                $test_exams_id_none_get=Yii::app()->db2->createCommand($test_exams_id_none_set)->queryAll();
                $finalResult=$test_exams_id_none_get;
            }
        }
        else {
            $finalResult=array();
            $finalResult[0]=array('id'=>'0','test_exams_contents'=>'亲,您的参数神秘消失了!亲及时通知技术人员!','test_exams_answer_right'=>'正解A','test_exams_answer_faultf'=>'错解B','test_exams_answer_faults'=>'错解C','test_exams_answer_faultt'=>'错解D');
        }
        return $finalResult;
    }
}