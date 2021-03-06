<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/14 0014
 * Time: 10:25
 */
header("Content-type: text/html; charset=utf-8");
Class QuestionsController extends Controller{

    
    public function actionIndex($pageNum=0){
        //searching operation can get the value of searching result
        //var_dump($_REQUEST['QuizList']['searchField']);die;
        //$k=$_REQUEST['QuizList']['searchField'];
        //$v=$_REQUEST['QuizList']['searchValue'];
        $model=new QuestionsList();
        if (isset($_POST['QuestionsList'])) {
            $model->attributes = $_POST['QuestionsList'];
        } else {
            $session = Yii::app()->session;
            if (isset($session['criteria_c02']) && !empty($session['criteria_c02'])) {
                $criteria = $session['criteria_c02'];
                $model->setCriteria($criteria);
            }
        }
        $model->determinePageNum($pageNum);
        $model->retrieveDataByPage($model->pageNum);
        $this->render('index',array('model'=>$model));
    }

    //进入新增页面
    Public function actionNew(){
        $model = new QuestionsForm('new');
        $model->log_dt = date("Y/m/d");
        $this->render('form',array('model'=>$model));
    }


    public function actionView($index)
    {
        $model = new QuestionsForm('view');
        if (!$model->retrieveData($index)) {
            throw new CHttpException(404,'The requested page does not exist.');
        } else {
            $this->render('form',array('model'=>$model,));
        }
    }


    public function actionDelete()
    {
        var_dump($_REQUEST);die;
        $model = new QuestionsForm('delete');
        if (isset($_POST['QuestionsForm'])) {
            $model->attributes = $_POST['QuestionsForm'];
            if ($model->isOccupied($model->id)) {
                echo '1';die;
                Dialog::message(Yii::t('dialog','Warning'), Yii::t('dialog','This record is already in use'));
                $this->redirect(Yii::app()->createUrl('questions/edit',array('index'=>$model->id)));
            } else {
                echo '2';die;
                $model->saveData();
                Dialog::message(Yii::t('dialog','Information'), Yii::t('dialog','Record Deleted'));
                $this->redirect(Yii::app()->createUrl('questions/index'));
            }
        }
        else{
            echo '3';die;
        }
//		$this->actionIndex();
    }

    //点击保存后  跳转到表单页面 且有提交的保存数据
    Public function actionSave(){
        if (isset($_POST['QuestionsForm'])) {
            $model = new QuestionsForm($_POST['QuestionsForm']['scenario']);
            $model->attributes = $_POST['QuestionsForm'];
            if ($model->validate()) {
                $model->saveData();
                //$model->scenario = 'edit';
                Dialog::message(Yii::t('dialog','Information'), Yii::t('dialog','Save Done'));
                $this->redirect(Yii::app()->createUrl('Questions/edit',array('index'=>$model->id)));
            } else {
                $message = CHtml::errorSummary($model);
                Dialog::message(Yii::t('dialog','Validation Message'), $message);
                $this->render('form',array('model'=>$model,));
            }
        }
    }
    public function actionEdit($index)
    {
        $model = new QuestionsForm('edit');
        if (!$model->retrieveData($index)) {
            throw new CHttpException(404,'The requested page does not exist.');
        } else {
            $this->render('form',array('model'=>$model,));
        }
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