<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/1/2 0002
 * Time: 09:28
 */
header("Content-type: text/html; charset=utf-8");
Class TesthistoryController extends Controller{
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
                $this->redirect(Yii::app()->createUrl('quiz/edit',array('index'=>$model->id)));
            } else {
                $model->saveData();
                Dialog::message(Yii::t('dialog','Information'), Yii::t('dialog','Record Deleted'));
                $this->redirect(Yii::app()->createUrl('quiz/index'));
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
                $this->redirect(Yii::app()->createUrl('quiz/edit',array('index'=>$model->id)));
            } else {
                $message = CHtml::errorSummary($model);
                Dialog::message(Yii::t('dialog','Validation Message'), $message);
                $this->render('form',array('model'=>$model,));
            }
        }
    }
    public function actionEdit()
    {
        echo '有HK01权限也不能修改';die;
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
                    $strFactDone="";
                    $countStrFactDone="";
                    $strFactDone=$employee_correct_rate_get[$i]['employee_quiz_questions_all'];
                    $resultOutPut[$i]['correct_rate']=$employee_correct_rate_get[$i]['employee_correct_rate'];  //每次测验正确率
                    $strFactDone=explode('-',$strFactDone);
                    $countStrFactDone=count($strFactDone);
                    $resultOutPut[$i]['fact_done_counts']=$countStrFactDone;  //每次测验实际做题数目
                    $resultOutPut[$i]['should_done_counts']=$employee_correct_rate_get[$i]['employee_quiz_questions_count']; //每次测验应做的题目数量
                    $resultOutPut[$i]['wrong_done_counts']=$employee_correct_rate_get[$i]['employee_quiz_wrong_questions_count'];  //每次测验做的错题数量
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