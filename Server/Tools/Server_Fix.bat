@echo off
SET NAME=SPP Updater
TITLE %NAME%
set mainfolder=%CD%

taskkill /f /im realmd.exe
taskkill /f /im mangosd.exe
taskkill /f /im spp-httpd.exe
taskkill /f /im node.exe

:repack
set name=SPP - Classics Collection
set installpath=SPP_Server
set branch=master
cls
echo #########################################################
echo # WARNING!                                              #
echo # All your changes will be undone, including:           #
echo # Server settings, Bot settings, AHBot settings         #
echo # Settings will be copied to Settings_Old folder        #
echo #                                                       #
echo # Still it's better to backup!                          #
echo #########################################################
echo.
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" exit
goto start_restore

:start_restore
cls
if not exist "%mainfolder%\%installpath%\launcher.bat" goto not_installed_error
cd "%mainfolder%\%installpath%"
robocopy Settings Settings_Old /E
..\git\cmd\git.exe reset --hard 5da671e275a5c4b8f432cd55d2d590bed946cdea
ping -n 5 127.0.0.1>nul
cls
echo.
echo  All files are restored.
echo  If you had problems with updating please run Server_Update.bat
echo  to update properly
echo.
echo  Old Settings are copied to Settings_Old folder
echo.
pause
exit

:not_installed_error
cls
echo Looks like %name% repack is not installed.
echo Please use "Server_Update.bat" to install it first.
echo.
more < "%mainfolder%\Git\robo_logo.txt"
pause
goto menu