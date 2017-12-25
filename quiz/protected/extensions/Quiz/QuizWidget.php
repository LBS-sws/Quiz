<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/25 0025
 * Time: 15:44
 */

Class QuizWidget extends Cwidget{
    Public function run(){
        $searchValue="张";
        $tableFuss=Yii::app()->params['jsonTableName'];
        $sql="select employee_info_name from blog$tableFuss.employee_info WHERE id=1";
        $quizEmployeeId = Yii::app()->db2->createCommand($sql)->queryAll();

     $demo="aaa".$quizEmployeeId[0]['employee_info_name'];
     $html="<div style='height: 200px;width: 50px;border: 1px solid dimgrey;'>$demo.Quiz::demoData()</div>";
        echo $html;
    }
}