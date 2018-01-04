<tr class='clickable-row' data-href='<?php echo $this->getLink('HK01', 'testhistory/view', 'testhistory/view', array('quiz_id'=>$this->record['id']));?>'>
	<td><?php echo $this->drawEditButton('HK01', 'testhistory/view', 'testhistory/view', array('quiz_id'=>$this->record['id'])); ?></td>
	<td><?php echo $this->record['quiz_date']; ?></td>
	<td><?php echo $this->record['quiz_name']; ?></td>
	<td><?php echo $this->record['quiz_correct_rate']; ?></td>
	<td><?php echo $this->record['quiz_exams_id']; ?></td>
	<td><?php echo $this->record['quiz_start_dt']."<br/>";
		$date=$this->record['quiz_start_dt'];
        $nowTime=strtotime(date("Y-m-d H:i:s")); //当前时间
        $zero2=strtotime($date);  //测验时间
		$dateBetween=ceil(($nowTime-$zero2)/86400); //60s*60min*24h
		if($dateBetween<0){
			echo "<font color='green'>"."未过期"."</font>";
		}
		else{
			echo "<font color='red'>"."已过期"."</font>";
		}
		?></td>
</tr>


