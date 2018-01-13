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
     Public function actiondefault(){
         $connection = Yii::app()->db2;
         $transaction=$connection->beginTransaction();
         try {
             $employee_info_set="select id from employee_info_v WHERE 1=1";
             $employee_info_get=Yii::app()->db2->createCommand($employee_info_set)->queryAll();
             $employee_info_str="";
             for($i=0;$i<count($employee_info_get);$i++){
                 $employee_info_str.=$employee_info_get[$i]['id'].',';
             }
             $employee_info_str=trim($employee_info_str,',');
             $quiz_update_set="update quiz set quiz_employee_id='$employee_info_str' WHERE id>0";
             Yii::app()->db2->createCommand($quiz_update_set)->execute();
             $transaction->commit();
             Dialog::message(Yii::t('dialog','Warning'), Yii::t('dialog','all checked success'));
             $this->redirect(Yii::app()->createUrl('quiz/index'));
         }
         catch(Exception $e) {
             $transaction->rollback();
             Dialog::message(Yii::t('dialog','Information'), Yii::t('dialog','all checked failed'));
             $this->redirect(Yii::app()->createUrl('quiz/index'));
         }
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

     Public function actionSave(){
         $_REQUEST['QuizForm']['quiz_exams_id']=$_REQUEST['quiz_exams_id'];
         $dateEnd=strtotime($_REQUEST['QuizForm']['quiz_end_dt']);  //开始时间
         //1516204800  ["quiz_start_dt"]=> string(10) "2018/01/18"     1516723200 ["quiz_end_dt"]=> string(10) "2018/01/24"
         $dateStart=strtotime($_REQUEST['QuizForm']['quiz_start_dt']); //截止时间
             if (!empty($_REQUEST['QuizForm']['quiz_start_dt']) || !empty($_REQUEST['QuizForm']['quiz_end_dt'])) {
                 if ($dateStart < $dateEnd) {
                     Dialog::message(Yii::t('dialog', 'Warning'), Yii::t('quiz', 'The start time should not be less than the end time!'));
                     $this->redirect(Yii::app()->createUrl('quiz/edit', array('index' => $_REQUEST['QuizForm']['id'])));
                 } elseif ($dateStart == $dateEnd) {
                     Dialog::message(Yii::t('dialog', 'Warning'), Yii::t('quiz', 'The start time should not equal the end time!'));
                     $this->redirect(Yii::app()->createUrl('quiz/edit', array('index' => $_REQUEST['QuizForm']['id'])));
                 } else {  //开始时间小于截止时间 再judge选择的是长期还是短期
                     if (isset($_POST['QuizForm'])) {
                         $model = new QuizForm($_POST['QuizForm']['scenario']);
                         $model->attributes = $_POST['QuizForm'];
                         if ($model->validate()) {
                             $model->saveData();
                             Dialog::message(Yii::t('dialog', 'Information'), Yii::t('dialog', 'Save Done'));
                             $this->redirect(Yii::app()->createUrl('quiz/edit', array('index' => $model->id)));
                         } else {
                             $message = CHtml::errorSummary($model);
                             Dialog::message(Yii::t('dialog', 'Validation Message'), $message);
                             $this->render('form', array('model' => $model,));
                         }
                     }
                 }
             }
         else{
             Dialog::message(Yii::t('dialog','Information'), Yii::t('quiz','The value of the date should be empty!'));
             $this->redirect(Yii::app()->createUrl('quiz/edit',array('index'=>$_REQUEST['QuizForm']['id'])));
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