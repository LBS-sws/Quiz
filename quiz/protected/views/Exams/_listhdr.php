<tr>
	<th></th>
	<th>
		<?php echo TbHtml::link($this->getLabelName('test_exams_contents').$this->drawOrderArrow('test_exams_contents'),'#',$this->createOrderLink('questions-list','test_exams_contents'))
		;
		?>
	</th>

	<th>
		<?php echo TbHtml::link($this->getLabelName('test_exams_answer_right').$this->drawOrderArrow('test_exams_answer_right'),'#',$this->createOrderLink('questions-list','test_exams_answer_right'))
		;
		?>
	</th>
	<th>
		<?php echo TbHtml::link($this->getLabelName('test_exams_answer_faultf').$this->drawOrderArrow('test_exams_answer_faultf'),'#',$this->createOrderLink('questions-list','test_exams_answer_faultf'))
		;
		?>
	</th>

</tr>
