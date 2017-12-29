<?php
header("Content-type: text/html; charset=utf-8");
class TestResultForm extends CFormModel
{
    /* User Fields */
    public $id;
    Public $city_privileges;
    public $quiz_date;
    public $quiz_name;
    Public $quiz_correct_rate;
    Public $quiz_exams_id;
    Public $quiz_employee_id;
    Public $quiz_exams_count;
    Public $quiz_start_dt;
    Public $count_import;
    Public $count_questions;
    Public $checkBoxValue;
    Public $select_employee;
    //Public $scenario;
    /**
     * Declares customized attribute labels.
     * If not declared here, an attribute would have a label that is
     * the same as its name with the first letter in upper case.
     */
    public function attributeLabels()
    {
        return array(
            'select_employee'=>Yii::t('quiz','select_employee'),
            'quiz_correct_rate'=>Yii::t('quiz','quiz_correct_rate'),
            'quiz_exams_id'=>Yii::t('quiz','quiz_exams_id'),
            'quiz_employee_id'=>Yii::t('quiz','quiz_employee_id'),
            'quiz_exams_count'=>Yii::t('quiz','quiz_exams_count'),
            'quiz_date'=>Yii::t('quiz','Question Name'),
            'QuizDate'=>Yii::t('quiz','Quiz Date'),
            'quiz_name'=>Yii::t('quiz','quiz_name'),
            'city_privileges'=>Yii::t('quiz','city_privileges'),
            'quiz_start_dt'=>Yii::t('quiz','quiz_start_dt'),
            'count_questions'=>Yii::t('quiz','count_questions'),
            'quiz_exams_count_set'=>Yii::t('quiz','quiz_exams_count_set'),
        );
    }

    /**
     * Declares the validation rules.
     */
    public function rules()
    {
        return array(
            array('id','safe'),
        );
    }

    public function retrieveData($index)
    {

        $tableFuss=Yii::app()->params['jsonTableName'];
        $sql = "select * from blog$tableFuss.quiz where id=".$index."";

        $rows = Yii::app()->db->createCommand($sql)->queryAll();

        if (count($rows) > 0)
        {
            foreach ($rows as $row)
            {
                $this->id = $row['id'];
                $this->quiz_date = $row['quiz_date'];
                $this->quiz_name = $row['quiz_name'];
                $this->city_privileges = $row['city_privileges'];
                $this->quiz_correct_rate = $row['quiz_correct_rate'];
                $this->quiz_exams_id = $row['quiz_exams_id'];
                $this->quiz_start_dt = General::toDate($row['quiz_start_dt']);
                $this->quiz_exams_count = $row['quiz_exams_count'];
                $this->quiz_employee_id=$row['quiz_employee_id'];
                $this->count_questions='';
                break;
            }
        }
        $this->count_import=array();

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
        $_REQUEST['quiz_employee_id']=implode(',',$_REQUEST['quiz_employee_id']);
        $_REQUEST['QuizForm']['quiz_employee_id']=$_REQUEST['quiz_employee_id'];
        $this->quiz_employee_id=$_REQUEST['QuizForm']['quiz_employee_id'];
        $tableFuss=Yii::app()->params['jsonTableName'];
        $sql = '';
        switch ($this->scenario) {
            case 'delete':
                $sql = "delete from blog$tableFuss.quiz where id = :id";
                break;
            case 'new':
                $sql = "insert into blog$tableFuss.quiz(
						quiz_date, quiz_name,city_privileges,quiz_correct_rate,quiz_exams_id,quiz_exams_count,quiz_employee_id,quiz_start_dt) values (
						:quiz_date, :quiz_name,:city_privileges,:quiz_correct_rate,:quiz_exams_id,:quiz_exams_count,:quiz_employee_id,:quiz_start_dt)";
                break;
            case 'edit':
                $sql = "update blog$tableFuss.quiz set
					quiz_date = :quiz_date,
					quiz_name = :quiz_name,
					quiz_exams_count=:quiz_exams_count,
					quiz_employee_id=:quiz_employee_id,
					quiz_exams_id=:quiz_exams_id,
					quiz_correct_rate=:quiz_correct_rate,
					city_privileges=:city_privileges,
					quiz_start_dt=:quiz_start_dt
					where id = :id";
                break;
        }

        $uid = Yii::app()->user->id;

        $command=$connection->createCommand($sql);

        if (strpos($sql,':id')!==false)
            $command->bindParam(':id',$this->id,PDO::PARAM_INT);
        if (strpos($sql,':quiz_date')!==false)
            $command->bindParam(':quiz_date',$this->quiz_date,PDO::PARAM_STR);
        if (strpos($sql,':quiz_name')!==false)
            $command->bindParam(':quiz_name',$this->quiz_name,PDO::PARAM_STR);
        if (strpos($sql,':quiz_start_dt')!==false) {
            $quizDate = General::toMyDate($this->quiz_start_dt);
            $command->bindParam(':quiz_start_dt',$quizDate,PDO::PARAM_STR);
        }
        if (strpos($sql,':quiz_exams_count')!==false)
            $command->bindParam(':quiz_exams_count',$this->quiz_exams_count,PDO::PARAM_INT);
        if (strpos($sql,':quiz_employee_id')!==false)
            $command->bindParam(':quiz_employee_id',$this->quiz_employee_id,PDO::PARAM_STR );
        if (strpos($sql,':quiz_exams_id')!==false)
            $command->bindParam(':quiz_exams_id',$this->quiz_exams_id,PDO::PARAM_STR);
        if (strpos($sql,':quiz_correct_rate')!==false)
            $command->bindParam(':quiz_correct_rate',$this->quiz_correct_rate,PDO::PARAM_STR);
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
