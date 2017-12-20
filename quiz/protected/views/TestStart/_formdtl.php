<tr>
	<td>
		<?php echo TbHtml::dropDownList($this->getFieldName('task'),  $this->record['task'], General::getTaskList(),
								array('disabled'=>!Yii::app()->user->validRWFunction('A05'))
		); ?>
	</td>
	<td>
		<?php echo TbHtml::textField($this->getFieldName('qty'), $this->record['qty'], 
			array('readonly'=>!Yii::app()->user->validRWFunction('A05'), 
				'size'=>'10', 'maxlength'=>'10',)
		); ?>
	</td>
	<td>
		<?php echo TbHtml::textField($this->getFieldName('deadline'), $this->record['deadline'], 
			array('readonly'=>!Yii::app()->user->validRWFunction('A05'), 
				'size'=>'10', 'maxlength'=>'10','class'=>'deadline',
				'prepend'=>'<i class="fa fa-calendar"></i>',
		)); ?>
	</td>
	<td>
		<?php echo TbHtml::dropDownList($this->getFieldName('finish'), $this->record['finish'], array('N'=>Yii::t('misc','No'),'Y'=>Yii::t('misc','Yes')),
							array('disabled'=>!Yii::app()->user->validRWFunction('A05'))
		); ?>
	</td>
	<td>
		<?php 
			echo Yii::app()->user->validRWFunction('A05') 
				? TbHtml::Button('-',array('id'=>'btnDelRow','title'=>Yii::t('misc','Delete'),'size'=>TbHtml::BUTTON_SIZE_SMALL))
				: '&nbsp;';
		?>
		<?php echo CHtml::hiddenField($this->getFieldName('uflag'),$this->record['uflag']); ?>
		<?php echo CHtml::hiddenField($this->getFieldName('logid'),$this->record['logid']); ?>
		<?php echo CHtml::hiddenField($this->getFieldName('id'),$this->record['id']); ?>
	</td>
</tr>
