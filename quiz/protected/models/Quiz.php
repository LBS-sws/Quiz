<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/14 0014
 * Time: 10:29
 */
Class Quiz extends CFormModel{
Public function tablename(){
    return Yii::app()->params['jsonTableName'].'test'.'quiz';
}
    Public function getDemodata(){
        $table=Yii::app()->params['jsonTableName'].'test'.'quiz';
        $sql="select * from $table where quiz_id=1";
        return $sql;
    }
}
?>