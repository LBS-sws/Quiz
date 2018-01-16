<?php
class Script {
	public static function genLookupSelect() {
		$mesg = Yii::t('dialog','No Record Found');
		$str = <<<EOF
$('#btnLookupSelect').on('click',function() {
	$('#lookupdialog').modal('hide');
	lookupselect();
});
		
$('#btnLookupCancel').on('click',function() {
	$('#lookupdialog').modal('hide');
	lookupclear();
});

function lookupselect() {
	var codeval = "";
	var valueval = "";
	$("#lstlookup option:selected").each(function(i, selected) {
		codeval = ((codeval=="") ? codeval : codeval+"~") + $(selected).val();
		valueval = ((valueval=="") ? valueval : valueval+" ") + $(selected).text();
	});
	var ofstr = $('#lookupotherfield').val();

	if (codeval && valueval!='$mesg') {
		var codefield = $('#lookupcodefield').val();
		var valuefield = $('#lookupvaluefield').val();
		if (codefield!='') $('#'+codefield).val(codeval);
		$('#'+valuefield).val(valueval);
		
		var others = (ofstr!='') ? ofstr.split("/") : new Array();
		if (others.length > 0) {
			$.each(others, function(idx, item) {
				var field = item.split(",");
				if (field.length > 0) {
					var fldId = 'otherfld_'+codeval+'_'+field[0];
					var fldVal = $('#'+fldId).val();
					$('#'+field[1]).val(fldVal);
				}
			});
		}
	}
	
	lookupclear();
}

function lookupclear() {
	$('#lookuptype').val('');
	$('#lookupcodefield').val('');
	$('#lookupvaluefield').val('');
	$("#txtlookup").val('');
	$("#lstlookup").empty();
	$('#fieldvalue').empty();
	$("#lstlookup").removeAttr('multiple');
	$("#lookup-label").removeAttr('style');
}
EOF;
		return $str;
	}
 
	public static function genLookupButton($btnName, $lookupType, $codeField, $valueField, $multiselect=false) {
		$multiflag = $multiselect ? 'true' : 'false';
		$str = <<<EOF
$('#$btnName').on('click',function() {
	var code = $("input[id*='$codeField']").attr("id");
	var value = $("input[id*='$valueField']").attr("id");
	var title = $("label[for='"+value+"']").text();
	$('#lookuptype').val('$lookupType');
	$('#lookupcodefield').val(code);
	$('#lookupvaluefield').val(value);
	if ($multiflag) $('#lstlookup').attr('multiple','multiple');
	if (!($multiflag)) $('#lookup-label').attr('style','display: none');
	$('#lookupdialog').find('.modal-title').text(title);
//	$('#lookupdialog').dialog('option','title',title);
	$('#lookupdialog').modal('show');
});
EOF;
		return $str;
	}
 
	public static function genLookupButtonEx($btnName, $lookupType, $codeField, $valueField, $otherFields=array(), $multiselect=false) {
		$others = '';
		if (!empty($otherFields)) {
			foreach ($otherFields as $key=>$field) {
				$others .= ($others=='' ? '' : '/').$key.','.$field;
			}
		}
		$multiflag = $multiselect ? 'true' : 'false';
		
		$str = <<<EOF
$('#$btnName').on('click',function() {
	var code = $("input[id*='$codeField']").attr("id");
	var value = $("input[id*='$valueField']").attr("id");
	var title = $("label[for='"+value+"']").text();
	$('#lookuptype').val('$lookupType');
	$('#lookupcodefield').val(code);
	$('#lookupvaluefield').val(value);
	$('#lookupotherfield').val('$others');
	if ($multiflag) $('#lstlookup').attr('multiple','multiple');
	if (!($multiflag)) $('#lookup-label').attr('style','display: none');
//	$('#lookupdialog').dialog('option','title',title);
	$('#lookupdialog').find('.modal-title').text(title);
	$('#lookupdialog').modal('show');
});
EOF;
		return $str;
	}

	public static function genLookupSearch() {
		$mesg = Yii::t('dialog','No Record Found');
		$link = Yii::app()->createAbsoluteUrl("lookup");
		$str = <<<EOF
$('#btnLookup').on('click',function(){
	var data = "search="+$("#txtlookup").val();
	var link = "$link"+"/"+$("#lookuptype").val();
	$.ajax({
		type: 'GET',
		url: link,
		data: data,
		success: function(data) {
			jQuery("#lookup-list").html(data);
			var count = $("#lstlookup").children().length;
			if (count<=0) $("#lstlookup").append("<option value='-1'>$mesg</option>");
		},
		error: function(data) { // if error occured
			alert("Error occured.please try again");
		},
		dataType:'html'
	});
});
EOF;
		return $str;
	}
	
