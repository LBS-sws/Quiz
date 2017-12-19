<?php
$this->pageTitle=Yii::app()->name . ' - Product Delivery Form';
?>

<?php $form=$this->beginWidget('TbActiveForm', array(
'id'=>'logistic-form',
'enableClientValidation'=>true,
'clientOptions'=>array('validateOnSubmit'=>true,),
'layout'=>TbHtml::FORM_LAYOUT_HORIZONTAL,
)); ?>

<section class="content-header">
	<h1>
		<strong><?php echo Yii::t('logistic','Product Delivery Form'); ?></strong>
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
					'submit'=>Yii::app()->createUrl('logistic/new')));
			}
		?>
		<?php echo TbHtml::button('<span class="fa fa-reply"></span> '.Yii::t('misc','Back'), array(
				'submit'=>Yii::app()->createUrl('logistic/index'))); 
		?>
<?php if ($model->scenario!='view'): ?>
			<?php echo TbHtml::button('<span class="fa fa-upload"></span> '.Yii::t('misc','Save'), array(
				'submit'=>Yii::app()->createUrl('logistic/save'))); 
			?>
<?php endif ?>
<?php if ($model->scenario=='edit'): ?>
	<?php echo TbHtml::button('<span class="fa fa-remove"></span> '.Yii::t('misc','Delete'), array(
			'name'=>'btnDelete','id'=>'btnDelete','data-toggle'=>'modal','data-target'=>'#removedialog',)
		);
	?>
<?php endif ?>
	</div>
	</div></div>

	<div class="box box-info">
		<div class="box-body">
			<?php echo $form->hiddenField($model, 'scenario'); ?>
			<?php echo $form->hiddenField($model, 'id'); ?>
			<?php echo $form->hiddenField($model, 'location'); ?>
			<?php echo CHtml::hiddenField('dtltemplate'); ?>

			<div class="form-group">
				<?php echo $form->labelEx($model,'log_dt',array('class'=>"col-sm-2 control-label")); ?>
				<div class="col-sm-3">
					<div class="input-group date">
						<div class="input-group-addon">
							<i class="fa fa-calendar"></i>
						</div>
						<?php echo $form->textField($model, 'log_dt', 
							array('class'=>'form-control pull-right','readonly'=>($model->scenario=='view'),)); 
						?>
					</div>
				</div>
				<?php echo $form->labelEx($model,'seq',array('class'=>"col-sm-2 control-label")); ?>
				<div class="col-sm-2">
					<?php echo $form->hiddenField($model, 'seq'); ?>
					<?php echo $form->textField($model, 'seq', 
						array('size'=>5,'maxlength'=>5,'readonly'=>($model->scenario=='view'||$model->scenario=='new'))
					); ?>
				</div>
			</div>

			<div class="form-group">
				<?php echo $form->labelEx($model,'company_name',array('class'=>"col-sm-2 control-label")); ?>
				<div class="col-sm-7">
					<?php echo $form->hiddenField($model, 'company_id'); ?>
					<?php echo $form->textField($model, 'company_name', 
						array('size'=>50,'maxlength'=>100,'readonly'=>($model->scenario=='view'),
						'append'=>TbHtml::Button('<span class="fa fa-search"></span> '.Yii::t('logistic','Customer'),array('name'=>'btnCompany','id'=>'btnCompany','disabled'=>($model->scenario=='view')))
					)); ?>
				</div>
			</div>

			<div class="form-group">
				<?php echo $form->labelEx($model,'address',array('class'=>"col-sm-2 control-label")); ?>
				<div class="col-sm-7">
					<?php echo $form->textField($model, 'address', 
						array('size'=>50,'maxlength'=>1000,'readonly'=>($model->scenario=='view'))
					); ?>
				</div>
			</div>

			<div class="form-group">
				<?php echo $form->labelEx($model,'follow_staff',array('class'=>"col-sm-2 control-label")); ?>
				<div class="col-sm-7">
					<?php echo $form->textField($model, 'follow_staff', 
						array('size'=>80,'maxlength'=>1000,'readonly'=>($model->scenario=='view'),
						'append'=>TbHtml::Button(Yii::t('logistic','Resp. Staff'),array('name'=>'btnStaff','id'=>'btnStaff','disabled'=>($model->scenario=='view')))
					)); ?>
				</div>
			</div>

			<div class="form-group">
				<?php echo $form->labelEx($model,'pay_method',array('class'=>"col-sm-2 control-label")); ?>
				<div class="col-sm-3">
					<?php echo $form->dropDownList($model, 'pay_method', 
								array(
									'MONTHLY'=>Yii::t('logistic','Monthly'),
									'QUARTERLY'=>Yii::t('logistic','Quarterly'),
									'COD'=>Yii::t('logistic','COD'),
									'CBD'=>Yii::t('logistic','CBD'),
									'FREE'=>Yii::t('logistic','Free'),
								),
								array('disabled'=>($model->scenario=='view'))
					); ?>
				</div>
			</div>

			<div class="form-group">
				<?php echo $form->labelEx($model,'location',array('class'=>"col-sm-2 control-label")); ?>
				<div class="col-sm-3">
					<?php echo $form->dropDownList($model, 'location', General::getLocationList(),
								array('disabled'=>($model->scenario=='view'))
					); ?>
				</div>
				<div class="col-sm-4">
					<?php echo $form->textField($model, 'location_dtl', 
						array('size'=>30,'maxlength'=>200,'readonly'=>($model->scenario=='view'))
					); ?>
				</div>
			</div>

			<div class="form-group">
				<?php echo $form->labelEx($model,'finish',array('class'=>"col-sm-2 control-label")); ?>
				<div class="col-sm-2">
					<?php echo $form->dropDownList($model, 'finish', array('N'=>Yii::t('misc','No'),'Y'=>Yii::t('misc','Yes')),
								array('disabled'=>($model->scenario=='view'))
					); ?>
				</div>
				<?php echo $form->labelEx($model,'deadline',array('class'=>"col-sm-2 control-label")); ?>
				<div class="col-sm-3">
					<div class="input-group date">
						<div class="input-group-addon">
							<i class="fa fa-calendar"></i>
						</div>
						<?php echo $form->textField($model, 'deadline', 
							array('class'=>'form-control pull-right','readonly'=>($model->scenario=='view'),)); 
						?>
					</div>
				</div>
			</div>

			<div class="form-group">
				<?php echo $form->labelEx($model,'repair',array('class'=>"col-sm-2 control-label")); ?>
				<div class="col-sm-7">
					<?php echo $form->textField($model, 'repair', 
						array('size'=>50,'maxlength'=>1000,'readonly'=>($model->scenario=='view'))
					); ?>
				</div>
			</div>

			<div class="form-group">
				<?php echo $form->labelEx($model,'reason',array('class'=>"col-sm-2 control-label")); ?>
				<div class="col-sm-7">
					<?php echo $form->textField($model, 'reason', 
						array('size'=>50,'maxlength'=>1000,'readonly'=>($model->scenario=='view'))
					); ?>
				</div>
			</div>

			<div class="form-group">
				<?php echo $form->labelEx($model,'remarks',array('class'=>"col-sm-2 control-label")); ?>
				<div class="col-sm-7">
					<?php echo $form->textField($model, 'remarks', 
						array('size'=>50,'maxlength'=>1000,'readonly'=>($model->scenario=='view'))
					); ?>
				</div>
			</div>
