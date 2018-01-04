<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/14 0014
 * Time: 10:25
 */
header("Content-type: text/html; charset=utf-8");
 Class QuizController extends Controller{
    Public $urlAjaxSelect;
    Public $arr;
     public function actionIndex($pageNum=0){
         //searching operation can get the value of searching result
      //var_dump($_REQUEST['QuizList']['searchField']);die;
         //$k=$_REQUEST['QuizList']['searchField'];
         //$v=$_REQUEST['QuizList']['searchValue'];
         $model=new QuizList();
         if (isset($_POST['QuizList'])) {
             $model->attributes = $_POST['QuizList'];
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


     public function actionView($index)
     {
         $model = new QuizForm('view');
         if (!$model->retrieveData($index)) {
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
     public function actionEdit($index)
     {
         $model = new QuizForm('edit');
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