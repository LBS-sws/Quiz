<?php

$this->pageTitle=Yii::app()->name . ' - Customer Type Form';
?>

<?php $form=$this->beginWidget('TbActiveForm', array(
    'id'=>'code-form',
    'enableClientValidation'=>true,
    'clientOptions'=>array('validateOnSubmit'=>true,),
    'layout'=>TbHtml::FORM_LAYOUT_HORIZONTAL,
)); ?>

<section class="content-header">
    <h1>
        <strong><?php echo Yii::t('quiz','quiz questions order'); ?></strong>
    </h1>
    <!--
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Layout</a></li>
            <li class="active">Top Navigation</li>
        </ol>
    -->
</section>

<section class="content">
    <div class="box">
        <div class="box-body">
            <div class="btn-group" role="group">
                <!-- --><?php
                /*                if ($model->scenario!='new' && $model->scenario!='view') {
                                    echo TbHtml::button('<span class="fa fa-file-o"></span> '.Yii::t('misc','Add Another'), array(
                                        'submit'=>Yii::app()->createUrl('teststart/new')));
                                }
                                */?>
                <?php echo TbHtml::button('<span class="fa fa-reply"></span> '.Yii::t('misc','Back'), array(
                    'submit'=>Yii::app()->createUrl('teststart/index')));
                ?>
                <?php if ($model->scenario!='view'): ?>
                    <?php echo TbHtml::button('<span class="fa fa-upload"></span> '.Yii::t('misc','Submit quiz Form'), array(
                        'submit'=>Yii::app()->createUrl('testresult/SubmitResult')));
                    ?>
                <?php endif ?>

                <?php if ($model->scenario=='edit'): ?>
                    <?php echo TbHtml::button('<span class="fa fa-remove"></span> '.Yii::t('misc','Delete'), array(
                            'name'=>'btnDelete','id'=>'btnDelete','data-toggle'=>'modal','data-target'=>'#removedialog',)
                    );
                    ?>
                <?php endif ?>
            </div>
        </div>
    </div>

    <div class="box box-info">
        <div class="box-body">
            <?php echo $form->hiddenField($model, 'scenario'); ?>
            <?php echo $form->hiddenField($model, 'id'); ?>
            <?php echo $form->hiddenField($model,'employee_id')?>
            <?php echo $form->hiddenField($model,'quiz_correct_employee_id');?>
            <?php echo $form->hiddenField($model,'quiz_exams_count')?>
            <?php echo $form->hiddenField($model,'quiz_date')?>
            <!-- <script src="<?php /*echo Yii::app()->baseUrl;*/?>/js/jquery-1.3.2.min.js'"></script>-->
            <div id="showData"></div>

            <div class="form-group">
                <div class="col-sm-5">
                </div>
                <?php echo $model->quiz_employee_title; ?>
            </div>

            <div class="form-group">
                <?php echo $form->labelEx($model,'quiz_exams_count_show',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-2">
                    <?php echo $form->textField($model, 'quiz_exams_count',
                        array('size'=>50,'maxlength'=>100,'id'=>'showRate','readonly'=>($model->scenario=='view'),'disabled'=>true)
                    ); ?>
                </div>
                <?php echo $form->labelEx($model,'now_time',array('class'=>"col-sm-1 control-label")); ?>
                <div class="col-sm-2">
                    <?php echo $form->textField($model, 'quiz_date',
                        array('size'=>50,'maxlength'=>100,'id'=>'showRate','readonly'=>($model->scenario=='view'),'disabled'=>true)
                    ); ?>
                </div>
                <?php echo $form->labelEx($model,'quiz_employee_name',array('class'=>"col-sm-1 control-label")); ?>
                <div class="col-sm-2">
                    <?php echo $form->textField($model, 'employee_info',
                        array('size'=>50,'maxlength'=>100,'id'=>'showRate','readonly'=>($model->scenario=='view'),'disabled'=>true)
                    ); ?>
                </div>
            </div>
            <?php
           $dataGet= Quiz::checkRadioValueGet($model->quiz_id,$model->employee_id); //测试题结果
           for($i=0;$i<count($dataGet);$i++){
               $test_exams_id=$dataGet[$i]['id'];  //题目id
               $answerArr=array();
               $answerStr=$dataGet[$i]['test_exams_answer_right']."-".$dataGet[$i]['test_exams_answer_faultf']."-".$dataGet[$i]['test_exams_answer_faults']."-".$dataGet[$i]['test_exams_answer_faultt'];
               $answerArr=explode('-',$answerStr); //正确答案一定是在第一个
              $finalResultTestExams=array();
             for($j=0;$j<count($answerArr);$j++){
                 $finalResultTestExams[$j]['right']='';
                 $finalResultTestExams[$j]['answer']='';
                 switch($j)
                 {
                     case 0:
                         $finalResultTestExams[$j]['right']='test_exams_answer_right';
                         $finalResultTestExams[$j]['answer']=$answerArr[$j];
                         break;
                     case 1:
                         $finalResultTestExams[$j]['right']='test_exams_answer_faultf';
                         $finalResultTestExams[$j]['answer']=$answerArr[$j];
                         break;
                     case 2:
                         $finalResultTestExams[$j]['right']='test_exams_answer_faults';
                         $finalResultTestExams[$j]['answer']=$answerArr[$j];
                         break;
                     case 3:
                         $finalResultTestExams[$j]['right']='test_exams_answer_faultt';
                         $finalResultTestExams[$j]['answer']=$answerArr[$j];
                         break;
                 }
             }
               shuffle($finalResultTestExams); //随机四个选项
               $oneArray=$finalResultTestExams[0];
               $twoArray=$finalResultTestExams[1];
               $threeArray=$finalResultTestExams[2];
               $fourArray=$finalResultTestExams[3];
                    echo "<div class='form-group'>".
                            "<div class='col-sm-9'>"."第".($i+1)."题:&nbsp;&nbsp;".$dataGet[$i]['test_exams_contents']."(  )"."</div>"
                          ."</div>" .
                        "<div class='form-group'>".
                                "<div class='col-sm-2'></div>".
                                "<div class='col-sm-4'>".
                                   "<input type='radio' name='contents[$test_exams_id]' id='$test_exams_id.test_exams_answer_right' value='$oneArray[right]'/>".
                                   "<label for='$test_exams_id.test_exams_answer_right'>". $oneArray['answer']."</label>".
                                "</div>".
                                "<div class='col-sm-4'>".
                                    "<input type='radio' name='contents[$test_exams_id]' id='$test_exams_id.test_exams_answer_faultf' value='$twoArray[right]'/>".
                                    "<label for='$test_exams_id.test_exams_answer_faultf'>".$twoArray['answer']."</label>".
                                "</div>".
                        "</div>".
                        "<div class='form-group'>".
                                "<div class='col-sm-2'></div>".
                             "<div class='col-sm-4'>".
                                    "<input type='radio' name='contents[$test_exams_id]' id='$test_exams_id.test_exams_answer_faults' value='$threeArray[right]'/>".
                                    "<label for='$test_exams_id.test_exams_answer_faults'>".  $threeArray['answer']."</label>".
                             "</div>".
                            "<div class='col-sm-4'>".
                                    "<input type='radio' name='contents[$test_exams_id]' id='$test_exams_id.test_exams_answer_faultt' value='$fourArray[right]'/>".
                                    "<label for='$test_exams_id.test_exams_answer_faultt'>".  $fourArray['answer']."</label>"
                            ."</div>"
                        ."</div>";
            }
            $this->widget('ext.layout.QuizStart');
            ?>
        </div>
    </div>
</section>

<?php $this->renderPartial('//site/removedialog'); ?>
<?php
$js = "
$('#QuizForm_quiz_start_dt').on('change',function() {
	showRenewDate();
});
function showRenewDate() {
	var sdate = $('#StaffForm_ctrt_start_dt').val();
	var period = $('#StaffForm_ctrt_period').val();
	if (IsDate(sdate) && IsNumeric(period)) {
		var d = new Date(sdate);
		d.setMonth(d.getMonth() + Number(period));
		$('#StaffForm_ctrt_renew_dt').val(formatDate(d));
	}
	if (period=='') $('#StaffForm_ctrt_renew_dt').val('');
}

function formatDate(val) {
	var day = '00'+val.getDate();
	var month = '00'+(val.getMonth()+1);
	var year = val.getFullYear();
	return year + '/' + month.slice(-2) + '/' +day.slice(-2);
}

function IsDate(val) {
	var d = new Date(val);
	return (!isNaN(d.valueOf()));
}

function IsNumeric(n) {
  return !isNaN(parseFloat(n)) && isFinite(n);
}
";
$js = Script::genDeleteData(Yii::app()->createUrl('teststart/delete'));
Yii::app()->clientScript->registerScript('deleteRecord',$js,CClientScript::POS_READY);
$js = Script::genReadonlyField();
Yii::app()->clientScript->registerScript('readonlyClass',$js,CClientScript::POS_READY);
if ($model->scenario!='view') {
    $js = Script::genDatePicker(array(
        'QuizForm_quiz_start_dt',
    ));
    Yii::app()->clientScript->registerScript('datePick',$js,CClientScript::POS_READY);
}
$js = Script::genReadonlyField();
Yii::app()->clientScript->registerScript('readonlyClass',$js,CClientScript::POS_READY);
?>
<?php $this->endWidget(); ?>

