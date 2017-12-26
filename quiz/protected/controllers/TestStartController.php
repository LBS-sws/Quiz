<?php
/**
 * Created by PhpStorm.
 * User: json
 * Date: 2017/12/20 0020
 * Time: 11:02
 */
header("Content-type: text/html; charset=utf-8");
Class TestStartController extends Controller

{
    Public $urlAjaxSubmit;
    Public $arr;
    Public $dataSearch;
    Public $selectData;
    public function actionIndex($pageNum = 0)
    {
        //searching operation can get the value of searching result
        //var_dump($_REQUEST['QuizList']['searchField']);die;
        //$k=$_REQUEST['QuizList']['searchField'];
        //$v=$_REQUEST['QuizList']['searchValue'];
        $model = new TestStartForm();
        if (isset($_POST['TestStartForm'])) {
            $model->attributes = $_POST['TestStartForm'];
        } else {
            $session = Yii::app()->session;
            if (isset($session['criteria_c02']) && !empty($session['criteria_c02'])) {
                $criteria = $session['criteria_c02'];
                $model->setCriteria($criteria);
            }
        }
        $this->render('form', array('model' => $model));
    }
    public function actionView($index)
    {
        $model = new TestStartForm('view');
        if (!$model->retrieveData($index)) {
            throw new CHttpException(404, 'The requested page does not exist.');
        } else {
            $this->render('form', array('model' => $model,));
        }
    }

    Public function actionQuizStart(){
        $model = new TestStartForm();
        if (isset($_POST['TestStartForm'])) {
            $model->attributes = $_POST['TestStartForm'];
        } else {
            $session = Yii::app()->session;
            if (isset($session['criteria_c02']) && !empty($session['criteria_c02'])) {
                $criteria = $session['criteria_c02'];
                $model->setCriteria($criteria);
            }
        }
        $this->render('quiz', array('model' => $model));
    }

    /**
     * 提交的id employee_id  quiz_id
     */
    Public function actionSave()
    {
        if (isset($_POST['TestStartForm'])) {
            $model = new TestStartForm($_POST['TestStartForm']['scenario']);
            $model->attributes = $_POST['TestStartForm'];
            if ($model->validate()) {
                $model->saveData();
                //$model->scenario = 'edit';
                Dialog::message(Yii::t('dialog', 'Information'), Yii::t('dialog', 'Quiz Starting!'));
                $this->redirect(Yii::app()->createUrl('TestStart/QuizStart', array('index' => $model->id)));
            } else {
                $message = CHtml::errorSummary($model);
                Dialog::message(Yii::t('dialog', 'Validation Message'), $message);
                $this->render('form', array('model' => $model,));
            }
        }
    }

    protected function performAjaxValidation($model)
    {
        if (isset($_POST['ajax']) && $_POST['ajax'] === 'code-form') {
            echo CActiveForm::validate($model);
            Yii::app()->end();
        }
    }

    Public function actionAjaxUrl(){
    $this->dataSearch=$_REQUEST['searchValue'];
        $searchValue=$_REQUEST['searchValue'];
    /*    $tableFuss=Yii::app()->params['jsonTableName'];
        $sql="select employee_info_name from blog$tableFuss.employee_info WHERE employee_info_name=".%$searchValue%."";
        $quizEmployeeId = Yii::app()->db2->createCommand($sql)->queryAll();*/
      echo $searchValue;
    }



Public function actionSelectQuestions(){
    $selectValueOut=$_REQUEST['selectValueIn'];
    echo $selectValueOut;
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


