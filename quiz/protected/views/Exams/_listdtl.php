<tr class='clickable-row' data-href='<?php echo $this->getLink('A05', 'logistic/edit', 'logistic/view', array('index'=>$this->record['id']));?>'>
	<td><?php echo $this->drawEditButton('A05', 'logistic/edit', 'logistic/view', array('index'=>$this->record['id'])); ?></td>
<?php if (!Yii::app()->user->isSingleCity()) : ?>
	<td><?php echo $this->record['city_name']; ?></td>
<?php endif ?>
	<td><?php echo $this->record['log_dt']; ?></td>
	<td><?php echo $this->record['seq']; ?></td>
	<td><?php echo $this->record['company_name']; ?></td>
	<td><?php echo $this->record['follow_staff']; ?></td>
	<td><?php echo $this->record['pay_method']; ?></td>
	<td><?php echo $this->record['location_desc']; ?></td>
	<td><?php echo $this->record['finish']; ?></td>
	<td><?php echo $this->record['deadline']; ?></td>
</tr>
