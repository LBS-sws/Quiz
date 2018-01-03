<?php

return array(

	'quiz'=>array(
		'access'=>'HK',
		'items'=>array(
			'All quiz records'=>array(
				'access'=>'HK01',
				'url'=>'/quiz/index',
				'tag'=>'@',
			),/*
			'quiz questions'=>array(
				'access'=>'HK02',
				'url'=>'/Questions/index',
				'tag'=>'@',
			),*/
			'quiz questions add'=>array(
				'access'=>'HK03',
				'url'=>'/exams/index',
				'tag'=>'@',
			),
		/*	'quiz questions manage'=>array(
				'access'=>'HK04',
				'url'=>'/quiz/manage',
				'tag'=>'@',
			),*/
			'quiz test manage'=>array(
				'access'=>'HK05',
				'url'=>'/teststart/index',
				'tag'=>'@',
			),
	'quiz test search'=>array(
	'access'=>'HK06',
	'url'=>'/testsearch/index',
	'tag'=>'@',
			),
			'quiz test History'=>array(
				'access'=>'HK07',
				'url'=>'/testhistory/index',
				'tag'=>'@',
			)
		),
	),

);
