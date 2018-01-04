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
                    <?php echo TbHtml::button('<span class="fa fa-upload"></span> '.Yii::t('misc','Start quiz'), array(
                        'submit'=>Yii::app()->createUrl('teststart/save')));
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
            <?PHP $this->urlAjaxSubmit=Yii::app()->createUrl('teststart/AjaxUrl');?>
           <input type="hidden" id="urlGet" name="urlGet" value="<?php echo $this->urlAjaxSubmit;?>"/>
            <?php $this->selectData=Yii::app()->createUrl('teststart/SelectQuestions');?>
        <input type="hidden" id="urlGetSelect" name="urlGetSelect" value="<?php echo $this->selectData;?>"/>

            <!--<input type="text" name="k"  id="searchInput"/>&nbsp;<input type="button" name="startQuiz" value="开始测试" />
            <input type="text" id="getValueSearch" value=""/>
            <div id="showData"></div>
            <div class="form-group">
                <?php /*echo $form->labelEx($model,'employee_info',array('class'=>"col-sm-2 control-label")); */?>
                <div class="col-sm-5">
                    <?php /*echo $form->textField($model, 'employee_info',
                        array('size'=>50,'maxlength'=>100,'readonly'=>($model->scenario=='view'),'id'=>'checkInfoName',)
                    ); */?>
                </div>
            </div>-->

            <div class="form-group">
                <?php echo $form->labelEx($model,'quiz_choose_id',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-5">
                    <?php echo $form->dropDownList($model,'quiz_choose_id',Quiz::QuestionsSelect(),
                        array('disabled'=>!Yii::app()->user->validRWFunction('HK05'),'id'=>'select_questions_count'));?>
                </div>
            </div>

            <div class="form-group">
                <?php echo $form->labelEx($model,'quiz_employee_choose_id',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-5">
                    <?php echo $form->dropDownList($model,'quiz_choose_id',Quiz::selectEmployee(),
                        array('disabled'=>!Yii::app()->user->validRWFunction('HK05'),'id'=>'selectResult'));?>
                </div>
            </div>

           <!--  时间自动获取 <div class="form-group">
                <?php /*echo $form->labelEx($model,'quiz_employee_date',array('class'=>"col-sm-2 control-label")); */?>
                <div class="col-sm-5">
                    <?php
/*                    $this->quiz_employee_date=date("Y-m-d H:i:s",time());
                    echo $form->textField($model,'quiz_employee_date',$this->quiz_employee_date,
                        array('disabled'=>!Yii::app()->user->validRWFunction('HK01')));*/?>
                </div>
            </div>-->

            <?php echo $form->hiddenField($model, 'quiz_id',array('id'=>'QuizIdGet','placeHolder'=>'测验单id')); ?>
            <?php echo $form->hiddenField($model, 'employee_id',array('id'=>'EmployeeIdGet','placeholder'=>'员工id')); ?>
        </div>
        </div>
</section>

<script type="text/javascript">
    $("#selectResult").change(function(){
        var SelectEmployeeValue=$("#selectResult").val();
        if(SelectEmployeeValue==0){
            $("#EmployeeIdGet").val("");
        }
        else{
            $("#EmployeeIdGet").val(SelectEmployeeValue);
        }
    });
    $("#select_questions_count").change(function(){
        var SelectValue=$("#select_questions_count").val();
        if(SelectValue==0){
            $("#QuizIdGet").val("");
        }
  else{
            $("#QuizIdGet").val(SelectValue);
        }
        var urlGetSelect=$("#urlGetSelect").val();
        $.ajax({
            type: "post",
            url: urlGetSelect,
            data: "selectValueIn="+SelectValue,
            dataType: "json",
            async:true,
            success: function(data){
                console.log(data);
                var item;
                $("#selectResult").html('');
                $.each(data,function(i,result){
                    item +='<option value="'+result['id']+'">'+result['employee_info_name']+'</option>';
                });
                $("#selectResult").html(item);
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

