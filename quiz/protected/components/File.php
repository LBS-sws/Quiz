<?php
class File extends CApplicationComponent{

/**
* 上传文件中的数组的error对应的错误信息 也就是$_FILES['file']['error']
* http://php.net/manual/zh/features.file-upload.errors.php
* @var array
*/
protected static $errorCodeMsg = array(
1 => '上传的文件超过了php.ini中upload_max_filesize选项内的信息',
2 => '上传文件的大小超过了 HTML 表单中 MAX_FILE_SIZE 选项指定的值',
3 => '文件只有部分被上传',
4 => '没有文件被上传',
6 => '找不到临时文件夹',
7 => '文件写入失败'
);

protected static $units = array(
'b' => 1,
'k' => 1024,
'm' => 1048576,
'g' => 1073741824
);

/**
* 上传类
* @var CUploadedFile
* name 客户端机器文件的原名称 eg: MyFile.txt
* tempName 文件被上传后在服务器端储存的临时文件名 eg:/tmp/php7y1zeX
* type 文件的 MIME 类型 eg:image/png
* size 已上传文件的大小 单位为字节 eg:1097
* error 错误代码 eq:1
* getExtensionName  获取后缀
*/
protected $file;
/**
* 验证数组
* @var array
*/
protected $validate;
/**
* 错误信息数组
* @var array
*/
protected $errors;
/**
* 上传的filename
* @var string
*/
private $_key;
/**
* 上传的地址
* @var string
*/
private $_directory;
/**
* 保存的文件名 没有后缀
* @var string
*/
private $_name;
/**
* 是否覆盖
* @var boolean
*/
public $overwrite = false;
/**
* 限制上传的大小
* @var string
*/
public $allowSize;
/**
*限制上传的类型
* @var array();
*/
public $allowExtensions;

public function init(){
$this->file = CUploadedFile::getInstanceByName($this->_key);
if($this->file === null) {
throw new CException('找不到上传文件');
}
if($this->_directory === null){
$this->_directory = Yii::getPathOfAlias('webroot').DIRECTORY_SEPARATOR.'upload';
}
if($this->allowSize === null){
$this->allowSize = '5m';
}
if($this->allowExtensions === null){
$this->allowExtensions = array('csv');
}else{
if(is_string($this->allowExtensions)){
$this->allowExtensions = array($this->allowExtensions);
}
array_filter($this->allowExtensions,function ($val){
return strtolower($val);
});
}
}
public function setKey($key){
$this->_key = $key;
}

public function setDirectory($directory){
$this->_directory = $directory;
}

public function setName($name){
$this->_name = $name;
}

public function getName(){
if($this->_name === null){
$this->_name = pathinfo($this->file->name,PATHINFO_FILENAME);
}
return $this->_name;
}

public function getFile(){
return $this->file;
}

public function setError($error){
$this->errors[] = $error;
}

public function getError(){
return $this->errors;
}

public function getNameWithExtension(){
return sprintf('%s.%s',$this->getName(),$this->file->getExtensionName());
}

/**
* 验证
*/
public function validate(){
if($this->file->size > $this->humanReadableToBytes($this->allowSize)){
$this->errors[] = '上传的文件不能超过'.$this->allowSize;
}
if(!in_array($this->file->getExtensionName(),$this->allowExtensions)){
$this->errors[] = sprintf('只允许上传%s文件',implode(', ',$this->allowExtensions));
}
if($this->file->error !== UPLOAD_ERR_OK){
$this->errors[] = self::$errorCodeMsg[$this->file->error];
}
if(is_uploaded_file($this->file->tempName) === false){
$this->errors[] = '文件不是通过HTTP POST上传';
}
return empty($this->errors);
}

/*
* 上传
*/
public function upload($newName=null){
if($this->validate() === false){
throw new CException('上传验证失败');
}
if(is_string($newName)){
$this->_name = pathinfo($newName,PATHINFO_FILENAME);
$fileName = strpos($newName,'.') ? $newName : $newName.'.'.$this->file->getExtensionName();
}else{
$fileName = $this->getNameWithExtension();
}
/*if(!is_dir($this->_directory)){
mkdir($this->_directory,0777,true);
chmod($this->_directory,0777);
}*/
$newFile = $this->_directory.DIRECTORY_SEPARATOR.$fileName;
if($this->overwrite === false && file_exists($newFile)){
$this->errors[] = '文件已存在';
throw new CException('文件已存在');
}
return $this->file->saveAs($newFile);
}

public static function humanReadableToBytes($input)
{
$number = (int)$input;
$unit = strtolower(substr($input,-1));
if(isset(self::$units[$unit])){
$number = $number * self::$units[$unit];
}
return $number;
}


}
?>