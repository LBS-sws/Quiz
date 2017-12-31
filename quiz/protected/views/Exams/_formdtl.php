<tr>
	<td>
		<?php echo TbHtml::textArea($this->getFieldName('test_exams_contents'), $this->record['test_exams_contents'],
			array('readonly'=>!Yii::app()->user->validRWFunction('HK01'),
				'size'=>'10', 'maxlength'=>'50','cols'=>'30','rows'=>'6')
		); ?>
	</td>
	<td>
		<?php echo TbHtml::textArea($this->getFieldName('test_exams_answer_right'), $this->record['test_exams_answer_right'],
			array('readonly'=>!Yii::app()->user->validRWFunction('HK01'),
				'size'=>'10', 'maxlength'=>'20','cols'=>'30','rows'=>'6')
		); ?>
	</td>
	<td>
		<?php echo TbHtml::textArea($this->getFieldName('test_exams_answer_faultf'), $this->record['test_exams_answer_faultf'],
			array('readonly'=>!Yii::app()->user->validRWFunction('HK01'),
				'size'=>'10', 'maxlength'=>'20','cols'=>'30','rows'=>'6')
		); ?>
	</td>

	<td>
		<?php echo TbHtml::textArea($this->getFieldName('test_exams_answer_faults'), $this->record['test_exams_answer_faults'],
			array('readonly'=>!Yii::app()->user->validRWFunction('HK01'),
				'size'=>'10', 'maxlength'=>'20','cols'=>'30','rows'=>'6')
		); ?>
	</td>

	<td>
		<?php echo TbHtml::textArea($this->getFieldName('test_exams_answer_faultt'), $this->record['test_exams_answer_faultt'],
			array('readonly'=>!Yii::app()->user->validRWFunction('HK01'),
				'size'=>'10', 'maxlength'=>'20','cols'=>'30','rows'=>'6')
		); ?>
	</td>

<!--
	<td>
		<?php /*echo TbHtml::dropDownList($this->getFieldName('finish'), $this->record['finish'], array('N'=>Yii::t('quiz','long'),'Y'=>Yii::t('quiz','temper')),
							array('disabled'=>!Yii::app()->user->validRWFunction('HK01'))
		); */?>
	</td>-->




	<td>
		<?php echo Yii::app()->user->validRWFunction('HK01') ? TbHtml::Button('-',array('id'=>'btnDelRow','title'=>Yii::t('misc','Delete'),'size'=>TbHtml::BUTTON_SIZE_SMALL)) : '&nbsp;'; ?>
		<?php echo CHtml::hiddenField($this->getFieldName('id'),$this->record['id']); ?>
	</td>
</tr>
