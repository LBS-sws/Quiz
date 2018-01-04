<?php
/**
 * Created by PhpStorm.
 * User: json
 * Date: 2017/12/20 0020
 * Time: 11:02
 */
Class TestsearchController extends Controller
{
    Public $arr;
    public function actionIndex($pageNum = 0)
    {

        $model = new TestSearchList();
        if (isset($_POST['TestSearchList'])) {
            $model->attributes = $_POST['TestSearchList'];
        } else {
            $session = Yii::app()->session;
            if (isset($session['criteria_c02']) && !empty($session['criteria_c02'])) {
                $criteria = $session['criteria_c02'];
                $model->setCriteria($criteria);
            }
        }
        $model->determinePageNum($pageNum);
        $model->retrieveDataByPage($model->pageNum);
        $this->render('index', array('model' => $model));
    }

    public function actionView($index)
    {
        $model = new TestSearchForm('view');
        if (!$model->retrieveData($index)) {
            throw new CHttpException(404, 'The requested page does not exist.');
        } else {
            $this->render('form', array('model' => $model,));
        }
    }

    protected function performAjaxValidation($model)
    {
        if (isset($_POST['ajax']) && $_POST['ajax'] === 'code-form') {
            echo CActiveForm::validate($model);
            Yii::app()->end();
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
?>
