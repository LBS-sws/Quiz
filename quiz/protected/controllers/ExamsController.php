<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/19 0019
 * Time: 16:11
 */
Class ExamsController extends Controller
{

    public function actionIndex($pageNum=0)
    {
        $model = new ExamsList;
        if (isset($_POST['ExamsList'])) {
            $model->attributes = $_POST['ExamsList'];
        } else {
            $session = Yii::app()->session;
            if (isset($session['criteria_a05']) && !empty($session['criteria_a05'])) {
                $criteria = $session['criteria_a05'];
                $model->setCriteria($criteria);
            }
        }
        $model->determinePageNum($pageNum);
        $model->retrieveDataByPage($model->pageNum);
        $this->render('index',array('model'=>$model));
    }

    public function actionSave()
    {
        if (isset($_POST['ExamsForm'])) {
            $model = new LogisticForm($_POST['ExamsForm']['scenario']);
            $model->attributes = $_POST['ExamsForm'];
            if ($model->validate()) {
                $model->saveData();
                $index = $model->id;
//				$model->scenario = 'edit';
                if (!$model->retrieveData($index)) {
                    throw new CHttpException(404,'The requested page does not exist.');
                }
                Dialog::message(Yii::t('dialog','Information'), Yii::t('dialog','Save Done'));
                $this->redirect(Yii::app()->createUrl('logistic/edit',array('index'=>$model->id)));
            } else {
                $message = CHtml::errorSummary($model);
                Dialog::message(Yii::t('dialog','Validation Message'), $message);
                $this->render('form',array('model'=>$model,));
            }
        }
    }

    public function actionView($index)
    {
        $model = new LogisticForm('view');
        if (!$model->retrieveData($index)) {
            throw new CHttpException(404,'The requested page does not exist.');
        } else {
            $this->render('form',array('model'=>$model,));
        }
    }

    public function actionNew()
    {
        $model = new LogisticForm('new');
        $model->log_dt = date("Y/m/d");
        $this->render('form',array('model'=>$model,));
    }

    public function actionEdit($index)
    {
        $model = new LogisticForm('edit');
        if (!$model->retrieveData($index)) {
            throw new CHttpException(404,'The requested page does not exist.');
        } else {
            $this->render('form',array('model'=>$model,));
        }
    }

    public function actionDelete()
    {
        $model = new LogisticForm('delete');
        if (isset($_POST['LogisticForm'])) {
            $model->attributes = $_POST['LogisticForm'];
            $model->saveData();
            Dialog::message(Yii::t('dialog','Information'), Yii::t('dialog','Record Deleted'));
        }
        $this->redirect(Yii::app()->createUrl('logistic/index'));
    }

    /**
     * Performs the AJAX validation.
     * @param CModel the model to be validated
     */
    protected function performAjaxValidation($model)
    {
        if(isset($_POST['ajax']) && $_POST['ajax']==='logistic-form')
        {
            echo CActiveForm::validate($model);
            Yii::app()->end();
        }
    }

    public static function allowReadWrite() {
        return Yii::app()->user->validRWFunction('A05');
    }

    public static function allowReadOnly() {
        return Yii::app()->user->validFunction('A05');
    }
}
