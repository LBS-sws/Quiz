<?php
header("Content-type: text/html; charset=utf-8");
class QuestionsForm extends CFormModel
{
    /* User Fields */
    public $id;
    Public $city_privileges;
    public $test_exams_contents;
    public $test_exams_answer_right;
    Public $test_exams_answer_faultf;
    Public $test_exams_answer_faults;
    Public $test_exams_answer_faultt;
    Public $test_exams_kinds;
    Public $selectValue=2;
    Public $arrData=array();
    Public $newData=array();

    public $log_dt;

    //Public $scenario;
    /**
     * Declares customized attribute labels.
     * If not declared here, an attribute would have a label that is
     * the same as its name with the first letter in upper case.
     */
    public function attributeLabels()
    {
        return array(
            'selectValueExams'=>Yii::t('quiz','selectValueExams'),
            'test_exams_answer_faultt'=>Yii::t('quiz','test_exams_answer_faultt'),
            'test_exams_answer_faults'=>Yii::t('quiz','test_exams_answer_faults'),
            'test_exams_answer_faultf'=>Yii::t('quiz','test_exams_answer_faultf'),
            'test_exams_answer_right'=>Yii::t('quiz','test_exams_answer_right'),
            'test_exams_contents'=>Yii::t('quiz','test_exams_contents'),
            'city_privileges'=>Yii::t('quiz','city_privileges'),
            'test_exams_kinds'=>Yii::t('quiz','test_exams_kinds'),
        );
    }

    /**
     * Declares the validation rules.
     */
    public function rules()
    {
        return array(
            array('test_exams_kinds,test_exams_answer_right,test_exams_contents,test_exams_answer_faultf,test_exams_answer_faults,test_exams_answer_faultt,city_privileges','required'),
            array('id','safe'),
        );
    }

    public function retrieveData($index)
    {
        $tableFuss=Yii::app()->params['jsonTableName'];
        $sql = "select * from blog$tableFuss.test_exams where id=".$index."";

        $rows = Yii::app()->db->createCommand($sql)->queryAll();

        if (count($rows) > 0)
        {
            foreach ($rows as $row)
            {
                $this->id = $row['id'];
                $this->test_exams_contents = $row['test_exams_contents'];
                $this->test_exams_answer_right = $row['test_exams_answer_right'];
                $this->city_privileges = $row['city_privileges'];
                $this->test_exams_answer_faultf = $row['test_exams_answer_faultf'];
                $this->test_exams_answer_faults = $row['test_exams_answer_faults'];
                $this->test_exams_answer_faultt = $row['test_exams_answer_faultt'];
                $this->test_exams_kinds=$row['test_exams_kinds'];
                break;
            }
        }
        $this->arrData=$rows;
/*
        $newSql="select * from blog$tableFuss.sa_good";
        $rows2 = Yii::app()->db->createCommand($newSql)->queryAll();
        $this->newData=$rows2;*/
        return true;
    }


    public function saveData()
    {
        $connection = Yii::app()->db;
        $transaction=$connection->beginTransaction();
        try {
            $this->saveUser($connection);
            $transaction->commit();
        }
        catch(Exception $e) {
            $transaction->rollback();
            throw new CHttpException(404,'Cannot update.');
        }
    }

    protected function saveUser(&$connection)
    {
        $tableFuss=Yii::app()->params['jsonTableName'];
        $sql = '';
        switch ($this->scenario) {
            case 'delete':
                $sql = "delete from blog$tableFuss.test_exams where id = :id";
                break;
            case 'new':
                $sql = "insert into blog$tableFuss.test_exams(
						test_exams_contents, test_exams_answer_right,city_privileges,test_exams_answer_faultf,test_exams_answer_faults,test_exams_answer_faultt,test_exams_kinds) values (
						:test_exams_contents, :test_exams_answer_right,:city_privileges,:test_exams_answer_faultf,:test_exams_answer_faults,:test_exams_answer_faultt,test_exams_kinds)";
                break;
            case 'edit':
                $sql = "update blog$tableFuss.test_exams set
					test_exams_contents = :test_exams_contents,
					test_exams_answer_right = :test_exams_answer_right,
					test_exams_answer_faultf=:test_exams_answer_faultf,
					test_exams_answer_faults=:test_exams_answer_faults,
					test_exams_answer_faultt=:test_exams_answer_faultt,
					test_exams_kinds=:test_exams_kinds,
					city_privileges=:city_privileges
					where id = :id";
                break;
        }

        $uid = Yii::app()->user->id;

        $command=$connection->createCommand($sql);

        if (strpos($sql,':id')!==false)
            $command->bindParam(':id',$this->id,PDO::PARAM_INT);
        if (strpos($sql,':test_exams_contents')!==false)
            $command->bindParam(':test_exams_contents',$this->test_exams_contents,PDO::PARAM_STR);
        if (strpos($sql,':test_exams_answer_right')!==false)
            $command->bindParam(':test_exams_answer_right',$this->test_exams_answer_right,PDO::PARAM_STR);
        if (strpos($sql,':test_exams_answer_faultf')!==false)
            $command->bindParam(':test_exams_answer_faultf',$this->test_exams_answer_faultf,PDO::PARAM_INT);
        if (strpos($sql,':test_exams_answer_faults')!==false)
            $command->bindParam(':test_exams_answer_faults',$this->test_exams_answer_faults,PDO::PARAM_STR);
        if (strpos($sql,':test_exams_answer_faultt')!==false)
            $command->bindParam(':test_exams_answer_faultt',$this->test_exams_answer_faultt,PDO::PARAM_STR);
        if (strpos($sql,':test_exams_kinds')!==false)
            $command->bindParam(':test_exams_kinds',$this->test_exams_kinds,PDO::PARAM_STR);
        if (strpos($sql,':city_privileges')!==false)
            $command->bindParam(':city_privileges',$this->city_privileges,PDO::PARAM_STR);

        $command->execute();

        if ($this->scenario=='new')
            $this->id = Yii::app()->db->getLastInsertID();
        return true;
    }

    public function isOccupied($index) {
        $rtn = false;
        $sql = "select a.id from swo_service a where a.cust_type=".$index." limit 1";
        $rows = Yii::app()->db->createCommand($sql)->queryAll();
        foreach ($rows as $row) {
            $rtn = true;
            break;
        }
        return $rtn;
    }
}
