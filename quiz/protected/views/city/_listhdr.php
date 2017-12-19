<tr>
	<th></th>
	<th>
		<?php echo TbHtml::link($this->getLabelName('code').$this->drawOrderArrow('code'),'#',$this->createOrderLink('code-list','code'))
			;
		?>
	</th>
	<th>
		<?php echo TbHtml::link($this->getLabelName('name').$this->drawOrderArrow('name'),'#',$this->createOrderLink('code-list','name'))
			;
		?>
	</th>
	<th>
		<?php echo TbHtml::link($this->getLabelName('region_name').$this->drawOrderArrow('region_name'),'#',$this->createOrderLink('code-list','region_name'))
			;
		?>
	</th>
	<th>
		<?php echo TbHtml::link($this->getLabelName('incharge').$this->drawOrderArrow('incharge'),'#',$this->createOrderLink('code-list','incharge'))
			;
		?>
	</th>
</tr>
