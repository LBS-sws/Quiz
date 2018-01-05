<tr>
	<th></th>
	<th>
		<?php echo TbHtml::link($this->getLabelName('quiz_date').$this->drawOrderArrow('quiz_date'),'#',$this->createOrderLink('quiz-list','quiz_date'))
			;
		?>
	</th>

	<th>
		<?php echo TbHtml::link($this->getLabelName('quiz_name').$this->drawOrderArrow('quiz_name'),'#',$this->createOrderLink('quiz-list','quiz_name'))
		;
		?>
	</th>
	<th>
		<?php echo TbHtml::link($this->getLabelName('quiz_correct_rate').$this->drawOrderArrow('quiz_correct_rate'),'#',$this->createOrderLink('quiz-list','quiz_correct_rate'))
		;
		?>
	</th>
<!--	<th>
		<?php /*echo TbHtml::link($this->getLabelName('quiz_exams_id').$this->drawOrderArrow('quiz_exams_id'),'#',$this->createOrderLink('quiz-list','quiz_exams_id'))
		;
		*/?>
	</th>-->
	<th>
		<?php echo TbHtml::link($this->getLabelName('quiz_start_dt').$this->drawOrderArrow('quiz_start_dt'),'#',$this->createOrderLink('quiz-list','quiz_start_dt'))
		;
		?>
	</th>
</tr>
