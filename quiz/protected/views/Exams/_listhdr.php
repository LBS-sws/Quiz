<tr>
	<th></th>
<?php if (!Yii::app()->user->isSingleCity()) : ?>
	<th>
		<?php echo TbHtml::link($this->getLabelName('city_name').$this->drawOrderArrow('city_name'),'#',$this->createOrderLink('logistic-list','city_name'))
			;
		?>
	</th>
<?php endif ?>
	<th>
		<?php echo TbHtml::link($this->getLabelName('log_dt').$this->drawOrderArrow('log_dt'),'#',$this->createOrderLink('logistic-list','log_dt'))
			;
		?>
	</th>
	<th>
		<?php echo TbHtml::link($this->getLabelName('seq').$this->drawOrderArrow('seq'),'#',$this->createOrderLink('logistic-list','seq'))
			;
		?>
	</th>
	<th>
		<?php echo TbHtml::link($this->getLabelName('company_name').$this->drawOrderArrow('company_name'),'#',$this->createOrderLink('logistic-list','company_name'))
			;
		?>
	</th>
	<th>
		<?php echo TbHtml::link($this->getLabelName('follow_staff').$this->drawOrderArrow('follow_staff'),'#',$this->createOrderLink('logistic-list','follow_staff'))
			;
		?>
	</th>
	<th>
		<?php echo TbHtml::link($this->getLabelName('pay_method').$this->drawOrderArrow('pay_method'),'#',$this->createOrderLink('logistic-list','pay_method'))
			;
		?>
	</th>
	<th>
		<?php echo TbHtml::link($this->getLabelName('location_desc').$this->drawOrderArrow('location_desc'),'#',$this->createOrderLink('logistic-list','location_desc'))
			;
		?>
	</th>
	<th>
		<?php echo TbHtml::link($this->getLabelName('finish').$this->drawOrderArrow('finish'),'#',$this->createOrderLink('logistic-list','finish'))
			;
		?>
	</th>
	<th>
		<?php echo TbHtml::link($this->getLabelName('deadline').$this->drawOrderArrow('deadline'),'#',$this->createOrderLink('logistic-list','deadline'))
			;
		?>
	</th>
</tr>
