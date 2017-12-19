<?= CHtml::hiddenField($this->_name, 'value',array("id"=>$this->_name)); ?>
<?= CHtml::fileField($this->_id, 'value',array("id"=>$this->_id)); ?>
<script type="text/javascript">
$(document).ready(function() {
    var record=[];
	<?php if(!$this->model->isNewRecord && sizeOf(json_decode($this->model->{$this->attribute}))>0):?>
		<?php foreach(json_decode($this->model->{$this->attribute}) as $value=>$key): ?>
			var record_item = {
				"name"		: '<?= $key->name; ?>',
				"extension"	: '<?= $key->extension; ?>',
				"size"		: '<?= $key->size; ?>',
				"type"		: '<?= $key->type; ?>',
			};
			
			record.push(record_item);
		<?php endforeach; ?>
		$( "input[name='<?= $this->_name ?>']" ).val(JSON.stringify(record));
		
	<?php endif; ?>
    $("#<?= $this->_id ?>").filer({
		limit: <?= $this->limit ?>,
		maxSize: <?= $this->maxSize ?>,
		extensions:<?= json_encode($this->extensions) ?>,
        changeInput: '<div class="jFiler-input-dragDrop"><div class="jFiler-input-inner"><div class="jFiler-input-icon"><i class="icon-jfi-cloud-up-o"></i></div><div class="jFiler-input-text"><h3>Drag&Drop files here</h3> <span style="display:inline-block; margin: 15px 0">or</span></div><a class="jFiler-input-choose-btn blue">Browse Files</a></div></div>',
		showThumbs: true,
        theme: "dragdropbox",
        templates: {
            box: '<ul class="jFiler-items-list jFiler-items-grid"></ul>',
            item: '<li class="jFiler-item">\
                        <div class="jFiler-item-container">\
                            <div class="jFiler-item-inner">\
                                <div class="jFiler-item-thumb">\
                                    <div class="jFiler-item-status"></div>\
                                    <div class="jFiler-item-info">\
                                        <span class="jFiler-item-title"><b title="{{fi-name}}">{{fi-name | limitTo: 25}}</b></span>\
                                        <span class="jFiler-item-others">{{fi-size2}}</span>\
                                    </div>\
                                    {{fi-image}}\
                                </div>\
                                <div class="jFiler-item-assets jFiler-row">\
                                    <ul class="list-inline pull-left">\
                                        <li>{{fi-progressBar}}</li>\
                                    </ul>\
                                    <ul class="list-inline pull-right">\
                                        <li><a class="icon-jfi-trash jFiler-item-trash-action"></a></li>\
                                    </ul>\
                                </div>\
                            </div>\
                        </div>\
                    </li>',
            itemAppend: '<li class="jFiler-item">\
                            <div class="jFiler-item-container">\
                                <div class="jFiler-item-inner">\
                                    <div class="jFiler-item-thumb">\
                                        <div class="jFiler-item-status"></div>\
                                        <div class="jFiler-item-info">\
                                            <span class="jFiler-item-title"><b title="{{fi-name}}">{{fi-name | limitTo: 25}}</b></span>\
                                            <span class="jFiler-item-others">{{fi-size2}}</span>\
                                        </div>\
                                        {{fi-image}}\
                                    </div>\
                                    <div class="jFiler-item-assets jFiler-row">\
                                        <ul class="list-inline pull-left">\
                                            <li><span class="jFiler-item-others">{{fi-icon}}</span></li>\
                                        </ul>\
                                        <ul class="list-inline pull-right">\
                                            <li><a class="icon-jfi-trash jFiler-item-trash-action"></a></li>\
                                        </ul>\
                                    </div>\
                                </div>\
                            </div>\
                        </li>',
            progressBar: '<div class="bar"></div>',
            itemAppendToEnd: false,
            removeConfirmation: <?= $this->removeConfirmation ?>,
            _selectors: {
                list: '.jFiler-items-list',
                item: '.jFiler-item',
                progressBar: '.bar',
                remove: '.jFiler-item-trash-action'
            }
        },
        dragDrop: {
            dragEnter: null,
            dragLeave: null,
            drop: null,
        },
        uploadFile: {
            url: "<?= $this->actionUpload;?>",
            data:{
            'limit':'<?= $this->limit ?>',
            'maxSize':'<?= $this->maxSize ?>',
            'extensions':'<?= json_encode($this->extensions) ?>',
            'uploadDir':'<?= $this->uploadDir?>',
            'name':'<?= $this->_id ?>',
            'title':'<?= json_encode($this->title) ?>',
            },
            type: 'POST',
            enctype: 'multipart/form-data',
            beforeSend: function(){},
            success: function(data, itemEl, listEl, boxEl, newInputEl, inputEl, id){
				
                var parent = itemEl.find(".jFiler-jProgressBar").parent();
                itemEl.find(".jFiler-jProgressBar").fadeOut("slow", function(){
                    $("<div class=\"jFiler-item-others text-success\"><i class=\"icon-jfi-check-circle\"></i> Success</div>").hide().appendTo(parent).fadeIn("slow");    
                });
				/**/
				var parse_data=$.parseJSON(data);
				inputEl.prop("jFiler").files_list[id].name = parse_data.name;
				var record_item = {
					"name"		: parse_data.name,
					"extension"	: parse_data.extension,
					"size"		: parse_data.size,
					"type"		: parse_data.type,
				};
				record.push(record_item);
                $( "input[name='<?= $this->_name ?>']" ).val(JSON.stringify(record));
				/**/
            },
            error: function(el){
                var parent = el.find(".jFiler-jProgressBar").parent();
                el.find(".jFiler-jProgressBar").fadeOut("slow", function(){
                    $("<div class=\"jFiler-item-others text-error\"><i class=\"icon-jfi-minus-circle\"></i> Error</div>").hide().appendTo(parent).fadeIn("slow");    
                });
            },
            statusCode: null,
            onProgress: null,
            onComplete: null
        },
		/**/
		<?php if(!$this->model->isNewRecord && sizeOf(json_decode($this->model->{$this->attribute}))>0):?>
		
		files: [
			
			<?php foreach(json_decode($this->model->{$this->attribute}) as $value=>$key): ?>
			{
				name: "<?= $key->name; ?>",
				size: "<?= $key->size; ?>",
				type: "<?= $key->type; ?>/<?= $key->extension; ?>",
				file: "<?= Yii::app()->baseUrl ?>/<?= $this->uploadDir; ?>/<?= $key->name; ?>"
			},
			<?php endforeach; ?>
			
		],
		<?php else:?>
        files: null,
		
		<?php endif; ?>
		/**/
        addMore: false,
        clipBoardPaste: true,
        excludeName: null,
        beforeRender: null,
        afterRender: null,
        beforeShow: null,
        beforeSelect: null,
        onSelect: null,
        afterShow: null,
        onRemove: function(itemEl, file, id, listEl, boxEl, newInputEl, inputEl){
			/**/
			var file = inputEl.prop("jFiler").files_list[id].name;
			var index;
			jQuery.each(record, function(i, val) {
				if(val.name == file) {index=i;}
				
			});
			record.splice(index,1);
			$( "input[name='<?= $this->_name ?>']" ).val(JSON.stringify(record));
            $.post('<?= $this->actionRemoveFile;?>', {file: file,'uploadDir':'<?= $this->uploadDir?>'});
			/**/
        },
        onEmpty: null,
        options: null,
        captions: {
            button: "Choose Files",
            feedback: "Choose files To Upload",
            feedback2: "files were chosen",
            drop: "Drop file here to Upload",
            removeConfirmation: "Are you sure you want to remove this file?",
            errors: {
                filesLimit: "Only {{fi-limit}} files are allowed to be uploaded.",
                filesType: "Only Images are allowed to be uploaded.",
                filesSize: "{{fi-name}} is too large! Please upload file up to {{fi-maxSize}} MB.",
                filesSizeAll: "Files you've choosed are too large! Please upload files up to {{fi-maxSize}} MB."
            }
        }
    });
	<?php if(!$this->model->isNewRecord && sizeOf(json_decode($this->model->{$this->attribute}))>0):?>
		<?php foreach(json_decode($this->model->{$this->attribute}) as $value=>$key): ?>
			$("#<?= $this->_id ?>").prop("jFiler").files_list[<?= $value ?>].name = '<?= $key->name; ?>';
		<?php endforeach; ?>
		
	<?php endif; ?>
});
</script>
		