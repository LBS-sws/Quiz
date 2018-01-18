<tr>
	<th></th>

	<th>
		<?php echo TbHtml::link($this->getLabelName('employee_name').$this->drawOrderArrow('employee_name'),'#',$this->createOrderLink('quiz-list','employee_name'))
		;
		?>
	</th>
	<th>
		<?php echo TbHtml::link($this->getLabelName('user_name').$this->drawOrderArrow('user_name'),'#',$this->createOrderLink('quiz-list','user_name'))
		;
		?>
	</th>
	<th>
		<?php echo TbHtml::link($this->getLabelName('count').$this->drawOrderArrow('count'),'#',$this->createOrderLink('quiz-list','count'))
		;
		?>
	</th>

</tr>
