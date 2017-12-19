<?php
class SimpleGridWidget extends CWidget
{
	public $id;
	public $model;
	public $attribute;
	public $showncolumns=array();
	public $hiddencolumns=array();
	public $gridsize='3';
	public $width='100%';
	public $height='100';
	
	public function run()
	{
		$layout = "<div class='grid_".$this->gridsize."' style='height:".$this->height."px;overflow:auto'>";
		$layout .= "<table width=100% cellpadding=0 cellspacing=5>";
		$layout .= $this->genTableHeader();
		$layout .= $this->genTableRows();
		$layout .= "</table>";
		$layout .= "</div>";
		echo $layout;
	}

	protected function genTableHeader()
	{
		$layout = "<tr>";
		$label = $this->model->attributeLabels();
		foreach ($this->showncolumns as $column)
		{
			if (array_key_exists($column, $label))
				$layout.="<th>".$label[$column]."</th>";
			else
				$layout.="<th>".$column."</th>";
		}
		$layout .= "</tr>";
		return $layout;
	}
	
	protected function genTableRows()
	{
		$layout = '';
		$field=$this->attribute;
		$idx = 0;
		foreach ($this->model->$field as $row)
		{
			$layout = "<tr>";
			foreach ($this->hiddencolumns as $column)
			{
				$name = $field.'['.$idx.']['.$column.']';
				$layout .= CHtml::hiddenField($name,$row[$column]);
			}
			foreach ($this->showncolumns as $column)
			{
//				if (($row[$column]==null) || ($row[$column]==''))
//					$layout .= "<td>&nbsp</td>";
//				else
				$name = $field.'['.$idx.']['.$column.']';
				$layout .= "<td>".CHtml::textField($name,$row[$column],array('readonly'=>true))."</td>";
			}
			$layout .= "</tr>";
			$idx++;
		}
		return $layout;
	}
}
