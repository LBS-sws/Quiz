<tr>
	<td>
		<?php echo TbHtml::textField($this->getFieldName('test_exams_contents'), $this->record['qty'],
			array('readonly'=>!Yii::app()->user->validRWFunction('HK01'),
				'size'=>'10', 'maxlength'=>'10',)
		); ?>
	</td>
	<td>
		<?php echo TbHtml::textField($this->getFieldName('test_exams_answer_right'), $this->record['qty'],
			array('readonly'=>!Yii::app()->user->validRWFunction('HK01'),
				'size'=>'10', 'maxlength'=>'10',)
		); ?>
	</td>
	<td>
		<?php echo TbHtml::textField($this->getFieldName('test_exams_answer_faultf'), $this->record['qty'],
			array('readonly'=>!Yii::app()->user->validRWFunction('HK01'),
				'size'=>'10', 'maxlength'=>'10',)
		); ?>
	</td>

	<td>
		<?php echo TbHtml::textField($this->getFieldName('test_exams_answer_faults'), $this->record['qty'],
			array('readonly'=>!Yii::app()->user->validRWFunction('HK01'),
				'size'=>'10', 'maxlength'=>'10',)
		); ?>
	</td>

	<td>
		<?php echo TbHtml::textField($this->getFieldName('test_exams_answer_faultt'), $this->record['qty'],
			array('readonly'=>!Yii::app()->user->validRWFunction('HK01'),
				'size'=>'10', 'maxlength'=>'10',)
		); ?>
	</td>


	<td>
		<?php echo TbHtml::dropDownList($this->getFieldName('finish'), $this->record['finish'], array('N'=>Yii::t('quiz','long'),'Y'=>Yii::t('quiz','temper')),
							array('disabled'=>!Yii::app()->user->validRWFunction('HK01'))
		); ?>
	</td>




	<td>
		<?php echo Yii::app()->user->validRWFunction('HK01') ? TbHtml::Button('-',array('id'=>'btnDelRow','title'=>Yii::t('misc','Delete'),'size'=>TbHtml::BUTTON_SIZE_SMALL)) : '&nbsp;'; ?>
		<?php echo CHtml::hiddenField($this->getFieldName('uflag'),$this->record['uflag']); ?>
		<?php echo CHtml::hiddenField($this->getFieldName('logid'),$this->record['logid']); ?>
		<?php echo CHtml::hiddenField($this->getFieldName('id'),$this->record['id']); ?>
	</td>
</tr>
