<?php
$this->pageTitle=Yii::app()->name . ' - Customer Type Form';
?>

<?php $form=$this->beginWidget('TbActiveForm', array(
    'id'=>'code-form',
    'enableClientValidation'=>true,
    'clientOptions'=>array('validateOnSubmit'=>true,),
    'layout'=>TbHtml::FORM_LAYOUT_HORIZONTAL,
)); ?>

<section class="content-header">
    <h1>
        <strong><?php echo Yii::t('quiz','Quiz resultOrder'); ?></strong>
    </h1>
    <!--
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Layout</a></li>
            <li class="active">Top Navigation</li>
        </ol>
    -->
</section>

<section class="content">
    <div class="box"><div class="box-body">
            <div class="btn-group" role="group">
                <!-- --><?php
                /*                if ($model->scenario!='new' && $model->scenario!='view') {
                                    echo TbHtml::button('<span class="fa fa-file-o"></span> '.Yii::t('misc','Add Another'), array(
                                        'submit'=>Yii::app()->createUrl('TestStart/new')));
                                }
                                */?>
                <?php echo TbHtml::button('<span class="fa fa-reply"></span> '.Yii::t('misc','Back'), array(
                    'submit'=>Yii::app()->createUrl('TestStart/index')));
                ?>
                <?php if ($model->scenario!='view'): ?>
                    <?php echo TbHtml::button('<span class="fa fa-upload"></span> '.Yii::t('misc','Start Quiz'), array(
                        'submit'=>Yii::app()->createUrl('TestStart/save')));
                    ?>
                <?php endif ?>
                <?php if ($model->scenario=='edit'): ?>
                    <?php echo TbHtml::button('<span class="fa fa-remove"></span> '.Yii::t('misc','Delete'), array(
                            'name'=>'btnDelete','id'=>'btnDelete','data-toggle'=>'modal','data-target'=>'#removedialog',)
                    );
                    ?>
                <?php endif ?>
            </div>
        </div>
    </div>

    <div class="box box-info">
        <div class="box-body">
            <?php echo $form->hiddenField($model, 'scenario'); ?>
            <?php echo $form->hiddenField($model, 'id'); ?>

            <div class="form-group">
                <?php echo $form->labelEx($model,'quiz_name',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-5">
                    <?php echo $form->textField($model, 'quiz_name',
                        array('size'=>50,'maxlength'=>100,'readonly'=>($model->scenario=='view'),'id'=>'checkInfoName',)
                    ); ?>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-5 control-label" >
                    <?php echo
                        "您在本次的测验中应答题目"."&nbsp;".$model->should_answer_count."道题".
                        "<br/>".
                        "实际答题"."&nbsp;".$model->fact_answer_count."道题".
                        "<br/>".
                        "正确率为"."&nbsp;".$model->employee_rate."%"."&nbsp;".
                        "<br/>".
                        "错题数量"."&nbsp;".$model->wrong_answer_count."&nbsp;&nbsp;&nbsp;".
                        "<br/>"
                        .$model->quiz_name."的平均正确率为"."&nbsp;".$model->quiz_rate."%"."&nbsp;".
                        "<br/>".
                        "测验用时:".$model->this_time_for."秒". "<br/>". "<br/>". "<br/>"
                    ?>
                </label>
                <label class="col-sm-3 control-label">
                    <?php
                    if($model->quiz_rate>$model->employee_rate){
                        echo "您当前的正确率低于本次测验的平均水平,请继续加油！";
                    }
                    elseif($model->quiz_rate=$model->employee_rate){
                        echo "您当前的正确率等于本次测验的平均水平,请继续努力！";
                    }
                    else{
                        echo "您此次的正确率虽然高于本次测验的平均水平,不要懈怠哦！";
                    }
                    ?>
                </label>
            </div>

            <div class="form-group">
                <label class="col-sm-5 control-label" >本次错题记录如下</label>
            </div>
           <?php
           for($c=0;$c<count($model->answer_wrong_contents);$c++){
                echo "<div class='form-group'>".
                    "<label>"."测试题第".$model->answer_wrong_contents[$c][0]['id']."题"."&nbsp;&nbsp;&nbsp;".$model->answer_wrong_contents[$c][0]['test_exams_contents']."</label>"
                    ."</div>".
                "<div class='from-group'>"
                    .
                    "<label class='col-sm-5 control-label'>"."您的选择:"."&nbsp;&nbsp;".$model->answer_wrong_contents[$c][1]."</label>".
                    "<label class='col-sm-5 control-label'>"."正确答案:"."&nbsp;&nbsp;".$model->answer_wrong_contents[$c][0]['test_exams_answer_right']."</label>"
                    ."</div>"
                ;
           }
           ?>

        </div>
    </div>
</section>

<?php $this->endWidget(); ?>

