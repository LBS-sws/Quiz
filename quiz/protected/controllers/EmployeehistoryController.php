<?php
/**
 * Created by PhpStorm.
 * User: json
 * Date: 2018/1/17 0017
 * Time: 10:33
 */
header("Content-type: text/html; charset=utf-8");
Class EmployeehistoryController extends Controller{
    public function actionIndex($pageNum=0){
        $model=new EmployeehistoryList();
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
}