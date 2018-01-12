<tr class='clickable-row' data-href='<?php echo $this->getLink('HK01', 'testhistory/view', 'testhistory/view', array('quiz_id'=>$this->record['id']));?>'>
	<td><?php echo $this->drawEditButton('HK01', 'testhistory/view', 'testhistory/view', array('quiz_id'=>$this->record['id'])); ?></td>
	<td><?php echo $this->record['quiz_date']; ?></td>
	<td><?php echo $this->record['quiz_name']; ?></td>
	<td><?php
		if(!empty($this->record['quiz_correct_rate'])){
			echo $this->record['quiz_correct_rate']."%";
		}
		else{
			echo "";
		}
		 ?></td>
<!--	<td>
		<?php /*echo $this->record['quiz_employee_id']; */?>
	</td>-->
	<td><?php echo $this->record['quiz_start_dt']."<br/>";
		if($this->record['quiz_exams_id']==1){  //长期
			echo "<font color='green'>"."长期"."</font>";
		}
		else {
			$date=$this->record['quiz_start_dt'];
			$nowTime=strtotime(date("Y-m-d H:i:s")); //当前时间
			$zero2=strtotime($date);  //测验截止时间
			$startDate=$this->record['quiz_end_dt'];
			$startTime=strtotime($startDate); //测验开始时间
			$dateBetween=ceil(($nowTime-$zero2)/86400); //60s*60min*24h 当前时间-截止时间 是否截止
			$dateBetweenStart=ceil(($nowTime-$startTime)/86400);  //当前时间-开始时间  是否开始
			if($dateBetweenStart<0){   //未开始
				echo "<font color='red'>" . "未开始" . "</font>";
			}
			else {
				if ($dateBetween < 0) {
					echo "<font color='green'>" . "已开始,未过期" . "</font>";
				} else {
					echo "<font color='red'>" . "已截止,已过期" . "</font>";
				}
			}
		}
		?></td>
</tr>


