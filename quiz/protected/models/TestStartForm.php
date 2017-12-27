<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/20 0020
 * Time: 11:07
 */class TestStartForm extends CFormModel
{
    /* User Fields */
    public $id;
    Public $city_privileges;
    public $quiz_date;
    public $quiz_name;
    Public $quiz_correct_rate;
    Public $quiz_start_dt;
    Public $count_import;
    Public $quiz_employee_id;
    Public $employee_info;
    Public $scenario;
    Public $quiz_choose_id;
    Public $quiz_employee_choose_id;
    Public $quiz_id;
    Public $employee_id;
    Public $idArray;
    Public $quiz_employee_date;
    /**
     * Declares customized attribute labels.
     * If not declared here, an attribute would have a label that is
     * the same as its name with the first letter in upper case.
     */
    public function attributeLabels()
    {
        return array(
            'quiz_correct_rate'=>Yii::t('quiz','quiz_correct_rate'),
            'quiz_exams_id'=>Yii::t('quiz','quiz_exams_id'),
            'quiz_employee_id'=>Yii::t('quiz','quiz_employee_id'),
            'quiz_exams_count'=>Yii::t('quiz','quiz_exams_count'),
            'quiz_date'=>Yii::t('quiz','Question Name'),
            'QuizDate'=>Yii::t('quiz','Quiz Date'),
            'quiz_name'=>Yii::t('quiz','quiz_name'),
            'city_privileges'=>Yii::t('quiz','city_privileges'),
            'quiz_start_dt'=>Yii::t('quiz','quiz_start_dt'),
            'employee_info'=>Yii::t('quiz','employee_info'),
            'quiz_choose_id'=>Yii::t('quiz','quiz_choose_id'),
            'quiz_employee_choose_id'=>Yii::t('quiz','quiz_employee_choose_id'),
            'quiz_id'=>Yii::t('quiz','quiz_id'),
            'employee_id'=>Yii::t('quiz','employee_id'),
            'quiz_employee_date'=>Yii::t('quiz','quiz_employee_date')
        );
    }

    /**
     * Declares the validation rules.
     */
    public function rules()
    {
        return array(
            array('quiz_id,employee_id','required'),
            array('id,quiz_start_dt,quiz_name,quiz_correct_rate,quiz_exams_id,quiz_employee_id,quiz_exams_count,city_privileges','safe'),
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
                break;
            }
        }


        return true;
    }

    public function saveData()
    {
        $Qid=$_REQUEST['TestStartForm']['quiz_id'];
        $Eid=$_REQUEST['TestStartForm']['employee_id'];
        $connection = Yii::app()->db2;
        $sql="INSERT INTO blog_test.employee_correct_rate (employee_correct_rate_info_id,quiz_employee_id)VALUES($Qid,$Eid);";
        $command=$connection->createCommand($sql);
        $command->execute();
        return true;
    }
/*
 * $this->scenario=>null
 */
    protected function saveUser(&$connection)
    {
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
        $command->execute();

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