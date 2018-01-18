<?php
/**
 * Created by PhpStorm.
 * User: json
 * Date: 2018/1/17 0017
 * Time: 10:36
 */
$this->pageTitle=Yii::app()->name . ' - Nature';
?>

<?php $form=$this->beginWidget('TbActiveForm', array(
    'id'=>'code-list',
    'enableClientValidation'=>true,
    'clientOptions'=>array('validateOnSubmit'=>true,),
    'layout'=>TbHtml::FORM_LAYOUT_INLINE,
)); ?>

<section class="content-header">
    <h1>
        <strong><?php echo Yii::t('quiz','Question List'); ?></strong>
    </h1>
    <!--
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Layout</a></li>
            <li class="active">Top Navigation</li>
        </ol>
    -->
</section>
<div class="btn-group" role="group">
    <?php
    if (Yii::app()->user->validRWFunction('HK01'))
        echo TbHtml::button('<span class="fa fa-file-o"></span> '.Yii::t('misc','test'), array(
                'name'=>'dataCheck','id'=>'dataCheck','data-toggle'=>'modal','data-target'=>'#quizStart',)
        );
    ?>
</div>

<?php $this->widget('ext.layout.ListPageWidget', array(
    'title'=>Yii::t('quiz','quiz List'),
    'model'=>$model,
    'viewhdr'=>'//employeehistory/_listhdr',
    'viewdtl'=>'//employeehistory/_listdtl',
    'gridsize'=>'24',
    'height'=>'600',
    'search'=>array(
        'quiz_date',
        'quiz_name',
        'quiz_correct_rate',
        'quiz_start_dt'
    ),
));
?>
</section>
<?php
echo $form->hiddenField($model,'pageNum');
echo $form->hiddenField($model,'totalRow');
echo $form->hiddenField($model,'orderField');
echo $form->hiddenField($model,'orderType');
?>
<?php $this->renderPartial('//site/quizStart'); ?>
<?php
$js = Script::QuizDataCheck(Yii::app()->createUrl('quiz/delete'));
Yii::app()->clientScript->registerScript('deleteRecord',$js,CClientScript::POS_READY);
?>
<?php $this->endWidget(); ?>
