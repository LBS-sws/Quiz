<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/19 0019
 * Time: 16:18
 */
class LogisticForm extends CFormModel
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
        array('id' => 0,
            'logid' => 0,
            'task' => 0,
            'qty' => '',
            'deadline' => '',
            'finish' => 'N',
            'uflag' => 'N',
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
            'id' => Yii::t('logistic', 'Record ID'),
            'seq' => Yii::t('logistic', 'No.'),
            'log_dt' => Yii::t('logistic', 'Date') . ' (Y/M/D)',
            'company_name' => Yii::t('logistic', 'Customer'),
            'follow_staff' => Yii::t('logistic', 'Resp. Staff'),
            'location' => Yii::t('logistic', 'Location'),
            'pay_method' => Yii::t('logistic', 'Payment Method'),
            'finish' => Yii::t('logistic', 'Finished'),
            'deadline' => Yii::t('logistic', 'Deadline'),
            'reason' => Yii::t('logistic', 'Job Status'),
            'task' => Yii::t('logistic', 'Task'),
            'qty' => Yii::t('logistic', 'Quantity'),
            'address' => Yii::t('logistic', 'Address'),
            'repair' => Yii::t('logistic', 'Repair Items'),
            'remarks' => Yii::t('logistic', 'Remarks'),
        );
    }

    /**
     * Declares the validation rules.
     */
    public function rules()
    {
        return array(
            array('id, follow_staff, company_id, pay_method, location_dtl, finish, deadline,
				reason, address, repair, remarks', 'safe'),
            array('company_name, location, log_dt', 'required'),
            array('seq', 'numerical', 'allowEmpty' => true, 'integerOnly' => true),
            array('seq', 'in', 'range' => range(0, 100)),
            array('log_dt', 'date', 'allowEmpty' => false,
                'format' => array('MM/dd/yyyy', 'dd/MM/yyyy', 'yyyy/MM/dd',
                    'MM-dd-yyyy', 'dd-MM-yyyy', 'yyyy-MM-dd',
                    'M/d/yyyy', 'd/M/yyyy', 'yyyy/M/d',
                    'M-d-yyyy', 'd-M-yyyy', 'yyyy-M-d',
                ),
            ),
            array('detail', 'validateDetailRecords'),
        );
    }

    public function validateDetailRecords($attribute, $params)
    {
        $rows = $this->$attribute;
        if (is_array($rows)) {
            foreach ($rows as $row) {
                if ($row['uflag'] == 'Y') {
                    if (empty($row['qty']) || !is_numeric($row['qty']))
                        $this->addError($attribute, Yii::t('logistic', 'Invalid quantity') . ' ' . $row['qty']);
                    if (empty($row['task']) || $row['task'] == 0)
                        $this->addError($attribute, Yii::t('logistic', 'Task cannot be empty'));
                    if (!empty($row['deadline']) && !General::isDate($row['deadline']))
                        $this->addError($attribute, Yii::t('logistic', 'Invalid deadline'));
                }
            }
        }
    }

    public function retrieveData($index)
    {
        $city = Yii::app()->user->city_allow();
        $sql = "select * from swo_logistic where id=$index and city in($city)";
        $rows = Yii::app()->db->createCommand($sql)->queryAll();
        if (count($rows) > 0) {
            foreach ($rows as $row) {
                $this->id = $row['id'];
                $this->seq = $row['seq'];
                $this->log_dt = General::toDate($row['log_dt']);
                $this->company_id = $row['company_id'];
                $this->company_name = $row['company_name'];
                $this->follow_staff = $row['follow_staff'];
                $this->pay_method = $row['pay_method'];
                $this->location = $row['location'];
                $this->location_dtl = $row['location_dtl'];
                $this->finish = $row['finish'];
                $this->deadline = $row['deadline'];
                $this->reason = $row['reason'];
                $this->address = $row['address'];
                $this->repair = $row['repair'];
                $this->remarks = $row['remarks'];
                break;
            }
        }

        $sql = "select * from swo_logistic_dtl where log_id=$index and city in($city)";
        $rows = Yii::app()->db->createCommand($sql)->queryAll();
        if (count($rows) > 0) {
            $this->detail = array();
            foreach ($rows as $row) {
                $temp = array();
                $temp['id'] = $row['id'];
                $temp['logid'] = $row['log_id'];
                $temp['task'] = $row['task'];
                $temp['qty'] = $row['qty'];
                $temp['deadline'] = General::toDate($row['deadline']);
                $temp['finish'] = $row['finish'];
                $temp['uflag'] = 'N';
                $this->detail[] = $temp;
            }
        }
        return true;
    }

    public function saveData()
    {
        $connection = Yii::app()->db;
        $transaction = $connection->beginTransaction();
        try {
            $this->saveLogistic($connection);
            $this->saveLogisticDtl($connection);
            $transaction->commit();
        } catch (Exception $e) {
            $transaction->rollback();
            throw new CHttpException(404, 'Cannot update.');
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
        if ($this->scenario == 'new') $this->seq = $this->getMaxSeq() + 1;

        $command = $connection->createCommand($sql);
        if (strpos($sql, ':id') !== false)
            $command->bindParam(':id', $this->id, PDO::PARAM_INT);
        if (strpos($sql, ':seq') !== false) {
            $seq = General::toMyNumber($this->seq);
            $command->bindParam(':seq', $seq, PDO::PARAM_INT);
        }
        if (strpos($sql, ':log_dt') !== false) {
            $ldate = General::toMyDate($this->log_dt);
            $command->bindParam(':log_dt', $ldate, PDO::PARAM_STR);
        }
        if (strpos($sql, ':company_id') !== false) {
            $cid = General::toMyNumber($this->company_id);
            $command->bindParam(':company_id', $cid, PDO::PARAM_INT);
        }
        if (strpos($sql, ':company_name') !== false)
            $command->bindParam(':company_name', $this->company_name, PDO::PARAM_STR);
        if (strpos($sql, ':follow_staff') !== false)
            $command->bindParam(':follow_staff', $this->follow_staff, PDO::PARAM_STR);
        if (strpos($sql, ':pay_method') !== false)
            $command->bindParam(':pay_method', $this->pay_method, PDO::PARAM_STR);
        if (strpos($sql, ':location') !== false)
            $command->bindParam(':location', $this->location, PDO::PARAM_STR);
        if (strpos($sql, ':location_dtl') !== false)
            $command->bindParam(':location_dtl', $this->location_dtl, PDO::PARAM_STR);
        if (strpos($sql, ':finish') !== false)
            $command->bindParam(':finish', $this->finish, PDO::PARAM_STR);
        if (strpos($sql, ':deadline') !== false)
            $command->bindParam(':deadline', $this->deadline, PDO::PARAM_STR);
        if (strpos($sql, ':reason') !== false)
            $command->bindParam(':reason', $this->reason, PDO::PARAM_STR);
        if (strpos($sql, ':address') !== false)
            $command->bindParam(':address', $this->address, PDO::PARAM_STR);
        if (strpos($sql, ':repair') !== false)
            $command->bindParam(':repair', $this->repair, PDO::PARAM_STR);
        if (strpos($sql, ':remarks') !== false)
            $command->bindParam(':remarks', $this->remarks, PDO::PARAM_STR);
        if (strpos($sql, ':city') !== false)
            $command->bindParam(':city', $city, PDO::PARAM_STR);
        if (strpos($sql, ':luu') !== false)
            $command->bindParam(':luu', $uid, PDO::PARAM_STR);
        if (strpos($sql, ':lcu') !== false)
            $command->bindParam(':lcu', $uid, PDO::PARAM_STR);
        $command->execute();

        if ($this->scenario == 'new')
            $this->id = Yii::app()->db->getLastInsertID();
        return true;
    }

    protected function saveLogisticDtl(&$connection)
    {
        $city = Yii::app()->user->city();
        $uid = Yii::app()->user->id;

        foreach ($this->detail as $row) {
            $sql = '';
            switch ($this->scenario) {
                case 'delete':
                    $sql = "delete from swo_logistic_dtl where log_id = :log_id and city = :city";
                    break;
                case 'new':
                    if ($row['uflag'] == 'Y') {
                        $sql = "insert into swo_logistic_dtl(
									log_id, task, qty, finish, deadline,
									city, luu, lcu
								) values (
									:log_id, :task, :qty, :finish, :deadline,
									:city, :luu, :lcu
								)";
                    }
                    break;
                case 'edit':
                    switch ($row['uflag']) {
                        case 'D':
                            $sql = "delete from swo_logistic_dtl where id = :id and city = :city";
                            break;
                        case 'Y':
                            $sql = ($row['id'] == 0)
                                ?
                                "insert into swo_logistic_dtl(
										log_id, task, qty, deadline, finish,
										city, luu, lcu
									) values (
										:log_id, :task, :qty, :deadline, :finish,
										:city, :luu, :lcu
									)
									"
                                :
                                "update swo_logistic_dtl set
										log_id = :log_id,
										task = :task,
										qty = :qty,
										deadline = :deadline,
										finish = :finish,
										luu = :luu
									where id = :id and city = :city
									";
                            break;
                    }
                    break;
            }

            if ($sql != '') {
                $command = $connection->createCommand($sql);
                if (strpos($sql, ':id') !== false)
                    $command->bindParam(':id', $row['id'], PDO::PARAM_INT);
                if (strpos($sql, ':log_id') !== false)
                    $command->bindParam(':log_id', $this->id, PDO::PARAM_INT);
                if (strpos($sql, ':task') !== false) {
                    $tk = General::toMyNumber($row['task']);
                    $command->bindParam(':task', $tk, PDO::PARAM_INT);
                }
                if (strpos($sql, ':qty') !== false) {
                    $qty = General::toMyNumber($row['qty']);
                    $command->bindParam(':qty', $qty, PDO::PARAM_INT);
                }
                if (strpos($sql, ':deadline') !== false) {
                    $dead = General::toMyDate($row['deadline']);
                    $command->bindParam(':deadline', $dead, PDO::PARAM_STR);
                }
                if (strpos($sql, ':finish') !== false)
                    $command->bindParam(':finish', $row['finish'], PDO::PARAM_STR);
                if (strpos($sql, ':city') !== false)
                    $command->bindParam(':city', $city, PDO::PARAM_STR);
                if (strpos($sql, ':luu') !== false)
                    $command->bindParam(':luu', $uid, PDO::PARAM_STR);
                if (strpos($sql, ':lcu') !== false)
                    $command->bindParam(':lcu', $uid, PDO::PARAM_STR);
                $command->execute();
            }
        }
        return true;
    }

    protected function getMaxSeq()
    {
        $city = Yii::app()->user->city();
        $ldate = General::toMyDate($this->log_dt);
        $sql = "select max(seq) from swo_logistic where log_dt='$ldate' and city='$city'";
        $max = Yii::app()->db->createCommand($sql)->queryScalar();
        return ($max === false ? 0 : $max);
    }
}