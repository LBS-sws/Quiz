<tr class='clickable-row' data-href='<?php echo $this->getLink('HK05', 'teststart/edit', 'teststart/view', array('index'=>$this->record['id']));?>'>
	<td><?php echo $this->drawEditButton('HK05', 'teststart/edit', 'teststart/view', array('index'=>$this->record['id'])); ?></td>
	<td><?php echo $this->record['quiz_date']; ?></td>
	<td><?php echo $this->record['quiz_name']; ?></td>
	<td><?php echo $this->record['quiz_correct_rate']; ?></td>
	<td><?php echo $this->record['quiz_exams_id']; ?></td>
	<td><?php echo $this->record['quiz_start_dt']; ?></td>
</tr>