<div class="box">
<div class="box-body table-responsive">
			<legend><?php echo Yii::t('logistic','Task'); ?></legend>
			<?php $this->widget('ext.layout.TableView2Widget', array(
					'model'=>$model,
					'attribute'=>'detail',
					'viewhdr'=>'//logistic/_formhdr',
					'viewdtl'=>'//logistic/_formdtl',
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

$js = Script::genLookupButtonEx('btnCompany', 'company', 'company_id', 'company_name', array('address'=>'LogisticForm_address'));
Yii::app()->clientScript->registerScript('lookupCompany',$js,CClientScript::POS_READY);

$js = Script::genLookupButtonEx('btnStaff', 'staff', '', 'follow_staff', array(), true);
Yii::app()->clientScript->registerScript('lookupStaff',$js,CClientScript::POS_READY);

$js = Script::genLookupSelect();
Yii::app()->clientScript->registerScript('lookupSelect',$js,CClientScript::POS_READY);

$js = "
$('table').on('change','[id^=\"LogisticForm\"]',function() {
	var n=$(this).attr('id').split('_');
	$('#LogisticForm_'+n[1]+'_'+n[2]+'_uflag').val('Y');
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

$js = Script::genDeleteData(Yii::app()->createUrl('logistic/delete'));
Yii::app()->clientScript->registerScript('deleteRecord',$js,CClientScript::POS_READY);

$js = Script::genReadonlyField();
Yii::app()->clientScript->registerScript('readonlyClass',$js,CClientScript::POS_READY);
?>

<?php $this->endWidget(); ?>

</div><!-- form -->

