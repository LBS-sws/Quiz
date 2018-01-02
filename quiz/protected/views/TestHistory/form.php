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
        <strong><?php echo Yii::t('quiz','Quiz DataOrder'); ?></strong>
    </h1>

</section>

<section class="content">
    <div class="box">
        <div class="box-body">
            <div class="btn-group" role="group">
                <?php
                /*                if ($model->scenario!='new' && $model->scenario!='view') {
                                    echo TbHtml::button('<span class="fa fa-file-o"></span> '.Yii::t('misc','Add Another'), array(
                                        'submit'=>Yii::app()->createUrl('TestStart/new')));
                                }
                                */?>
                <?php echo TbHtml::button('<span class="fa fa-reply"></span> '.Yii::t('misc','Back'), array(
                    'submit'=>Yii::app()->createUrl('TestHistory/index')));
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
                <?php echo $form->labelEx($model,'quiz_info_show',array('class'=>"col-sm-2 control-label")); ?>
                <div class="col-sm-5">
                    <?php echo $form->textField($model,'quiz_info_show',
                        array('disabled'=>!Yii::app()->user->validRWFunction('HK01')));?>
                </div>
            </div>

            <?php echo $form->hiddenField($model,'quiz_id',array('id'=>"get_quiz_id"));?>
            <?php $this->info_id_pass=Yii::app()->createUrl('TestHistory/EmployeeInfoShow');?>
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
                var lang=data.length-1;
                console.log(lang);
                if(lang>1){   //如果有错题
                    $("#showTitle").html("<label class='control-label col-sm-6'>" + "共有" + "<font color='red'>"+data[lang]['countTime']+"</font>" + "在本次测验的次数&nbsp;&nbsp;&nbsp;该测验单平均正确率:" +"<font color='red'>"+ data[lang]['quiz_correct_rate'] +"</font>"+
                        "</label>" + "<label class='control-label col-sm-5'>" + "一共出题" + "<font color='red'>"+data[lang]['quiz_total_test_all'] +"</font>"+"道"+ "参加测试的人一共答错:" + "<font color='red'>"+data[lang]['quiz_total_wrong_all'] +"</font>"+ "</label>");
                    $("#showEmployeeInfo").html();
                    console.log(data[12]['demo']);
                    for (var i = 0; i<data.length -2; i++) {
                        if(data[i]['demo']==0){
                            console.log(data[i]['demo']);
                            //console.log("无错题");
                           // content+="<div class='form-group'>"+"本次在该测验单的正确率"+data[i]['shouldAnswerCount']+"</div>";
                        }else{
                            content+="<div class='form-group'>"+"<div class='col-sm-8'>"+"该测验单的应答题目数:"+data[i]['shouldAnswerCount']+"</div>"+"</div>";
                            for(var k=0;k<data[i].length-6;k++){
                                console.log("有错题");
                                content+="<div class='form-group'>"+"<div class='col-sm-8'>"+"问题:"+data[i][k]['test_contents']+"</div>"+"</div>";
                            }
                        }
                        //额外参数固定数量
                    }
                    $("#showEmployeeInfo").html(content);
                }
                else{
                    $("#showTitle").html("<label class='control-label col-sm-6'>" + "共有" + data[lang]['countTime'] + "在本次测验的次数&nbsp;&nbsp;&nbsp;本次测验单平均正确率:" + data[lang]['quiz_correct_rate'] +
                        "</label>" + "<label class='control-label col-sm-5'>" + "一共出题" + data[lang]['quiz_total_test_all'] + "参加测试的人一共答错:" + data[lang]['quiz_total_wrong_all'] + "</label>");
                }
                    $("#showEmployeeInfo").html();

                /*    $("#showEmployeeInfo").html('');
                $.each(data,function(i,result){
                    item +='<div class="form-group">'+'您的数值:'+result['employee_correct_rate']+'城市权限为:'+result['city_privileges']+'</div>';
                });*/
                $("#showEmployeeInfo").html(item);
            },
            error:function(data){
                console.log(data);
            }
        });
    }

</script>
<?php $this->renderPartial('//site/removedialog'); ?>

<?php $this->endWidget(); ?>

