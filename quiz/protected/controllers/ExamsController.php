<?php

class ExamsController extends Controller
{
    public function actionIndex($pageNum=0)
    {
        $model = new ExamsList();
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

    Public function actionSaveAdd(){
        if (isset($_POST['ExamsAdd'])) {
            $model = new ExamsAdd($_POST['ExamsAdd']['scenario']);
            $model->attributes = $_POST['ExamsAdd'];
            if ($model->validate()) {

                $model->saveData();
                //$model->scenario = 'edit';
                Dialog::message(Yii::t('dialog','Information'), Yii::t('dialog','Save Done'));
                $this->redirect(Yii::app()->createUrl('exams/index',array('index'=>$model->id)));
            } else {

                $message = CHtml::errorSummary($model);
                Dialog::message(Yii::t('dialog','Validation Message'), $message);
                $this->render('index',array('model'=>$model,));
            }
        }
    }
    public function actionSave()
    {
        if (isset($_POST['ExamsForm'])) {
            $model = new ExamsForm($_POST['ExamsForm']['scenario']);
            $model->attributes = $_POST['ExamsForm'];
            if ($model->validate()) {
                $model->saveData();
                $index = $model->id;
//				$model->scenario = 'edit';
                if (!$model->retrieveData($index)) {
                    throw new CHttpException(404,'The requested page does not exist.');
                }
                Dialog::message(Yii::t('dialog','Information'), Yii::t('dialog','Save Done'));
                $this->redirect(Yii::app()->createUrl('exams/index',array('index'=>$model->id)));
            } else {
                $message = CHtml::errorSummary($model);
                Dialog::message(Yii::t('dialog','Validation Message'), $message);
                $this->render('index',array('model'=>$model,));
            }
        }
    }

    public function actionView($index)
    {
        $model = new ExamsAdd('view');
        if (!$model->retrieveData($index)) {
            throw new CHttpException(404,'The requested page does not exist.');
        } else {
            $this->render('form',array('model'=>$model,));
        }
    }

    public function actionNew()
    {
        $model = new ExamsForm('new');
        $model->log_dt = date("Y/m/d");
        $this->render('form',array('model'=>$model,));
    }

    public function actionEdit($index)
    {
        $model = new ExamsAdd('edit');
        if (!$model->retrieveData($index)) {
            throw new CHttpException(404,'The requested page does not exist.');
        } else {
            $this->render('add',array('model'=>$model,));
        }
    }

    public function actionDelete()
    {
        $model = new ExamsAdd('delete');
        if (isset($_POST['ExamsForm'])) {
            $model->attributes = $_POST['ExamsForm'];
            $model->saveData();
            Dialog::message(Yii::t('dialog','Information'), Yii::t('dialog','Record Deleted'));
        }
        $this->redirect(Yii::app()->createUrl('exams/index'));
    }

    /**
     * Performs the AJAX validation.
     * @param CModel the model to be validated
     */
    protected function performAjaxValidation($model)
    {
        if(isset($_POST['ajax']) && $_POST['ajax']==='exams-form')
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
