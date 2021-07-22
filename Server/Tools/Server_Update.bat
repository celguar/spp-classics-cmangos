@echo off
SET NAME=SingleCore Server Launcher
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
goto install

:install
if exist "%mainfolder%\launcher.bat" goto update_process
cls
echo.
echo  Downloading the base files for the repack...
echo  ~ 350 MB...
echo.
"%mainfolder%\git\cmd\git.exe" clone --depth=1 https://github.com/celguar/spp-classics-cmangos.git %installpath% --branch=%branch%
goto update_process

:update_process
cls
echo.
echo Create local git config file...
echo.
cd "%mainfolder%\%installpath%"
..\git\cmd\git.exe config user.name "SPP User"
..\git\cmd\git.exe config user.email sppuser@spp.com
echo.
echo Add realm settings to git system...
echo.
..\git\cmd\git.exe add Settings
..\git\cmd\git.exe commit -m "Custom Changes"
cls
echo.
echo  Downloading the latest %name% update...
echo.
..\git\cmd\git.exe pull https://github.com/celguar/spp-classics-cmangos.git %branch%
echo.
echo  Update complete!
echo.
echo  Please run Server_Fix.bat ONLY IF you see merge error above.
echo.
ping -n 5 127.0.0.1>nul
cd "%mainfolder%"
copy "%mainfolder%\%installpath%\Server\Tools\Server_Fix.bat" . /Y
copy "%mainfolder%\%installpath%\Server\Tools\Server_Update.bat" . /Y
copy "%mainfolder%\%installpath%\Server\Tools\Server_Start.bat" . /Y
echo.
goto start_server

:start_server
cd "%mainfolder%\SPP_Server"
Launcher.bat
exit