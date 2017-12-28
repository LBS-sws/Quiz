<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/28 0028
 * Time: 17:50
 */
header("Content-type: text/html; charset=utf-8");
Class TestResultController extends Controller

{
    Public $urlAjaxSubmit;
    Public $arr;
    Public $dataSearch;
    Public $selectData;
    Public $quiz_employee_date;
    public function actionIndex($pageNum = 0)
    {
        $model = new TestStartForm();
        if (isset($_POST['TestStartForm'])) {
            $model->attributes = $_POST['TestStartForm'];
        } else {
            $session = Yii::app()->session;
            if (isset($session['criteria_c02']) && !empty($session['criteria_c02'])){
                $criteria = $session['criteria_c02'];
                $model->setCriteria($criteria);
            }
        }
        $this->render('form', array('model' => $model));
    }

    Public function actionSubmitResult(){
        var_dump($_REQUEST);die;
        if (isset($_POST['TestResultForm'])) {
            $model = new TestStartForm($_POST['TestResultForm']['scenario']);
            $model->attributes = $_POST['TestResultForm'];
            if ($model->validate()) {
                $model->saveData();
                //$model->scenario = 'edit';
                Dialog::message(Yii::t('dialog', 'Information'), Yii::t('dialog', 'Quiz Starting!'));
                $this->redirect(Yii::app()->createUrl('TestStart/QuizStart', array('index' => 'quiz','quiz_id'=>$model->quiz_id,'employee_id'=>$model->employee_id)));
            } else {
                $message = CHtml::errorSummary($model);
                Dialog::message(Yii::t('dialog', 'Validation Message'), $message);
                $this->render('form', array('model' => $model,));
            }
        }
    }
    Public function actionGetResultData($quiz_id,$employee_id){

    }

    public static function allowReadWrite()
    {
        return Yii::app()->user->validRWFunction('C02');
    }

    public static function allowReadOnly()
    {
        return Yii::app()->user->validFunction('C02');
    }

}


