<tr>
	<th>
		<?php echo TbHtml::label($this->getLabelName('test_exams_contents'), false); ?>
	</th>
	<th>
		<?php echo TbHtml::label($this->getLabelName('test_exams_answer_right'), false); ?>
	</th>
	<th>
		<?php echo TbHtml::label($this->getLabelName('test_exams_answer_faultf'), false); ?>
	</th>
	<th>
		<?php echo TbHtml::label($this->getLabelName('test_exams_answer_faults'), false); ?>
	</th>
	<th>
		<?php echo TbHtml::label($this->getLabelName('test_exams_answer_faultt'), false); ?>
	</th>
	<th>
		<?php echo TbHtml::label($this->getLabelName('test_exams_kinds'), false); ?>
	</th>
	<th>
		<?php echo Yii::app()->user->validRWFunction('HK01') ?
				TbHtml::Button('+',array('id'=>'btnAddRow','title'=>Yii::t('misc','Add'),'size'=>TbHtml::BUTTON_SIZE_SMALL))
				: '&nbsp;';
		?>
	</th>
</tr>
