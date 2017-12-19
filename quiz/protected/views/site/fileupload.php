<?php
	$ftrbtn = array();
	if ($model->scenario!='view') $ftrbtn[] = TbHtml::button(Yii::t('dialog','Upload'), array('id'=>'btnUploadFile',));
	$ftrbtn[] = TbHtml::button(Yii::t('dialog','Close'), array('id'=>'btnUploadClose','data-dismiss'=>'modal','color'=>TbHtml::BUTTON_COLOR_PRIMARY));
	$this->beginWidget('bootstrap.widgets.TbModal', array(
					'id'=>'fileuploaddialog',
					'header'=>Yii::t('dialog','File Attachment'),
					'footer'=>$ftrbtn,
					'show'=>false,
				));
?>
<div class="box" id="file-list" style="max-height: 300px; overflow-y: auto;">
	<table id="tblFile" class="table table-hover">
		<thead>
			<tr><th></th><th><?php echo Yii::t('dialog','File Name');?></th><th><?php echo Yii::t('dialog','Date');?></th></tr>
		</thead>
		<tbody>
<?php
	$d = new DocMan($model->docType,$model->id);
	echo $d->genTableFileList(($model->scenario=='view'));
?>
		</tbody>
	</table>
</div>
<?php
	$name = get_class($model).'_files';
//	echo TbHtml::button(Yii::t("dialog","Browse..."), 
//				array(
//					"name"=>"btnBrowse",
//					"id"=>"btnBrowse",
//					"onclick"=>"document.getElementById('$name').click();",
//				));
	echo $form->hiddenField($model, 'removeFileId');
?>				
<div id="inputFile">
<?php
if ($model->scenario!='view') {
	$this->widget('CMultiFileUpload', array(
		'name'=>'attachment',
		'model'=>$model,
		'attribute'=>'files',
		'accept'=>'jpg|gif|png|xlsx|xls|docx|doc|pdf|tif',
		'remove'=>Yii::t('dialog','Remove'),
		'file'=>' $file',
		'options'=>array(
			'list'=>'#T7-log',
//			'onFileSelect'=>'function(e, v, m){ alert("onFileSelect - "+v) }',
//			'afterFileSelect'=>'function(e, v, m){ $("ServiceFrom_files").attr("value","00"); }',
//        'onFileAppend'=>'function(e, v, m){ alert("onFileAppend - "+v) }',
//        'afterFileAppend'=>'function(e, v, m){ alert("afterFileAppend - "+v) }',
//        'onFileRemove'=>'function(e, v, m){ alert("onFileRemove - "+v) }',
//        'afterFileRemove'=>'function(e, v, m){ alert("afterFileRemove - "+v) }',
		),
//		'htmlOptions'=>array(
//			'style'=>'height:100%; position:absolute; top:0; right:10; z-index:99; ',
//		),
	));
}
?>
</div>
<div id="T7-log" style="max-height: 100px; overflow-y: auto;">
</div>

<?php
	$this->endWidget(); 
?>
