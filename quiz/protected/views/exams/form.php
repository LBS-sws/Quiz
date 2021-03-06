<?php
$this->pageTitle=Yii::app()->name . ' - Product Delivery Form';
?>
<?php echo CHtml::beginForm($this->createUrl('exams/Demo'),'post',array('enctype'=>'multipart/form-data')); ?>
<?php
echo CHtml::fileField('file','',array('class'=>'btn btn-default'));
?>
<?php echo CHtml::submitButton(Yii::t('quiz','Submit data file'),'','',array('class'=>'btn btn-default'));?>
<?php echo CHtml::endForm();?>
<?php $form=$this->beginWidget('TbActiveForm', array(
	'id'=>'exams-form',
	'enableClientValidation'=>true,
	'clientOptions'=>array('validateOnSubmit'=>true,),
	'layout'=>TbHtml::FORM_LAYOUT_HORIZONTAL,
)); ?>
<section class="content-header">
	<h1>
		<strong><?php echo Yii::t('quiz','Questions Add'); ?></strong>
	</h1>
	<!--
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Layout</a></li>
            <li class="active">Top Navigation
            </li>
        </ol>
    -->
</section>

<section class="content">
	<div class="box">
		<div class="box-body">
			<div class="btn-group" role="group">
				<div class="btn-group" role="group"></div>
				<?php
				if ($model->scenario!='new' && $model->scenario!='view') {
					echo TbHtml::button('<span class="fa fa-file-o"></span> '.Yii::t('misc','Add Another'), array(
						'submit'=>Yii::app()->createUrl('exams/new')));
				}
				?>
				<?php echo TbHtml::button('<span class="fa fa-reply"></span> '.Yii::t('misc','Back'), array(
					'submit'=>Yii::app()->createUrl('exams/index')));
				?>
				<?php if ($model->scenario!='view'): ?>
					<?php echo TbHtml::button('<span class="fa fa-upload"></span> '.Yii::t('misc','Save'), array(
						'submit'=>Yii::app()->createUrl('exams/save')));
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

			<div class="box">
				<div class="box-body table-responsive">
					<legend><?php echo Yii::t('quiz','Questions DataOrder'); ?></legend>
					<?php $this->widget('ext.layout.TableView2Widget', array(
						'model'=>$model,
						'attribute'=>'detail',
						'viewhdr'=>'//exams/_formhdr',
						'viewdtl'=>'//exams/_formdtl',
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
<?php $this->renderPartial('//site/lookup'); ?>

<?php
$js = Script::genLookupSearchEx();
Yii::app()->clientScript->registerScript('lookupSearch',$js,CClientScript::POS_READY);

$js = Script::genLookupButtonEx('btnCompany', 'company', 'company_id', 'company_name', array('address'=>'ExamsForm_address'));
Yii::app()->clientScript->registerScript('lookupCompany',$js,CClientScript::POS_READY);

$js = Script::genLookupButtonEx('btnStaff', 'staff', '', 'follow_staff', array(), true);
Yii::app()->clientScript->registerScript('lookupStaff',$js,CClientScript::POS_READY);

$js = Script::genLookupSelect();
Yii::app()->clientScript->registerScript('lookupSelect',$js,CClientScript::POS_READY);

$js = "
$('table').on('change','[id^=\"ExamsForm\"]',function() {
	var n=$(this).attr('id').split('_');
	$('#ExamsForm'+n[1]+'_'+n[2]+'_uflag').val('Y');
});
";
Yii::app()->clientScript->registerScript('setFlag',$js,CClientScript::POS_READY);

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

});

$('#btnAddRow').on('click',function() {
	var r = $('#tblDetail tr').length;
	if (r>0) {
		var nid = '';
		var ct = $('#dtltemplate').val();
		$('#tblDetail tbody:last').append('<tr>'+ct+'</tr>');
		$('#tblDetail tr').eq(-1).find('[id*=\"ExamsForm\"]').each(function(index) {
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
		'ExamsForm_log_dt',
		'ExamsForm_deadline',
	));
	Yii::app()->clientScript->registerScript('datePick',$js,CClientScript::POS_READY);
}


$js = Script::genReadonlyField();
Yii::app()->clientScript->registerScript('readonlyClass',$js,CClientScript::POS_READY);
?>

<?php $this->endWidget(); ?>

</div><!-- form -->

