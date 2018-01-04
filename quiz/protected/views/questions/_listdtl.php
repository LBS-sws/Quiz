<tr class='clickable-row' data-href='<?php echo $this->getLink('HK01', 'Questions/edit', 'Questions/view', array('index'=>$this->record['id']));?>'>
	<td><?php echo $this->drawEditButton('HK01', 'Questions/edit', 'Questions/view', array('index'=>$this->record['id'])); ?></td>
	<td><?php echo $this->record['test_exams_contents']; ?></td>
	<td><?php echo $this->record['test_exams_answer_right']; ?></td>
	<td><?php echo $this->record['test_exams_answer_faultf']; ?></td>

</tr>


