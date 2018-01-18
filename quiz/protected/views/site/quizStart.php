<?php
/*$js = Script::getInputValue();
$data=Yii::app()->clientScript->registerScript('submitQuizCheck',$js,CClientScript::POS_READY);*/

$content = "<p>".Yii::t('dialog','Please check your data while submitting?')."</p>";

$this->widget('bootstrap.widgets.TbModal', array(
    'id'=>'quizStart',
    'header'=>Yii::t('dialog','Information Show'),
    'content'=>$content,
    'footer'=>array(
        TbHtml::button(Yii::t('dialog','OK'), array('id'=>'btnQuizCheck','data-dismiss'=>'modal','color'=>TbHtml::BUTTON_COLOR_PRIMARY)),
        TbHtml::button(Yii::t('dialog','Cancel'), array('data-dismiss'=>'modal','color'=>TbHtml::BUTTON_COLOR_PRIMARY)),
    ),
    'show'=>false,
));
?>