	public static function genLookupSearchEx() {
		$mesg = Yii::t('dialog','No Record Found');
		$link = Yii::app()->createAbsoluteUrl("lookup");
		$str = <<<EOF
$('#btnLookup').on('click',function(){
	var data = "search="+$("#txtlookup").val();
	var link = "$link"+"/"+$("#lookuptype").val()+'ex';
	var ofstr = $('#lookupotherfield').val();
	$.ajax({
		type: 'GET',
		url: link,
		data: data,
		dataType: 'json',
		success: function(data) {
			$('#fieldvalue').empty();
			$("#lstlookup").empty();

			var others = (ofstr!='') ? ofstr.split("/") : new Array();
			
			$.each(data, function(index, element) {
				$("#lstlookup").append("<option value='"+element.id+"'>"+element.value+"</option>");
				if (others.length > 0) {
					$.each(others, function(idx, item) {
						var field = item.split(",");
						if (field.length > 0) {
							var hidden = $('<input/>',{type:'hidden',id:'otherfld_'+element.id+'_'+field[0], value:element[field[0]]});
							hidden.appendTo('#fieldvalue');
						}
					});
				}
			});
			
			var count = $("#lstlookup").children().length;
			if (count<=0) $("#lstlookup").append("<option value='-1'>$mesg</option>");
		},
		error: function(data) { // if error occured
			alert("Error occured.please try again");
		}
	});
});
EOF;
		return $str;
	}

	public static function genReadonlyField() {
		$str = <<<EOF
$('[readonly]').addClass('readonly');
EOF;
		return $str;
	}

	public static function genTableRowClick() {
		$str = <<<EOF
$('.clickable-row').click(function() {
	window.document.location = $(this).data('href');
});
EOF;
		return $str;
	}
	
	public static function genDatePicker($fields) {
		$str = "";
		foreach ($fields as $field) {
			$str .= "$('#$field').datepicker({autoclose: true, format: 'yyyy/mm/dd'});";
		}
		return $str;
	}

	/**
	 * @param $link //跳转方法
	 * @return string
	 */
	public static function genDeleteData($link) {
		$str = "
$('#btnDeleteData').on('click',function() {
	$('#removedialog').modal('hide');
	deletedata();
});

function deletedata() {
	var elm=$('#btnDelete');
	jQuery.yii.submitForm(elm,'$link',{});
}
		";
		return $str;
	}

	public static function QuizDataCheck($link) {
		$str = "
$('#btnQuizCheck').on('click',function() {
	$('#QuizDataCheck').modal('hide');
	dataCheck();
});

function dataCheck() {
	var elm=$('#dataCheck');
	jQuery.yii.submitForm(elm,'$link',{});
}
		";
		return $str;
	}

	public static function genFileUpload($modelname, $formname, $ctrlname) {
		$msg = Yii::t('dialog','Are you sure to delete record?');
		$rmlink = Yii::app()->createAbsoluteUrl($ctrlname."/fileremove");
		$dwlink = Yii::app()->createAbsoluteUrl($ctrlname."/filedownload");
		$rmfldid = $modelname.'_removeFileId';
		$dwfldid = $modelname.'_downloadFileId';
		$str = "
function removeFile(id) {
	if (confirm('$msg')) {
		document.getElementById('$rmfldid').value = id;
		var form = document.getElementById('$formname');
		var formdata = new FormData(form);
		$.ajax({
			type: 'POST',
			url: '$rmlink',
			data: formdata,
			mimeType: 'multipart/form-data',
			contentType: false,
			processData: false,
			success: function(data) {
				if (data!='NIL') {
					$('#tblFile').find('tbody').empty().append(data);
				}
			},
			error: function(data) { // if error occured
				alert('Error occured.please try again');
			}
		});	
	}
}

function downloadFile(did, fid) {
	href = '$dwlink?docId='+did+'&fileId='+fid;
	window.open(href);
}
		";
		Yii::app()->clientScript->registerScript('removefile1',$str,CClientScript::POS_HEAD);

		$link = Yii::app()->createAbsoluteUrl($ctrlname."/fileupload");
		$str = "
$('#btnUploadFile').on('click', function() {
	var form = document.getElementById('$formname');
	var formdata = new FormData(form);
	$.ajax({
		type: 'POST',
		url: '$link',
		data: formdata,
		mimeType: 'multipart/form-data',
		contentType: false,
		processData: false,
		success: function(data) {
			if (data!='NIL') {
				$('#tblFile').find('tbody').empty().append(data);
				$('input:file').MultiFile('reset')
			}
		},
		error: function(data) { // if error occured
			alert('Error occured.please try again');
		}
	});
});
		";
		Yii::app()->clientScript->registerScript('fileUpload',$str,CClientScript::POS_READY);
	}
}
?>