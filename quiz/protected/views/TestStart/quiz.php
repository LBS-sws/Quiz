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
        <strong><?php echo Yii::t('quiz','Quiz questions order'); ?></strong>
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
    <div class="box"><div class="box-body">
            <div class="btn-group" role="group">
                <!-- --><?php
                /*                if ($model->scenario!='new' && $model->scenario!='view') {
                                    echo TbHtml::button('<span class="fa fa-file-o"></span> '.Yii::t('misc','Add Another'), array(
                                        'submit'=>Yii::app()->createUrl('TestStart/new')));
                                }
                                */?>
                <?php echo TbHtml::button('<span class="fa fa-reply"></span> '.Yii::t('misc','Back'), array(
                    'submit'=>Yii::app()->createUrl('TestStart/index')));
                ?>
                <?php if ($model->scenario!='view'): ?>
                    <?php echo TbHtml::button('<span class="fa fa-upload"></span> '.Yii::t('misc','Start Quiz'), array(
                        'submit'=>Yii::app()->createUrl('TestStart/save')));
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
            <!-- <script src="<?php /*echo Yii::app()->baseUrl;*/?>/js/jquery-1.3.2.min.js'"></script>-->
            <?PHP $this->urlAjaxSubmit=Yii::app()->createUrl('TestStart/AjaxUrl');?>
            <input type="hidden" id="urlGet" name="urlGet" value="<?php echo $this->urlAjaxSubmit;?>"/>
            <?php $this->selectData=Yii::app()->createUrl('TestStart/SelectQuestions');?>
            <div id="showData"></div>
            <div class="form-group">
                <?php echo $form->labelEx($model,'employee_info',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-5">
                    <?php echo $form->textField($model, 'employee_info',
                        array('size'=>50,'maxlength'=>100,'readonly'=>($model->scenario=='view'),'id'=>'checkInfoName')
                    ); ?>
                </div>
                <?php echo $model->employee_id."aaa";?>
            </div>

            <div class="form-group">
                <?php echo $form->labelEx($model,'quiz_choose_id',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-5">
                    <?php echo $form->dropDownList($model,'quiz_choose_id',Quiz::QuestionsSelect(),
                        array('disabled'=>!Yii::app()->user->validRWFunction('HK05'),'id'=>'select_questions_count'));?>
                </div>
            </div>


        </div>
    </div>
</section>
<script type="text/javascript">
    /*  $("#searchInput").keyup(function(){
     var url=$("#urlGet").val();
     var value = $("#searchInput").val();
     $.ajax({
     type: "post",
     url: url,
     data: {searchValue:value},
     dataType: "text",
     success: function(msg){
     console.log(value);
     $("#getValueSearch").val(msg);
     console.log(msg);
     },
     error:function(msg){
     console.log(msg);
     }
     });
     });*/

    $("#select_questions_count").change(function(){
        $("#QuizIdGet").val("27");
        $("#EmployeeIdGet").val("5");
        var urlGetSelect=$("#urlGetSelect").val();
        var SelectValue=$("#select_questions_count").val();
        console.log(SelectValue);
        $.ajax({
            type: "post",
            url: urlGetSelect,
            data: {selectValueIn:SelectValue},
            dataType: "json",
            async:true,
            success: function(data){
                console.log(data);
            },
            error:function(data){
                console.log(data);
            }
        });
    });

</script>
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
$js = Script::genDeleteData(Yii::app()->createUrl('TestStart/delete'));
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

