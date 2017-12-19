@echo off

rem -------------------------------------------------------------
rem  Yii command line script for Windows.
rem  This is the bootstrap script for running yiic on Windows.
rem -------------------------------------------------------------

@setlocal

set BIN_PATH=%~dp0

if "%PHP_COMMAND%" == "" set PHP_COMMAND=D:\phpstudy\PHPTutorial\php\php-5.4.45\php.exe

"%PHP_COMMAND%" "%BIN_PATH%yiic.php" %*

@endlocal