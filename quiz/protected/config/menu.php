<?php

return array(

	'Quiz'=>array(
		'access'=>'HK',
		'items'=>array(
			'All quiz records'=>array(
				'access'=>'HK01',
				'url'=>'/Quiz/index',
				'tag'=>'@',
			),/*
			'Quiz questions'=>array(
				'access'=>'HK02',
				'url'=>'/Questions/index',
				'tag'=>'@',
			),*/
			'Quiz questions add'=>array(
				'access'=>'HK03',
				'url'=>'/Exams/index',
				'tag'=>'@',
			),
		/*	'quiz questions manage'=>array(
				'access'=>'HK04',
				'url'=>'/quiz/manage',
				'tag'=>'@',
			),*/
			'Quiz test manage'=>array(
				'access'=>'HK05',
				'url'=>'/teststart/index',
				'tag'=>'@',
			),
	'Quiz test search'=>array(
	'access'=>'HK06',
	'url'=>'/testsearch/index',
	'tag'=>'@',
			),
			'Quiz test History'=>array(
				'access'=>'HK07',
				'url'=>'/testhistory/index',
				'tag'=>'@',
			),
			'Quiz employee History'=>array(
			'access'=>'HK08',
				'url'=>'/Employeehistory/index',
				'tag'=>'@',
			),
		),
	),

);
