<?php
header("Content-type: text/html; charset=utf-8");
class ListPageWidget extends CWidget
{
	public $model;
	public $title;
	public $gridsize;
	public $viewhdr;
	public $viewdtl;
	public $height='100';
	public $search=array();

	public $record;
	public $recordptr;

	public function run()
	{
		$layout = '<div class="box">';
		$layout .= '<div class="box-header"><h3 class="box-title"><strong>'.$this->title.'</strong></h3>';
		$layout .= '</div>';
		$layout .= '<div class="box-body table-responsive">';
		$layout .= '<div class="box-tools">';
		$layout .= $this->navBar();
		$layout .= '<span class="pull-right">';
		$layout .= $this->searchBar();
		$layout .= '</span>';
		$layout .= '</div>';
		$layout .= '<div><table id="tblData" class="table table-hover">';
		$layout .= '<thead>';
		$layout .= $this->render($this->viewhdr, null, true);
		$layout .= '</thead>';

		$layout .= '<tbody>';
		if (count($this->model->attr) > 0)
		{
			foreach ($this->model->attr as $i=>$row)
			{
				$this->record = $row;
				$this->recordptr = $i;
				$line = $this->render($this->viewdtl, $this->record, true);
				$layout .= $line;
			}
		} else {
			$layout .= '<tr><td>&nbsp;</td></tr>';
		}
		$layout .= '</tbody>';
		$layout .= '</table></div>';
		$layout .= '</div>';

		$layout .= '<div class="box-footer clearfix">';
		$layout .= '<div class="box-tools">'.$this->pageBar().'</div>';
		$layout .= '<span class="pull-right">'.Yii::t('misc','Rec').': '.$this->model->totalRow.'</span>';
		$layout .= '</div>';

		echo $layout;
	}

	protected function navBar()
	{
		$totalrow = $this->model->totalRow;
		$pageno = $this->model->pageNum;
		$pagerow = ($this->model->noOfItem == 0) ? $totalrow : $this->model->noOfItem;
		$remain = ($pagerow==0) ? 0 : $totalrow % $pagerow;
		$totalpage = ($pagerow==0) ? 1 : (($totalrow - $remain) / $pagerow) + (($remain==0) ? 0 : 1);
		$window = 10;
		$tab = 3;
		$width=80/$window;

		$link = '/'.$this->controller->uniqueId.'/'.$this->controller->action->id;

		$items = array();

		$url = Yii::app()->createUrl($link,array('pageNum'=>1));
		$items[] = array('label'=>'1','url'=>$url,'active'=>($pageno == 1));
		$cnt = 1;

		if ($pageno > $tab && $totalpage > $window) {
			$items[] = array('label'=>'...','url'=>'#',);
			$cnt++;
		}

		$hadj = ($pageno > $tab && $totalpage > $window) ? 2 : 1;
		$tadj = ($totalpage > $window) ? (($pageno < $totalpage-($window-$hadj)+1) ? 2 : 1) : 0;
		$adj = $hadj + $tadj;
		$pos = ($pageno > $tab && $totalpage > $window)
			? (($pageno > $totalpage-($window-$hadj)+1) ? $totalpage-($window-$hadj)+1 : $pageno-($tab-1))
			: 2;
		while ($pos <= $totalpage && $cnt < $window-$tadj)
		{
			$url = Yii::app()->createUrl($link,array('pageNum'=>$pos));
			$items[] = array('label'=>$pos,'url'=>$url,'active'=>($pageno == $pos));
			$pos++;
			$cnt++;
		}

		if ($totalpage > $window) {
			if ($pageno < $totalpage-($window-$adj-$tab)-1 && $totalpage > $window) {
				$items[] = array('label'=>'...','url'=>'#',);
				$cnt++;
			}

			$url = Yii::app()->createUrl($link,array('pageNum'=>$totalpage));
			$items[] = array('label'=>$totalpage,'url'=>$url,'active'=>($pageno == $totalpage));

			$cnt++;
		}

//		return TbHtml::pagination($items, array('align'=>TbHtml::PAGINATION_ALIGN_RIGHT,'size'=>TbHtml::PAGINATION_SIZE_SMALL));
		return TbHtml::pagination($items, array('class'=>'pagination pagination-sm no-margin'));
	}

