<?php
$content = "<p>".Yii::t('dialog','Are you sure to delete?')."</p>";
$this->widget('bootstrap.widgets.TbModal', array(
    'id'=>'QuizDataCheck',
    'header'=>Yii::t('dialog','Delete Record'),
    'content'=>$content,
    'footer'=>array(
        TbHtml::button(Yii::t('dialog','OK'), array('id'=>'btnQuizCheck','data-dismiss'=>'modal','color'=>TbHtml::BUTTON_COLOR_PRIMARY)),
        TbHtml::button(Yii::t('dialog','Cancel'), array('data-dismiss'=>'modal','color'=>TbHtml::BUTTON_COLOR_PRIMARY)),
    ),
    'show'=>false,
));
?>