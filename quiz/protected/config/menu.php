<?php

return array(

	'Quiz'=>array(
		'access'=>'HK',
		'items'=>array(
			'All quiz records'=>array(
				'access'=>'HK01',
				'url'=>'/Quiz/index',
				'tag'=>'@',
			),
			'Quiz questions'=>array(
				'access'=>'HK02',
				'url'=>'/Questions/index',
				'tag'=>'@',
			),
			'Quiz questions add'=>array(
				'access'=>'HK03',
				'url'=>'/Exams/index',
				'tag'=>'@',
			),
			'Quiz questions manage'=>array(
				'access'=>'HK04',
				'url'=>'/Quiz/manage',
				'tag'=>'@',
			),
		),
	),
);
