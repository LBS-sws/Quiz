<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/1/10 0010
 * Time: 11:41
 */
Class FileSearch {
    public  function getFiles($path,$child=false){
        $files=array();
        if(!$child){
            if(is_dir($path)){
                $dp = dir($path);
            }else{
                return null;
            }
            while ($file = $dp ->read()){
                if($file !="." && $file !=".." && is_file($path.$file)){
                    $files[] = $file;
                }
            }
            $dp->close();
        }else{
            $this->scanfiles($files,$path);
        }
        return $files;
    }

    public function scanfiles(&$files,$path,$childDir=false){
        $dp = dir($path);
        while ($file = $dp ->read()){
            if($file !="." && $file !=".."){
                if(is_file($path.$file)){//当前为文件
                    $files[]= $file;
                }else{//当前为目录
                    $this->scanfiles($files[$file],$path.$file.DIRECTORY_SEPARATOR,$file);
                }
            }
        }
        $dp->close();
    }
}