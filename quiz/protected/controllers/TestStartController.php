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
    Public $quiz_employee_date;
    public function actionIndex($pageNum = 0)
    {

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

    /**
     * @param employee_id,quiz_id
     * @throws
     * 进入测验单测试页面
     */
    Public function actionQuizStart(){
     $quiz_id=$_REQUEST['quiz_id'];
     $employee_id=$_REQUEST['employee_id'];
        $quiz_correct_employee_id=$_REQUEST['quiz_correct_employee_id'];
        $model = new TestForm('view');
        if (!$model->retrieveData($quiz_id,$employee_id,$quiz_correct_employee_id)) {
            throw new CHttpException(404, 'The requested page does not exist.');
        } else {
            $this->render('quiz', array('model' => $model,));
        }
    }

    /**
     * submit id employee_id  quiz_id
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
                $this->redirect(Yii::app()->createUrl('TestStart/QuizStart', array('index' => 'quiz','quiz_id'=>$model->quiz_id,'employee_id'=>$model->employee_id,'quiz_correct_employee_id'=>$model->quiz_correct_employee_id)));
            } else {
                $message = CHtml::errorSummary($model);
                Dialog::message(Yii::t('dialog', 'Validation Message'), $message);
                $this->render('form', array('model' => $model,));
            }
        }
    }

    Public function actionSubmitResult(){

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
    $tableFuss=Yii::app()->params['jsonTableName'];
    $sql="select quiz_employee_id from blog$tableFuss.quiz WHERE id=$selectValueOut";
    $quizEmployeeId = Yii::app()->db2->createCommand($sql)->queryAll();
    $arrResult=array();
    if(!empty($quizEmployeeId)){
        $IdPass=$quizEmployeeId[0]['quiz_employee_id'];
        $sqlNameArr="select * from blog$tableFuss.employee_info WHERE id IN ($IdPass)";
        $sqlNameArrResult = Yii::app()->db2->createCommand($sqlNameArr)->queryAll();
        $arrResult[0]=array('id'=>0,'employee_info_name'=>'选择人物');
        for($i=1;$i<count($sqlNameArrResult)+1;$i++){
            $arrResult[$i]['id']=$sqlNameArrResult[$i-1]['id'];
            $arrResult[$i]['employee_info_name']=$sqlNameArrResult[$i-1]['employee_info_name'];
        }
        echo json_encode($arrResult);
    }
    else{
        $arrResult[0]=array('id'=>0,'employee_info_name'=>'参数错误');
        echo json_encode($arrResult);
    }
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


