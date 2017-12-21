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
        <strong><?php echo Yii::t('quiz','Quiz DataOrder'); ?></strong>
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
                <?php
                if ($model->scenario!='new' && $model->scenario!='view') {
                    echo TbHtml::button('<span class="fa fa-file-o"></span> '.Yii::t('misc','Add Another'), array(
                        'submit'=>Yii::app()->createUrl('Quiz/new')));
                }
                ?>
                <?php echo TbHtml::button('<span class="fa fa-reply"></span> '.Yii::t('misc','Back'), array(
                    'submit'=>Yii::app()->createUrl('Quiz/index')));
                ?>
                <?php if ($model->scenario!='view'): ?>
                    <?php echo TbHtml::button('<span class="fa fa-upload"></span> '.Yii::t('misc','Save'), array(
                        'submit'=>Yii::app()->createUrl('Quiz/save')));
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


            <div class="form-group">
                <?php echo $form->labelEx($model,'quiz_date',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-5">
                    <?php echo $form->textField($model, 'quiz_date',
                        array('size'=>50,'maxlength'=>100,'readonly'=>($model->scenario=='view'))
                    ); ?>
                </div>
            </div>

            <div class="form-group">
                <?php echo $form->labelEx($model,'quiz_name',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-2">
                    <?php echo $form->textField($model, 'quiz_name',
                        array('size'=>10,'maxlength'=>10,'id'=>'quiz_name','readonly'=>($model->scenario=='view'))
                    ); ?>
                </div>
            </div>

            <div class="form-group">
                <?php echo $form->labelEx($model,'quiz_start_dt',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-3">
                    <div class="input-group date">
                        <div class="input-group-addon">
                            <i class="fa fa-calendar"></i>
                        </div>
                        <?php echo $form->textField($model, 'quiz_start_dt',
                            array('class'=>'form-control pull-right','readonly'=>($model->scenario=='view'),));
                        ?>
                    </div>
                </div>
            </div>



            <div class="form-group">

                <?php echo $form->labelEx($model,'quiz_employee_id',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-5">
                    <?php echo $form->textField($model, 'quiz_employee_id',
                        array('size'=>50,'maxlength'=>100,'readonly'=>($model->scenario=='view'))
                    ); ?>
                </div>
            </div>

            <div class="form-group">
                <?php echo $form->labelEx($model,'quiz_exams_id',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-5">
                    <?php echo $form->textField($model, 'quiz_exams_id',
                        array('size'=>50,'maxlength'=>100,'readonly'=>($model->scenario=='view'))
                    ); ?>
                </div>
            </div>

            <div class="form-group">
                <?php echo $form->labelEx($model,'quiz_correct_rate',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-5">
                    <?php echo $form->textField($model, 'quiz_correct_rate',
                        array('size'=>50,'maxlength'=>100,'id'=>'showRate','readonly'=>($model->scenario=='view'))
                    ); ?>
                </div>
            </div>
            <script src="<?php echo Yii::app()->baseUrl;?>/js/jquery-1.3.2.min.js'"></script>
<!--            <?php /*echo Yii::app()->baseUrl;*/?>
            --><?php /*echo Quiz::Fiv();*/?>
            <?php echo $form->hiddenField($model, 'id'); ?>
            <script>
                $("#showRate").click(function(){
                    console.log("aaa");
                $("#quiz_name").val("demo");
                });
            </script>

            <div class="form-group">
                <?php echo $form->labelEx($model,'city_privileges',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-5">
                    <?php echo $form->textField($model, 'city_privileges',
                        array('size'=>50,'maxlength'=>100,'readonly'=>($model->scenario=='view'))
                    ); ?>
                </div>
            </div>

            <div class="form-group">
                <?php echo $form->labelEx($model,'count_import',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-5">
                       <select>
                           <option></option>
                       </select>
                </div>
            </div>

            <div class="form-group">
                <?php echo $form->labelEx($model,'quiz_exams_count',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-5">
                    <?php echo $form->textField($model, 'quiz_exams_count',
                        array('size'=>50,'maxlength'=>100,'readonly'=>($model->scenario=='view'),'disabled'=>'disabled')
                    ); ?>
                </div>
            </div>

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

$js = Script::genDeleteData(Yii::app()->createUrl('Quiz/delete'));
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
