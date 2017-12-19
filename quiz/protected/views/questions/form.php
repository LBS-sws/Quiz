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
        <strong><?php echo Yii::t('quiz','Questions DataOrder'); ?></strong>
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
                        'submit'=>Yii::app()->createUrl('Questions/new')));
                }
                ?>
                <?php echo TbHtml::button('<span class="fa fa-reply"></span> '.Yii::t('misc','Back'), array(
                    'submit'=>Yii::app()->createUrl('Questions/index')));
                ?>
                <?php if ($model->scenario!='view'): ?>
                    <?php echo TbHtml::button('<span class="fa fa-upload"></span> '.Yii::t('misc','Save'), array(
                        'submit'=>Yii::app()->createUrl('Questions/save')));
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
            <?php echo CHtml::hiddenField('dtltemplate'); ?>

            <div class="form-group">
                <?php echo $form->labelEx($model,'test_exams_contents',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-5">
                    <?php echo $form->textField($model, 'test_exams_contents',
                        array('size'=>50,'maxlength'=>100,'readonly'=>($model->scenario=='view'))
                    ); ?>
                </div>
            </div>

            <div class="form-group">
                <?php echo $form->labelEx($model,'test_exams_answer_right',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-2">
                    <?php echo $form->textField($model, 'test_exams_answer_right',
                        array('size'=>10,'maxlength'=>10,'readonly'=>($model->scenario=='view'))
                    ); ?>
                </div>
            </div>

            <div class="form-group">
                <?php echo $form->labelEx($model,'test_exams_answer_faultf',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-5">
                    <?php echo $form->textField($model, 'test_exams_answer_faultf',
                        array('size'=>50,'maxlength'=>100,'readonly'=>($model->scenario=='view'))
                    ); ?>
                </div>
            </div>

            <div class="form-group">
                <?php echo $form->labelEx($model,'test_exams_answer_faults',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-5">
                    <?php echo $form->textField($model, 'test_exams_answer_faults',
                        array('size'=>50,'maxlength'=>100,'readonly'=>($model->scenario=='view'))
                    ); ?>
                </div>
            </div>

            <div class="form-group">
                <?php echo $form->labelEx($model,'test_exams_answer_faultt',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-5">
                    <?php echo $form->textField($model, 'test_exams_answer_faultt',
                        array('size'=>50,'maxlength'=>100,'readonly'=>($model->scenario=='view'))
                    ); ?>
                </div>
            </div>

            <div class="form-group">
                <?php echo $form->labelEx($model,'city_privileges',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-5">
                    <?php echo $form->textField($model, 'city_privileges',
                        array('size'=>50,'maxlength'=>100,'readonly'=>($model->scenario=='view'))
                    ); ?>
                </div>
            </div>

            <div class="form-group">
                <?php echo $form->labelEx($model,'test_exams_kinds',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-5">
                    <?php echo $form->textField($model, 'test_exams_kinds',
                        array('size'=>50,'maxlength'=>100,'readonly'=>($model->scenario=='view'))
                    ); ?>
                </div>
            </div>



            <div class="form-group">
                <?php echo $form->labelEx($model,'selectValueExams',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-3">

                    <?php

                    foreach($model->arrData as $varray){
                        if($varray['test_exams_kinds']=='1'){
                        echo $form->dropDownList($model, 'arrData',
                        array(
                            'kinds'=>Yii::t('quiz','kinds'),
                            'temper'=>Yii::t('quiz','temper'),
                            'long'=>Yii::t('quiz','long'),

                        ),
                        array('disabled'=>($model->scenario=='view')));
                        }
                        elseif($varray['test_exams_kinds']=='2'){
                            echo $form->dropDownList($model, 'arrData',
                                array(
                                    'kinds'=>Yii::t('quiz','kinds'),
                                    'temper'=>Yii::t('quiz','temper'),
                                    'long'=>Yii::t('quiz','long'),
                                ),
                                array('disabled'=>($model->scenario=='view')));
                        }
                        else{
                            echo $form->dropDownList($model, 'arrData',
                                array(
                                    'kinds'=>Yii::t('quiz','kinds'),
                                    'temper'=>Yii::t('quiz','temper'),
                                    'long'=>Yii::t('quiz','long'),
                                ),
                                array('disabled'=>($model->scenario=='view')));
                        }
                    }
                    ?>

                </div>
            </div>


            <div class="box">
            <div class="box-body table-responsive">
                <legend><?php echo Yii::t('logistic','Task'); ?></legend>
                <?php $this->widget('ext.layout.TableView2Widget', array(
                    'model'=>$model,
                    'attribute'=>'detail',
                    'viewhdr'=>'//questions/_formhdr',
                    'viewdtl'=>'//questions/_formdtl',
                    'gridsize'=>'24',
                    'height'=>'200',
                ));
                ?>
            </div>
                </div>


        </div>
    </div>
</section>

<?php $this->renderPartial('//site/removedialog'); ?>

<?php
$js = Script::genDeleteData(Yii::app()->createUrl('Questions/delete'));
Yii::app()->clientScript->registerScript('deleteRecord',$js,CClientScript::POS_READY);

$js = Script::genReadonlyField();
Yii::app()->clientScript->registerScript('readonlyClass',$js,CClientScript::POS_READY);

if ($model->scenario!='view') {
$js = "
$('table').on('click','#btnDelRow', function() {
	$(this).closest('tr').find('[id*=\"_uflag\"]').val('D');
	$(this).closest('tr').hide();
});
	";
Yii::app()->clientScript->registerScript('removeRow',$js,CClientScript::POS_READY);

$js = "
$(document).ready(function(){
	var ct = $('#tblDetail tr').eq(1).html();
	$('#dtltemplate').attr('value',ct);
	$('.deadline').datepicker({autoclose: true, format: 'yyyy/mm/dd'});
});

$('#btnAddRow').on('click',function() {
	var r = $('#tblDetail tr').length;
	if (r>0) {
		var nid = '';
		var ct = $('#dtltemplate').val();
		$('#tblDetail tbody:last').append('<tr>'+ct+'</tr>');
		$('#tblDetail tr').eq(-1).find('[id*=\"LogisticForm_\"]').each(function(index) {
			var id = $(this).attr('id');
			var name = $(this).attr('name');

			var oi = 0;
			var ni = r;
			id = id.replace('_'+oi.toString()+'_', '_'+ni.toString()+'_');
			$(this).attr('id',id);
			name = name.replace('['+oi.toString()+']', '['+ni.toString()+']');
			$(this).attr('name',name);
			if (id.indexOf('_id') != -1) $(this).attr('value','0');
			if (id.indexOf('_logid') != -1) $(this).attr('value','0');
			if (id.indexOf('_task') != -1) {
				$(this).attr('value','0');
				nid = id;
			}
			if (id.indexOf('_qty') != -1) $(this).attr('value','');
			if (id.indexOf('_finish') != -1) $(this).attr('value','N');
			if (id.indexOf('_deadline') != -1) {
				$(this).attr('value','');
				$(this).datepicker({autoclose: true, format: 'yyyy/mm/dd'});
			}
		});
		if (nid != '') {
			var topos = $('#'+nid).position().top;
			$('#tbl_detail').scrollTop(topos);
		}
	}
});
	";
    Yii::app()->clientScript->registerScript('addRow',$js,CClientScript::POS_READY);

    $js = Script::genDatePicker(array(
        'LogisticForm_log_dt',
        'LogisticForm_deadline',
    ));
    Yii::app()->clientScript->registerScript('datePick',$js,CClientScript::POS_READY);
}

?>

<?php $this->endWidget(); ?>
