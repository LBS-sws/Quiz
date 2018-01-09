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

    /**
     * 文件上传
     */
    Public function actionDemo(){
        try{
            //上传成功
            Yii::app()->file->upload();
        }catch (CException $e){
            $errors = Yii::app()->file->getError();
            //errors错误信息数组
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
       /*  excel上传为csv文件读取上传到数据库
       $goods_list=array();
        $file = fopen(Yii::app()->basePath.'/data/demo.csv','r');
        $data = fgetcsv($file);
        while ($data = fgetcsv($file)) {
            //每次读取CSV里面的一行内容
            $goods_list[] = $data;
        }
        fclose($file);
        $newData=array();
        for($k=0;$k<count($goods_list);$k++){
            $newData[$k]['content']=$goods_list[$k][0];
            $newData[$k]['right']=$goods_list[$k][1];
            $newData[$k]['faultf']=$goods_list[$k][2];
            $newData[$k]['faults']=$goods_list[$k][3];
            $newData[$k]['faultt']=$goods_list[$k][4];
        }
        //$model = new ExamsForm('new');
        $result=true;
        $city = Yii::app()->user->city();
        for($i=0;$i<count($newData);$i++){
            $command = Yii::app()->db2->createCommand();
            $command->insert('test_exams', array(
                'test_exams_contents'=>$newData[$i]['content'],
                'test_exams_answer_right'=>$newData[$i]['right'],
                'test_exams_answer_faultf'=>$newData[$i]['faultf'],
                'test_exams_answer_faults'=>$newData[$i]['faults'],
                'test_exams_answer_faultt'=>$newData[$i]['faultt'],
                'city_privileges'=>$city,
            ));
        }
      if($result){
          Dialog::message(Yii::t('dialog','Warning'), Yii::t('Quiz','File data uploads successfully'));
          $this->redirect(Yii::app()->createUrl('Exams/Index'));
      }
        else{
            Dialog::message(Yii::t('dialog','Warning'), Yii::t('Quiz','File data uploads failed'));
            $this->redirect(Yii::app()->createUrl('Exams/Index'));
        }*/
        $model = new ExamsForm('new');
        $model->log_dt = date("Y/m/d");
        $this->render('form',array('model'=>$model,));
    }


    Public function actionSaveFileData($goods_list){

        return true;
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
        if (isset($_POST['ExamsAdd'])) {
            $model->attributes = $_POST['ExamsAdd'];
            if ($model->isOccupied($model->id)) {

                Dialog::message(Yii::t('dialog','Warning'), Yii::t('dialog','This record is already in use'));
                $this->redirect(Yii::app()->createUrl('Exams/edit',array('index'=>$model->id)));
            } else {

                $model->saveData();
                Dialog::message(Yii::t('dialog','Information'), Yii::t('dialog','Record Deleted'));
                $this->redirect(Yii::app()->createUrl('Exams/index'));
            }
        }
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