	protected function searchBar()
	{
		$modelName = get_class($this->model);

		$link = '/'.$this->controller->uniqueId.'/'.$this->controller->action->id;
		$list[''] = Yii::t('misc','-- Field --');

		foreach ($this->search as $field)
		{
			$list[$field] = Yii::t('app',$this->getLabelName($field));
		}

		$layout = TbHtml::dropDownList($modelName.'[searchField]',$this->model->searchField,$list);
		$layout .= TbHtml::textField($modelName.'[searchValue]',$this->model->searchValue,
			array('size'=>15,
				'placeholder'=>Yii::t('misc','Search'),
				'append'=>TbHtml::button('<span class="fa fa-search"></span> '.Yii::t('misc','Search'), array('submit'=>Yii::app()->createUrl($link,array('pageNum'=>1)),)),
			));

		return $layout;
	}

	protected function pageBar()
	{
		$modelName = get_class($this->model);  //QuizList

		$link = '/'.$this->controller->uniqueId.'/'.$this->controller->action->id;  ///quiz/index

		$list = array(
			'2'=>'2',
			'4'=>'4',
			'6'=>'6',
			'8'=>'8',
			'0'=>Yii::t('misc','All'),
		);
		$fldname = $modelName.'[noOfItem]';  //QuizList[noOfItem]

		$layout = '<div class="col-sm-3">'.Yii::t('misc','Display').': '
			.TbHtml::dropDownList($fldname,$this->model->noOfItem,$list,
				array('submit'=>Yii::app()->createUrl($link),)
			).'</div>';

		return $layout;
	}

	public function getLabelName($attribute)
	{
		$labels = $this->model->attributeLabels();
		return (array_key_exists($attribute, $labels)) ? $labels[$attribute] : $attribute;
	}

	public function getFieldName($attribute)
	{
		$modelName = get_class($this->model);
		return $modelName.'[attr]['.$this->recordptr.']['.$attribute.']';
	}

	public function createOrderLink($form, $attribute)
	{
		$modelName = get_class($this->model);
		$link = array(
			'ajax'=>array(
				'type'=>'POST',
				'url'=>Yii::app()->createUrl('ajax/dummy'),
				'success'=>'function() {
							var oldfield = $("#'.$modelName.'_orderField").val();
							if (oldfield != "'.$attribute.'")
								$("#'.$modelName.'_orderType").val("A");
							else
							{
								var oldtype = $("#'.$modelName.'_orderType").val();
								if (oldtype == "D")
									$("#'.$modelName.'_orderType").val("A");
								else
									$("#'.$modelName.'_orderType").val("D");
							}
							$("#'.$modelName.'_orderField").val("'.$attribute.'");
							$("form#'.$form.'").submit();
						}',
			),
		);
		return $link;
	}

	public function getIndex() {
		return $this->recordptr + ($this->model->pageNum - 1) * $this->model->noOfItem;
	}

	public function getLink($access, $writeurl, $readurl, $param) {
		$rw = Yii::app()->user->validRWFunction($access);
		$url = $rw ? $writeurl : $readurl;
		return Yii::app()->createUrl($url,$param);
	}

	public function drawEditButton($access, $writeurl, $readurl, $param) {
		$rw = Yii::app()->user->validRWFunction($access);
		$url = $rw ? $writeurl : $readurl;
		$icon = $rw ? "glyphicon glyphicon-pencil" : "glyphicon glyphicon-eye-open";
		$alt = $rw ? Yii::t('misc','Edit') : Yii::t('misc','View');
		$lnk=Yii::app()->createUrl($url,$param);

		return "<a href=\"$lnk\"><span class=\"$icon\"></span></a>";
	}

	public function drawOrderArrow($attribute)
	{
		$arrow = '';
		if ($this->model->orderField == $attribute)
		{
			$arrow = ' <span class="fa '.(($this->model->orderType == 'D') ? 'fa-sort-amount-desc' : 'fa-sort-amount-asc').'"></span>';
		}
		return $arrow;
	}

	public function render($view,$data=null,$return=false)
	{
		$ctrl = $this->getController();
		if(($viewFile=$ctrl->getViewFile($view))!==false)
			return $this->renderFile($viewFile,$data,$return);
		else
			throw new CException(Yii::t('yii','{widget} cannot find the view "{view}".',
				array('{widget}'=>get_class($this), '{view}'=>$view)));
	}
}
