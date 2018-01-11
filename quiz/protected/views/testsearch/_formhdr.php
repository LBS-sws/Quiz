<tr>
	<th>
		<?php echo TbHtml::label($this->getLabelName('task'), false); ?>
	</th>
	<th>
		<?php echo TbHtml::label($this->getLabelName('qty'), false); ?>
	</th>
	<th>
		<?php echo TbHtml::label($this->getLabelName('deadline'), false); ?>
	</th>
	<th>
		<?php echo TbHtml::label($this->getLabelName('finish'), false); ?>
	</th>
	<th>
		<?php echo Yii::app()->user->validRWFunction('A05') ?
				TbHtml::Button('+',array('id'=>'btnAddRow','title'=>Yii::t('misc','Add'),'size'=>TbHtml::BUTTON_SIZE_SMALL))
				: '&nbsp;';
		?>
	</th>
</tr>
