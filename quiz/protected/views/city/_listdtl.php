<tr class='clickable-row' data-href='<?php echo $this->getLink('HK01', 'quiz/edit', 'quiz/view', array('index'=>$this->record['quiz_id']));?>'>
	<td><?php echo $this->drawEditButton('HK01', 'quiz/edit', 'quiz/view', array('index'=>$this->record['quiz_id'])); ?></td>
	<td><?php echo $this->record['quiz_id']; ?></td>
	<td><?php echo $this->record['quiz_name']; ?></td>
	<td><?php echo $this->record['quiz_date']; ?></td>
	<td><?php echo $this->record['city_privileges']; ?></td>
</tr>
