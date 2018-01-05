<?php

class SiteController extends Controller
{
	public function filters()
	{
		return array(
			'enforceRegisteredStation - error', //apply station checking, except error page
			'enforceSessionExpiration - error,login,logout', 
			'enforceNoConcurrentLogin - error,login,logout',
			'accessControl - error,login,index,home', // perform access control for CRUD operations
		);
	}
	public function accessRules()
	{
		return array(
			array('allow', 
				'users'=>array('@'),
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}

	/**
	 * Declares class-based actions.
	 */
	public function actions()
	{
		return array(
			// captcha action renders the CAPTCHA image displayed on the contact page
			'captcha'=>array(
				'class'=>'CCaptchaAction',
				'backColor'=>0xFFFFFF,
			),
			// page action renders "static" pages stored under 'protected/views/site/pages'
			// They can be accessed via: quiz.php?r=site/page&view=FileName
			'page'=>array(
				'class'=>'CViewAction',
			),
		);
	}

	/**
	 * This is the default 'index' action that is invoked
	 * when an action is not explicitly requested by users.
	 */
	public function actionIndex()
	{
		// renders the view file 'protected/views/site/quiz.php'
		// using the default layout 'protected/views/layouts/main.php'
		if (Yii::app()->user->isGuest) {
			$this->actionLogin();
		}else {
			$uname = Yii::app()->user->name; 
			Yii::app()->session['system'] = Yii::app()->params['systemId'];
			Yii::app()->user->saveUserOption($uname, 'system', Yii::app()->params['systemId']);
			$this->render('index');
		}
	}
	public function actionDemo(){
		$model=$_POST['aa'];
	}

	public function actionHome($url='') {
		if (Yii::app()->user->isGuest)
			$this->actionLogin();
		else {
			$uname = Yii::app()->user->name; 
			Yii::app()->session['system'] = Yii::app()->params['systemId'];
			Yii::app()->user->saveUserOption($uname, 'system', Yii::app()->params['systemId']);
			$this->render('index',array('url'=>$url,));
		}
	}
	
	/**
	 * This is the action to handle external exceptions.
	 */
	public function actionError() {
		if($error=Yii::app()->errorHandler->error)
		{
			if(Yii::app()->request->isAjaxRequest)
				echo $error['message'];
			else {
				if ($error['code']==999) {
					$model=new LoginForm;
					Dialog::message('Warning Message', $error['message']);
					$this->layout = "main_nm";
					$this->render('login',array('model'=>$model));
				} else {
					$this->render('error', $error);
				}
			}
		}
	}
	/**
	 * Displays the login page
	 */
	public function actionLogin()
	{
		$model=new LoginForm;
		// if it is ajax validation request
		if(isset($_POST['ajax']) && $_POST['ajax']==='login-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
		// collect user input data
		if(isset($_POST['LoginForm']))
		{
			$model->attributes=$_POST['LoginForm'];
			// validate user input and redirect to the previous page if valid
			// /验证用户输入，如果有效，则重定向到上一页
			if($model->validate() && $model->login())
			{
				$_SESSION['quiz_session_login_id']=$_REQUEST['LoginForm']['username'];
				$show=Yii::app()->user->setUrlAfterLogin();
				$this->redirect(Yii::app()->user->returnUrl);
			}
			else
			{
				$message=CHtml::errorSummary($model);
				Dialog::message('Validation Message', $message);
			}
		}
		// display the login form
		$this->layout = "main_nm";

		$this->render('login',array('model'=>$model));
	}

	/**
	 * Logs out the current user and redirect to homepage.
	 */
	public function actionLogout()
	{
		Yii::app()->user->logout();
		$this->redirect(Yii::app()->homeUrl);
	}
	public function actionPassword()
	{
		$model=new PasswordForm;
		// collect user input data
		if(isset($_POST['PasswordForm']))
		{
			$model->attributes=$_POST['PasswordForm'];
			if($model->validate())
			{
				$model->save();
				Dialog::message('Info', Yii::t('dialog','Password changed'));
				$this->redirect(Yii::app()->baseUrl);
			}
			else
			{
				$message=CHtml::errorSummary($model);
				Dialog::message('Validation Message', $message);
			}
		}
		// display the login form
		$this->render('password',array('model'=>$model));
	}


	Public function actionGetdata(){
		var_dump($_POST);die;
	}

/*
	public function actionLanguage($locale)
	{
		$session = Yii::app()->session;
		$session['lang'] = $locale;
		Yii::app()->language = $locale;
		$uname = Yii::app()->user->name; 
		Yii::app()->user->saveUserOption($uname, 'lang', $locale);
		$this->actionHome();
	}
*/

	public function actionLanguage() {
		$model=new LanguageForm;

		// collect user input data
		if(isset($_POST['LanguageForm'])) {
			$model->attributes=$_POST['LanguageForm'];
			$session = Yii::app()->session;
			$session['lang'] = $model->language;
			Yii::app()->language = $model->language;
			$uname = Yii::app()->user->name; 
			Yii::app()->user->saveUserOption($uname, 'lang', $model->language);
			$this->redirect(Yii::app()->baseUrl);
		}
		// display the login form
		$model->language = Yii::app()->language;
		$this->render('language',array('model'=>$model));
	}
}