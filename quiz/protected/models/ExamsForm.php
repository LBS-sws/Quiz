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
    public $test_exams_contents;
    public $test_exams_answer_right;
    public $test_exams_answer_faults;
    public $test_exams_answer_faultt;
    public $location_dtl;
    public $finish;
    public $deadline;
    public $reason;
    public $detail = array(
        array('id'=>0,
            'logid'=>0,
            'test_exams_kinds'=>0,
            'test_exams_answer_faults'=>'',
            'test_exams_answer_faultt'=>'',
            'finish'=>'N',
            'test_exams_answer_right'=>'',
            'test_exams_answer_faultf'=>'',
            'test_exams_contents'=>'',
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
            'test_exams_kinds'=>Yii::t('quiz','test_exams_kinds'),
        );
    }

    /**
     * Declares the validation rules.
     */
/*    public function rules()
    {
        return array(
            // username and password are required
            array('test_exams_contents', 'required'),
        );
    }*/


    public function retrieveData($index)
    {

        return true;
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

    protected function saveLogistic(&$connection)
    {
        $sql = '';
        switch ($this->scenario) {
            case 'delete':
                $sql = "delete from swo_logistic where id = :id and city = :city";
                break;
            case 'new':
                echo '添加错误';die;
                $sql = "insert into swo_logistic(
							log_dt, seq, company_id, company_name, follow_staff, pay_method,
							location, location_dtl, finish, deadline, reason, address, repair, remarks,
							city, luu, lcu
						) values (
							:log_dt, :seq, :company_id, :company_name, :follow_staff, :pay_method,
							:location, :location_dtl, :finish, :deadline, :reason, :address, :repair, :remarks,
							:city, :luu, :lcu
						)";
                break;
            case 'edit':
                $sql = "update swo_logistic set
							log_dt = :log_dt,
							seq = :seq,
							company_id = :company_id,
							company_name = :company_name,
							follow_staff = :follow_staff,
							pay_method = :pay_method,
							location = :location,
							location_dtl = :location_dtl,
							finish = :finish,
							deadline = :deadline,
							reason = :reason,
							address = :address,
							repair = :repair,
							remarks = :remarks,
							luu = :luu
						where id = :id and city = :city
						";
                break;
        }

        $city = Yii::app()->user->city();
        $uid = Yii::app()->user->id;
        if ($this->scenario=='new') $this->seq = $this->getMaxSeq()+1;

        $command=$connection->createCommand($sql);
        if (strpos($sql,':id')!==false)
            $command->bindParam(':id',$this->id,PDO::PARAM_INT);
        if (strpos($sql,':seq')!==false) {
            $seq = General::toMyNumber($this->seq);
            $command->bindParam(':seq',$seq,PDO::PARAM_INT);
        }
        if (strpos($sql,':log_dt')!==false) {
            $ldate = General::toMyDate($this->log_dt);
            $command->bindParam(':log_dt',$ldate,PDO::PARAM_STR);
        }
        if (strpos($sql,':company_id')!==false) {
            $cid = General::toMyNumber($this->company_id);
            $command->bindParam(':company_id',$cid,PDO::PARAM_INT);
        }
        if (strpos($sql,':company_name')!==false)
            $command->bindParam(':company_name',$this->company_name,PDO::PARAM_STR);
        if (strpos($sql,':follow_staff')!==false)
            $command->bindParam(':follow_staff',$this->follow_staff,PDO::PARAM_STR);
        if (strpos($sql,':pay_method')!==false)
            $command->bindParam(':pay_method',$this->pay_method,PDO::PARAM_STR);
        if (strpos($sql,':location')!==false)
            $command->bindParam(':location',$this->location,PDO::PARAM_STR);
        if (strpos($sql,':location_dtl')!==false)
            $command->bindParam(':location_dtl',$this->location_dtl,PDO::PARAM_STR);
        if (strpos($sql,':finish')!==false)
            $command->bindParam(':finish',$this->finish,PDO::PARAM_STR);
        if (strpos($sql,':deadline')!==false)
            $command->bindParam(':deadline',$this->deadline,PDO::PARAM_STR);
        if (strpos($sql,':reason')!==false)
            $command->bindParam(':reason',$this->reason,PDO::PARAM_STR);
        if (strpos($sql,':address')!==false)
            $command->bindParam(':address',$this->address,PDO::PARAM_STR);
        if (strpos($sql,':repair')!==false)
            $command->bindParam(':repair',$this->repair,PDO::PARAM_STR);
        if (strpos($sql,':remarks')!==false)
            $command->bindParam(':remarks',$this->remarks,PDO::PARAM_STR);
        if (strpos($sql,':city')!==false)
            $command->bindParam(':city',$city,PDO::PARAM_STR);
        if (strpos($sql,':luu')!==false)
            $command->bindParam(':luu',$uid,PDO::PARAM_STR);
        if (strpos($sql,':lcu')!==false)
            $command->bindParam(':lcu',$uid,PDO::PARAM_STR);
        $command->execute();

        if ($this->scenario=='new')
            $this->id = Yii::app()->db->getLastInsertID();
        return true;
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

    protected function getMaxSeq() {
        $city = Yii::app()->user->city();
        $ldate = General::toMyDate($this->log_dt);
        $sql = "select max(seq) from swo_logistic where log_dt='$ldate' and city='$city'";
        $max = Yii::app()->db->createCommand($sql)->queryScalar();
        return ($max===false ? 0 : $max);
    }
}