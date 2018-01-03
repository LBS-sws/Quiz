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
        <strong><?php echo Yii::t('quiz','quiz DataOrder'); ?></strong>
    </h1>

</section>

<section class="content">
    <div class="box">
        <div class="box-body">
            <div class="btn-group" role="group">
                <?php
                /*                if ($model->scenario!='new' && $model->scenario!='view') {
                                    echo TbHtml::button('<span class="fa fa-file-o"></span> '.Yii::t('misc','Add Another'), array(
                                        'submit'=>Yii::app()->createUrl('teststart/new')));
                                }
                                */?>
                <?php echo TbHtml::button('<span class="fa fa-reply"></span> '.Yii::t('misc','Back'), array(
                    'submit'=>Yii::app()->createUrl('testhistory/index')));
                ?>
                <?php if ($model->scenario!='view'): ?>
                    <?php echo TbHtml::button('<span class="fa fa-upload"></span> '.Yii::t('misc','Start quiz'), array(
                        'submit'=>Yii::app()->createUrl('teststart/save')));
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
                <?php echo $form->labelEx($model,'quiz_info_show',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-5">
                    <?php echo $form->textField($model,'quiz_info_show',
                        array('disabled'=>!Yii::app()->user->validRWFunction('HK01')));?>
                </div>
            </div>

            <?php echo $form->hiddenField($model,'quiz_id',array('id'=>"get_quiz_id"));?>
            <?php $this->info_id_pass=Yii::app()->createUrl('testhistory/EmployeeInfoShow');?>
            <input type="hidden" id="urlGetInfo" value="<?php echo $this->info_id_pass;?>"/>

            <div class="form-group">
                <?php echo $form->labelEx($model,'employee_info_name_get',array('class'=>"col-sm-2 control-label")); ?>
                <?php
                echo "<div class='col-sm-5'>";
                $show_employee_info=$model->employee_info_arr;
               for($k=0;$k<count($show_employee_info);$k++){  //$show_employee_info[$k]['id']
                   $info_id="";
                   $info_id=$show_employee_info[$k]['id'];
                   echo "<a onclick='changeIdInfo($info_id);' id='FontChange'>".$show_employee_info[$k]['employee_info_name']."</a>"."&nbsp;&nbsp;&nbsp;&nbsp;";
               }
                echo "</div>";
                ?>
            </div>

            <div class="form-group" id="showTitle">

            </div>
            <div class="form-group" id="showEmployeeInfo">

            </div>
        </div>
    </div>
</section>

<script type="text/javascript">
    function changeIdInfo(id){
        var urlGetInfo=$("#urlGetInfo").val();
        var get_quiz_id=$("#get_quiz_id").val();
       // $("#FontChange").css({'color':"red"});
        console.log("员工:"+id+"测验单:"+get_quiz_id);
        $.ajax({
            type: "post",
            url: urlGetInfo,
            data: {employee_id:id,get_quiz_id:get_quiz_id},
            dataType: "json",
            async:true,
            success: function(data){
                //console.log(data['countTime']);
                var item;
                var content;
                var lang=data.length;
                console.log(lang);
                if(lang>1){   //如果有错题
                   $("#showEmployeeInfo").html();
                    for (var i = 0; i<data.length ; i++) {
                        if(data[i]['should_done_counts']==null){
                            data[i]['should_done_counts']='无记录';
                        }
                        if(data[i]['wrong_done_counts']==null){
                            data[i]['wrong_done_counts']='无错题记录';
                        }
                        if(data[i]['fact_done_counts']==null){
                            data[i]['fact_done_counts']='无实际做题记录';
                        }
                        if(data[i]['correct_rate']==null){
                            data[i]['correct_rate']='无正确率记录';
                        }
                        content+="<div class='form-group'>"+"<div class='col-sm-3'>"+"本次应答题目数:"+data[i]['should_done_counts']+"</div>";
                        console.log("有错题");
                        content+="<div class='col-sm-3'>"+"实做题目数"+data[i]['fact_done_counts']+"</div>";
                        content+="<div class='col-sm-3'>"+"正确率"+data[i]['correct_rate']+"</div>";
                        content+="<div class='col-sm-3'>"+"错题数量:"+data[i]['wrong_done_counts']+"</div>"+"</div>";
                        //额外参数固定数量
                    }
                    $("#showEmployeeInfo").html(content);
                }
                else{
                    lang=lang-1;
                   $("#showEmployeeInfo").html("<label class='control-label col-sm-6'>" + "<font color='red'>"+"无任何记录"+"</font>"+"共有" + data[lang]['countTime'] + "在本次测验的次数&nbsp;&nbsp;&nbsp;本次测验单平均正确率:" + data[lang]['quiz_correct_rate'] +
                        "</label>" + "<label class='control-label col-sm-5'>" + "一共出题" + data[lang]['quiz_total_test_all'] + "参加测试的人一共答错:" + data[lang]['quiz_total_wrong_all'] + "</label>");
                }
                /*
                    $("#showEmployeeInfo").html();

                    $("#showEmployeeInfo").html('');
                $.each(data,function(i,result){
                    item +='<div class="form-group">'+'您的数值:'+result['employee_correct_rate']+'城市权限为:'+result['city_privileges']+'</div>';
                });
                $("#showEmployeeInfo").html(item);*/
            },
            error:function(data){
                console.log(data);
            }
        });
    }

</script>
<?php $this->renderPartial('//site/removedialog'); ?>

<?php $this->endWidget(); ?>

