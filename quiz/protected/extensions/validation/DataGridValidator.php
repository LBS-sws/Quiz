<?php 
/**
 * Original sources and separateParams example:
 * @see http://www.yiiframework.com/extension/array-validator/
 * @author George Pligor <pligor@facebook.com> & Marco van 't Wout, Tremani 2012
 *
 * Example usage:
 *
 * public function rules() {
 *     return array(
 *         array('numberList', 'ArrayValidator', 'validator'=>'numerical', 'params'=>array(
 *             'integerOnly'=>true, 'allowEmpty'=>false
 *         )),
 *     );
 * }
 */
class DataGridValidator extends CValidator
{
	/**
	 * @var string name of the validator class (example: 'numerical' or 'CustomValidator')
	 */
	public $validator;
	public $parent;
	
	/**
	 * @var array parameters passed to the validator class
	 */
	public $params;
	
	/**
	 * @var bool use a separate params array depending on array attribute keys
	 */
	public $separateParams = false;
	
	public $allowEmpty = true;
	/**
	 * @var Object the validator instance
	 */
	protected $validatorObject;
	
	/**
	 * Validates the attribute of the object.
	 * If there is any error, the error message is added to the object.
	 * @param CModel $object the object being validated
	 * @param string $attribute the attribute being validated
	 */
	protected function validateAttribute($object,$attribute)
	{
		$this->validatorObject = self::createValidator($this->validator, $object, '');
/*
		if (!$this->params) {
			$this->setValidatorParams($this->params);
		}
*/
		$parentAttribute = $this->parent;
		$attributeArray = $this->getAttributeNameList($object->$parentAttribute);
		foreach($attributeArray as $attr) {
			if (strpos($attr, $attribute)!==false) {
				$attrList = array();
				$attrList[] = $this->parent + $attr;
				$this->validatorObject->validate($object,$attrList);
			}
		}
	}

	public function clientValidateAttribute($object,$attribute)
	{
		// Since this is copy/pasted from above, it's an obvious candidate
		// for refactoring into a private method. I 'm keeping it simple.
		$validator = self::createValidator(
			$this->validator,
			$object,
			array($attribute),
			$this->parameters);

		$js = '';

		// No need for filtering support here (I think...)
		foreach($value as $key => $item) {
			$object->$attribute = $item;
			$js .= $validator->clientValidateAttribute($object, $attribute);
		}

		return $js;        
	}

	/**
	 * Set parameters for validator.
	 * @param array $params
	 */
	protected function setValidatorParams($params)
	{
		foreach($params as $paramName => $paramValue) {
			$this->validatorObject->$paramName = $paramValue;
		}
	}
	
	protected function getValidationRule($object, $attribute)
	{
		$return = 'safe';
		if (method_exists($object,'rules')) {
			$rules = $object->rules();
			foreach($rules as $rule) {
				if (is_array($rule)) {
					if (strpos($rule[0], $attribute) !== false) {
						$return = $rule[1];
						break;
					}
				}
			}
		}
		return $return;
	}
	
	protected function getAttributeNameList($attributeArray)
	{
		$result = array();
		foreach($attributeArray as $key => $value) {
			if (is_array($value)) {
				$temp = $this->getAttributeNameList($value);
				foreach($temp as $item) {
					$result[] = (is_numeric($key) ? "[" . $key . "]" : "['" . $key . "']") . $item;
				}
			} else {
				$result[] = (is_numeric($key) ? "[" . $key . "]" : "['" . $key . "']");
			}
		}
		return $result;
	}
}