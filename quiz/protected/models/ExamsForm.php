<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/19 0019
 * Time: 16:18
 */
header("Content-type: text/html; charset=utf-8");
class ExamsForm extends CFormModel
{
    /* User Fields */
    public $id = 0;
    public $log_dt;
    public $seq;
    public $company_id;
    public $company_name;
    public $follow_staff;
    public $pay_method;
    public $location;
    public $location_dtl;
    public $finish;
    public $deadline;
    public $reason;
    public $detail = array(
        array('id'=>0,
            'logid'=>0,
            'task'=>0,
            'qty'=>'',
            'deadline'=>'',
            'finish'=>'N',
            'uflag'=>'N',
        ),
    );
    public $address;
    public $repair;
    public $remarks;

    /**
     * Declares customized attribute labels.
     * If not declared here, an attribute would have a label that is
     * the same as its name with the first letter in upper case.
     */
    public function attributeLabels()
    {
        return array(
            'id'=>Yii::t('logistic','Record ID'),
            'seq'=>Yii::t('logistic','No.'),
            'log_dt'=>Yii::t('logistic','Date').' (Y/M/D)',
            'company_name'=>Yii::t('logistic','Customer'),
            'follow_staff'=>Yii::t('logistic','Resp. Staff'),
            'location'=>Yii::t('logistic','Location'),
            'pay_method'=>Yii::t('logistic','Payment Method'),
            'finish'=>Yii::t('logistic','Finished'),
            'deadline'=>Yii::t('logistic','Deadline'),
            'kinds'=>Yii::t('quiz','kinds'),
            'test_exams_contents'=>Yii::t('quiz','test_exams_contents'),
            'test_exams_answer_right'=>Yii::t('quiz','test_exams_answer_right'),
            'test_exams_answer_faultf'=>Yii::t('quiz','test_exams_answer_faultf'),
            'test_exams_answer_faults'=>Yii::t('quiz','test_exams_answer_faults'),
            'test_exams_answer_faultt'=>Yii::t('quiz','test_exams_answer_faultt'),
        );
    }
    /**
     * Declares the validation rules.
     */
    public function rules()
    {
        return array(
            array('test_exams','required'),
            array('id','safe'),
        );
    }


    public function saveData()
    {

        $connection = Yii::app()->db;
        $transaction=$connection->beginTransaction();
        try {
     /*       $this->saveLogistic($connection);*/
            $this->saveLogisticDtl($connection);
            $transaction->commit();
        }
        catch(Exception $e) {
            $transaction->rollback();
            throw new CHttpException(404,'Cannot update.');
        }
    }
    protected function saveLogisticDtl(&$connection)
    {
        $user = Yii::app()->db2->createCommand()
            ->select('test_exams_contents')
            ->from('test_exams')
            ->where('id=:id', array(':id'=>1))
            ->queryRow();
        $arrAdd=$_REQUEST['ExamsForm']['detail'];
        foreach($arrAdd as $kArr){
            Yii::app()->db2->createCommand()->insert("test_exams",
                array("test_exams_contents"=>$kArr['test_exams_contents'],
                    "test_exams_answer_right"=>$kArr['test_exams_answer_right'],
                    "test_exams_answer_faultf"=>$kArr['test_exams_answer_faultf'],
                    "test_exams_answer_faults"=>$kArr['test_exams_answer_faults'],
                    "test_exams_answer_faultt"=>$kArr['test_exams_answer_faultt']));
        }

        return true;
    }
}