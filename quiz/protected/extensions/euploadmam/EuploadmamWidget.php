<?php 
class EuploadmamWidget extends CWidget
{
    public $model;
    public $attribute;
    public $uploadDir;
    public $actionUpload;
    public $actionRemoveFile;
    public $view;
    public $extensions=null;
	public $title=null;
    public $limit=null;
    public $maxSize=null;
    public $removeConfirmation=true;
    
    public function init()
    {
       $this->publishAssets();
    }
    public function run()
    {
        $_id    =   $this->get_Id();
        $_name  =   $this->get_Name();
        
        if(empty($this->model))
        {
            throw new CException('Uploadma error: param "model" cannot be empty.');
        }
        if(empty($this->attribute))
        {
            throw new CException('Uploadma error: param "attribute" cannot be empty.');
        }
        if(empty($this->uploadDir))
        {
            throw new CException('Uploadma error: param "uploadDir" cannot be empty.');
        }
        if(empty($this->actionUpload))
        {
            throw new CException('Uploadma error: param "actionUpload" cannot be empty.');
        }
        if(empty($this->actionRemoveFile))
        {
            throw new CException('Uploadma error: param "actionRemoveFile" cannot be empty.');
        }
         
        switch ($this->view){
           case 'default'	: $this->render('default'); break;
           case 'dragdrop'	: $this->render('dragdrop'); break;
           case 'instant'	: $this->render('instant'); break;
           default			: $this->render('default');
        }
    }
    public function publishAssets() 
    {
        $assets     = dirname(__FILE__).'/assets';
        $baseUrl    = Yii::app()->assetManager->publish($assets, true, -1, YII_DEBUG);

        if (is_dir($assets)) 
        {
            Yii::app()->clientScript->registerCoreScript('jquery');
            Yii::app()->clientScript->registerScriptFile($baseUrl . '/js/jquery.filer.min.js?v=1.0.5');
            Yii::app()->clientScript->registerCssFile($baseUrl . '/css/jquery.filer.css');
            Yii::app()->clientScript->registerCssFile($baseUrl . '/css/themes/jquery.filer-dragdropbox-theme.css');
        }
        else
        {
            throw new Exception('Uploadma error: Folder with uploadma assets not exists.');
        }
    }
    public function get_Id()
    {
        return CHtml::activeId($this->model, $this->attribute);
    }
    public function get_Name()
    {
        return CHtml::activeName($this->model, $this->attribute);
    }
}
?>