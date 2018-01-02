<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/1/2 0002
 * Time: 09:28
 */
header("Content-type: text/html; charset=utf-8");
Class TestHistoryController extends Controller{
    Public $info_id_pass;
    public function actionIndex($pageNum=0){
        //searching operation can get the value of searching result
        //var_dump($_REQUEST['QuizList']['searchField']);die;
        //$k=$_REQUEST['QuizList']['searchField'];
        //$v=$_REQUEST['QuizList']['searchValue'];
        $model=new TestHistoryList();
        if (isset($_POST['TestHistoryList'])) {
            $model->attributes = $_POST['TestHistoryList'];
        } else {
            $session = Yii::app()->session;
            if (isset($session['criteria_c02']) && !empty($session['criteria_c02'])) {
                $criteria = $session['criteria_c02'];
                $model->setCriteria($criteria);
            }
        }
        $model->determinePageNum($pageNum);
        $model->retrieveDataByPage($model->pageNum);
        $this->render('index',array('model'=>$model));   //公司列表
    }

    Public function actionAjaxUrl(){
        $name=$_REQUEST['username'];
        $pwd=$_REQUEST['password'];
        $countSelect=$_REQUEST['selectCount'];
        var_dump("aa".$name.$pwd.$countSelect);
    }
    //进入新增页面
    Public function actionNew(){

        $model = new QuizForm('new');
        $this->render('form',array('model'=>$model,));
    }
/*
 * 员工数据历史记录页
 */
    public function actionView()
    {

        $quiz_id=$_REQUEST['quiz_id'];
        $model = new EmployeeForm('view');
        if (!$model->retrieveData($quiz_id)) {
            throw new CHttpException(404,'The requested page does not exist.');
        } else {
            $this->render('form',array('model'=>$model,));
        }
    }


    public function actionDelete()
    {
        $model = new QuizForm('delete');
        if (isset($_POST['QuizForm'])) {
            $model->attributes = $_POST['QuizForm'];
            if ($model->isOccupied($model->id)) {
                Dialog::message(Yii::t('dialog','Warning'), Yii::t('dialog','This record is already in use'));
                $this->redirect(Yii::app()->createUrl('Quiz/edit',array('index'=>$model->id)));
            } else {
                $model->saveData();
                Dialog::message(Yii::t('dialog','Information'), Yii::t('dialog','Record Deleted'));
                $this->redirect(Yii::app()->createUrl('Quiz/index'));
            }
        }
//		$this->actionIndex();
    }

    //点击保存后  跳转到表单页面 且有提交的保存数据
    Public function actionSave(){
        /*    $_REQUEST['quiz_employee_id']=implode(',',$_REQUEST['quiz_employee_id']);
            $_REQUEST['QuizForm']['quiz_employee_id']=$_REQUEST['quiz_employee_id'];
       var_dump($_REQUEST['QuizForm']);die;*/
        if (isset($_POST['QuizForm'])) {
            $model = new QuizForm($_POST['QuizForm']['scenario']);
            $model->attributes = $_POST['QuizForm'];
            if ($model->validate()) {
                $model->saveData();
                //$model->scenario = 'edit';
                Dialog::message(Yii::t('dialog','Information'), Yii::t('dialog','Save Done'));
                $this->redirect(Yii::app()->createUrl('Quiz/edit',array('index'=>$model->id)));
            } else {
                $message = CHtml::errorSummary($model);
                Dialog::message(Yii::t('dialog','Validation Message'), $message);
                $this->render('form',array('model'=>$model,));
            }
        }
    }
    public function actionEdit()
    {
        echo 'edit';die;
        $model = new QuizForm('edit');
        if (!$model->retrieveData($index)) {
            throw new CHttpException(404,'The requested page does not exist.');
        } else {
            $this->render('form',array('model'=>$model,));
        }
    }

    /**
     * 测验返回值查询结果
     */
        Public function actionEmployeeInfoShow(){
            $employee_id= $_REQUEST['employee_id'];
            $get_quiz_id=$_REQUEST['get_quiz_id'];
            $employee_correct_rate_set="select * from employee_correct_rate WHERE quiz_employee_id=$employee_id AND employee_correct_rate_info_id=$get_quiz_id";
            $employee_correct_rate_get=Yii::app()->db2->createCommand($employee_correct_rate_set)->queryAll();
            $count=count($employee_correct_rate_get); //该测验同事的测验条数
            $resultOutPut=array();
            if($count>0) {  //如果该员工在该测验单有测验历史
                for ($i = 0; $i < $count; $i++) {
                    //$wrongForEachTest=array(); //存入错误题目数组,错题id  和错题 内容  (长期)
                    $wrongExamsArr = array();  //临时存的错误选项
                    if(!empty($employee_correct_rate_get[$i]['employee_quiz_questions_wrong'])){  //判断该员工在$i的测验中是否有错题
                        $resultOutPut[$i]=array('demo'=>1);
                        $wrongExamsArr = explode('-', $employee_correct_rate_get[$i]['employee_quiz_questions_wrong']);
                        for($k=0;$k<count($wrongExamsArr);$k++){
                            $eachWrongTestArr=array(); //临时存的每次题目的错题
                            //$eachWrongTestStr="";        //临时存的每次题目 错题 答案 错误选项
                            $eachWrongTestArr=explode('*',$wrongExamsArr[$k]);  //$eachWrongTestArr =array(0=>'id',1=>'wrongChoice');
                            $wrong_Answer_set="select * from test_exams WHERE id=$eachWrongTestArr[0]";
                            $wrong_Answer_get=Yii::app()->db2->createCommand($wrong_Answer_set)->queryAll();
                            $resultOutPut[$i][$k]['test_id']=$wrong_Answer_get[0]['id'];
                            $resultOutPut[$i][$k]['test_contents']=$wrong_Answer_get[0]['test_exams_contents'];    //问题
                            $resultOutPut[$i][$k]['test_rightChoice']=$wrong_Answer_get[0]['test_exams_answer_right'];//正确选项
                            $resultOutPut[$i][$k]['test_wrongChoice']=$wrong_Answer_get[0][$eachWrongTestArr[1]]; //错误选项
                        }
                        $resultOutPut[$i]['correct_rate']=$employee_correct_rate_get[$i]['employee_correct_rate']."%";     //答题正确率
                        $resultOutPut[$i]['answer_time']=$employee_correct_rate_get[$i]['employee_correct_rate_date']."秒"; //答题时长
                        $resultOutPut[$i]['shouldAnswerCount']=$employee_correct_rate_get[$i]['employee_quiz_questions_count'];//应答题目数量
                        $resultOutPut[$i]['countAll'] = $count."次";  //该同事$employee_id 在本次测验单的测验次数
                    }
                    else{
                        $resultOutPut[$i]=array('demo'=>0);
                        $resultOutPut[$i]['correct_rate']=$employee_correct_rate_get[$i]['employee_correct_rate']."%";     //答题正确率
                        $resultOutPut[$i]['answer_time']=$employee_correct_rate_get[$i]['employee_correct_rate_date']."秒"; //答题时长
                        $resultOutPut[$i]['shouldAnswerCount']=$employee_correct_rate_get[$i]['employee_quiz_questions_count'];//应答题目数量
                    }
                }
                $city=Yii::app()->user->city_allow();
                $quiz_info_set="select quiz_total_test_all,quiz_total_test_wrong_all,quiz_correct_rate from quiz where id=$get_quiz_id AND city_privileges IN ($city)";
                $quiz_info_get=Yii::app()->db2->createCommand($quiz_info_set)->queryAll();
                $countGetValue=count($resultOutPut);
                if(count($quiz_info_get)>0){
                    $resultOutPut[$countGetValue]['quiz_correct_rate']=$quiz_info_get[0]['quiz_correct_rate'];
                    $resultOutPut[$countGetValue]['quiz_total_test_all']=$quiz_info_get[0]['quiz_total_test_all'];
                    $resultOutPut[$countGetValue]['quiz_total_wrong_all']=$quiz_info_get[0]['quiz_total_test_wrong_all'];
                    $resultOutPut[$countGetValue]['countTime']=$count."条记录";
                }
            }
            else{
                $resultOutPut=array();
                $resultOutPut[0]['quiz_correct_rate']='无胜率记录';
                $resultOutPut[0]['quiz_total_test_all']='总计数量无';
                $resultOutPut[0]['quiz_total_wrong_all']='错误题量无';
                $resultOutPut[0]['countTime']="0条记录";
            }
           echo json_encode($resultOutPut);
         /*  $employee_id= $_REQUEST['employee_id'];
            $employee_id=5;
            $employee_correct_rate_set="select * from employee_correct_rate WHERE quiz_employee_id=$employee_id";
            $employee_correct_rate_get=Yii::app()->db2->createCommand($employee_correct_rate_set)->queryAll();
            $count=count($employee_correct_rate_get); //该测验同事的测验条数
            $resultOutPut=array();
            for($i=0;$i<$count;$i++){
                $wrongExamsArr=array();
                $resultOutPut[$i]['countAll']=$count;
                $wrongExamsArr=explode('-',$employee_correct_rate_get[$i]['employee_quiz_questions_wrong']);
            }
            echo json_encode();*/
        }
    protected function performAjaxValidation($model)
    {
        if(isset($_POST['ajax']) && $_POST['ajax']==='code-form')
        {
            echo CActiveForm::validate($model);
            Yii::app()->end();
        }
    }
    public static function allowReadWrite() {
        return Yii::app()->user->validRWFunction('C02');
    }

    public static function allowReadOnly() {
        return Yii::app()->user->validFunction('C02');
    }
}