<?php
/**
 * Created by PhpStorm.
 * User: json
 * Date: 2017/12/20 0020
 * Time: 11:02
 */
Class TestSearchController extends Controller
{
    Public $arr;
    public function actionIndex($pageNum = 0)
    {
        //searching operation can get the value of searching result
        //var_dump($_REQUEST['QuizList']['searchField']);die;
        //$k=$_REQUEST['QuizList']['searchField'];
        //$v=$_REQUEST['QuizList']['searchValue'];
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


    //进入新增页面
    Public function actionNew()
    {
        $model = new TestSearchForm('new');
        $this->render('form', array('model' => $model,));
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


    public function actionDelete()
    {
        $model = new TestSearchForm('delete');
        if (isset($_POST['TestSearchForm'])) {
            $model->attributes = $_POST['TestSearchForm'];
            if ($model->isOccupied($model->id)) {
                Dialog::message(Yii::t('dialog', 'Warning'), Yii::t('dialog', 'This record is already in use'));
                $this->redirect(Yii::app()->createUrl('TestSearch/edit', array('index' => $model->id)));
            } else {
                $model->saveData();
                Dialog::message(Yii::t('dialog', 'Information'), Yii::t('dialog', 'Record Deleted'));
                $this->redirect(Yii::app()->createUrl('Quiz/index'));
            }
        }
//		$this->actionIndex();
    }

    //点击保存后  跳转到表单页面 且有提交的保存数据
    Public function actionSave()
    {

        if (isset($_POST['TestSearchForm'])) {
            $model = new TestStartForm($_POST['TestSearchForm']['scenario']);
            $model->attributes = $_POST['TestSearchForm'];

            if ($model->validate()) {
                $model->saveData();

                //$model->scenario = 'edit';
                Dialog::message(Yii::t('dialog', 'Information'), Yii::t('dialog', 'Save Done'));
                $this->redirect(Yii::app()->createUrl('TestSearch/edit', array('index' => $model->id)));
            } else {
                $message = CHtml::errorSummary($model);
                Dialog::message(Yii::t('dialog', 'Validation Message'), $message);
                $this->render('form', array('model' => $model,));
            }
        }
    }

    public function actionEdit($index)
    {
        $model = new TestSearchForm('edit');
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