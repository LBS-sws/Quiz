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
        <strong><?php echo Yii::t('quiz','quiz DataOrder'); ?></strong>
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
                        'submit'=>Yii::app()->createUrl('quiz/new')));
                }
                ?>
                <?php echo TbHtml::button('<span class="fa fa-reply"></span> '.Yii::t('misc','Back'), array(
                    'submit'=>Yii::app()->createUrl('quiz/index')));
                ?>
                <?php if ($model->scenario!='view'): ?>
                    <?php echo TbHtml::button('<span class="fa fa-upload"></span> '.Yii::t('misc','Save'), array(
                        'submit'=>Yii::app()->createUrl('quiz/save')));
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
                <?php echo $form->labelEx($model,'quiz_end_dt',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-3">
                    <div class="input-group date">
                        <div class="input-group-addon">
                            <i class="fa fa-calendar"></i>
                        </div>
                        <?php echo $form->textField($model, 'quiz_end_dt',
                            array('class'=>'form-control pull-right','readonly'=>($model->scenario=='view'),));
                        ?>
                    </div>
                </div>
            </div>

<!--
            <div class="form-group">

                <?php /*echo $form->labelEx($model,'quiz_employee_id',array('class'=>"col-sm-2 control-label")); */?>
                <div class="col-sm-5">
                    <?php /*echo $form->textField($model, 'quiz_employee_id',
                        array('size'=>50,'maxlength'=>100,'readonly'=>($model->scenario=='view'))
                    ); */?>
                </div>
            </div>-->



            <div class="form-group">
             <!--   --><?php /*echo $form->labelEx($model,'quiz_correct_rate',array('class'=>"col-sm-2 control-label")); */?>
                <div class="col-sm-5">
                    <?php echo $form->hiddenField($model, 'quiz_correct_rate',
                        array('size'=>50,'maxlength'=>100,'id'=>'showRate','readonly'=>($model->scenario=='view'))
                    ); ?>
                </div>
            </div>

            <script src="<?php echo Yii::app()->baseUrl;?>/js/jquery.js'"></script>
    <div class="form-group">
            <?php echo $form->labelEx($model,'quiz_exams_count_set',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-5">
            <?php echo TbHtml::dropDownList($model->count_questions,'',Quiz::listReturn(),
                array('disabled'=>!Yii::app()->user->validRWFunction('HK01'),'id'=>'select_questions_count')
            ); ?>
                </div>
    </div>
            <div class="form-group">
                <?php echo $form->labelEx($model,'quiz_exams_count',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-5">
                    <?php echo $form->textField($model, 'quiz_exams_count',
                        array('size'=>50,'maxlength'=>100,'readonly'=>($model->scenario=='view'),'disabled'=>'disabled','id'=>'getCountValue2')
                    );?>
                </div>
            </div>
            <?PHP /*$this->urlAjaxSelect=Yii::app()->createUrl('quiz/AjaxUrl');*/?>
            <input type="hidden" id="urlGet" name="urlGet" value="<?php echo $this->urlAjaxSelect;?>"/>
            <?php echo $form->hiddenField($model, 'id'); ?>

            <script>
                $("#select_questions_count").change(function(){
                  var selectValue= $("#select_questions_count").find("option:selected").text();
                    var reg=/^[0-9]*$/;
                    if (!reg.test(selectValue)){
                        $("#getCountValue2").val("");
                        alert("请选择一个适合本次测验的数字");
                    }
                else{
                    $("#getCountValue").val(selectValue);
                    $("#getCountValue2").val(selectValue);
                }
                    //console.log(selectValue);
                    var url = $("#urlGet").val();
                    var username='1';
                    var password='2';
                    $.ajax({
                        type: "post",  //数据提交方式（post/get）
                        url: url,  //提交到的url
                        data: {username:username,password:password,selectCount:selectValue},//提交的数据
                        dataType: "text",//返回的数据类型格式
                        success: function(msg){
                            console.log(msg);
                        },
                        error:function(msg){
                            console.log(msg);
                        }
                    });
                });
            </script>

          <?php echo $form->hiddenField($model, 'quiz_exams_count',array('id'=>'getCountValue')); ?>
            <div class="form-group">
                <?php /*echo $form->labelEx($model,'city_privileges',array('class'=>"col-sm-2 control-label")); */?>
                <div class="col-sm-5">
                    <?php echo $form->hiddenField($model, 'city_privileges',
                        array('size'=>50,'maxlength'=>100,'readonly'=>($model->scenario=='view'))
                    ); ?>
                </div>
            </div>

            <style type="text/css">
                label .labelForRadio{display:inline-block;width:auto;float:none;}
                .checkbox{display:inline-block;float:none; width:100px;}
            </style>

         <div class="form-group">
                <?php echo $form->labelEx($model,'quiz_exams_id',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-5">
                    <?php echo TbHtml::dropDownList('quiz_exams_id',$model->quiz_exams_id,Quiz::kindsReturn(),
                        array('disabled'=>!Yii::app()->user->validRWFunction('HK01'),'id'=>'kindsGet')
                    ); ?>
                </div>
             <div class="col-sm-5">
                 <?php echo $form->hiddenField($model,'quiz_exams_id',
                     array('size'=>50,'maxlength'=>100,'readonly'=>($model->scenario=='view'))
                 ); ?>
             </div>
            </div>

            <div class="form-group">
                <?php echo $form->labelEx($model,'quiz_employee_id',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-5">
                   <?php echo TbHtml::checkBoxList('quiz_employee_id',Quiz::EmployeeIdGet($model->id),Quiz::SelectReturn($model->id),
                       array('labelOptions'=>array('class'=>'labelForRadio',"checked"=>"checked")),''
                   ); ?>
                </div>
            </div>

        </div>
    </div>
</section>

<?php $this->renderPartial('//site/removedialog'); ?>



<?php
$js = "
$('#QuizForm_quiz_start_dt,#QuizForm_quiz_end_dt').on('change',function() {
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

$js = Script::genDeleteData(Yii::app()->createUrl('quiz/delete'));
Yii::app()->clientScript->registerScript('deleteRecord',$js,CClientScript::POS_READY);

$js = Script::genReadonlyField();
Yii::app()->clientScript->registerScript('readonlyClass',$js,CClientScript::POS_READY);

if ($model->scenario!='view') {
    $js = Script::genDatePicker(array(
        'QuizForm_quiz_start_dt',
        'QuizForm_quiz_end_dt',
    ));
    Yii::app()->clientScript->registerScript('datePick',$js,CClientScript::POS_READY);
}

$js = Script::genReadonlyField();
Yii::app()->clientScript->registerScript('readonlyClass',$js,CClientScript::POS_READY);
?>

<?php $this->endWidget(); ?>
