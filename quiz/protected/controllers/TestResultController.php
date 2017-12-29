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

    /**
     * 获取员工提交的测验题
     */
    Public function actionSubmitResult(){
     $contentArray=$_REQUEST['contents'];  //提交的 且做了的题目(错与对的题都包含)

        $final_result = array();
        if(!empty($contentArray)) {
            $newNewArray = array();
            foreach ($contentArray as $v) {
                $newNewArray[] = $v;
            }
            $test_exams_id_array = array_keys($contentArray);
            if (count($test_exams_id_array) == count($newNewArray)) {
                for ($i = 0; $i < count($test_exams_id_array); $i++) {
                    $final_result[$i]['id'] = $test_exams_id_array[$i];
                    $final_result[$i]['test_result'] = $newNewArray[$i];
                }
            }
            else{
                $final_result=array();
            }
        }
        else{
            $final_result=array();
        }
        if (isset($_POST['TestForm'])) {
            $model = new TestForm($_POST['TestForm']['scenario']);
            $model->attributes = $_POST['TestForm'];
            if (!empty($contentArray)){
                $model->saveData($final_result);
                //$model->scenario = 'edit';
                Dialog::message(Yii::t('dialog', 'Information'), Yii::t('dialog', 'Quiz Starting!'));
                $this->redirect(Yii::app()->createUrl('TestStart/QuizResult', array('index' => 'quiz','quiz_id'=>$model->quiz_id,'employee_id'=>$model->employee_id)));
            } else {
                var_dump($_POST['TestForm']);die;
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

