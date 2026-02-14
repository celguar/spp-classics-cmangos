@echo off
title SPP Classics V2 - AutoSave
set expansion=%1
cd /d "%~dp0..\..\"
set "mainfolder=%CD%"
cd /d "%~dp0"
set "versions=%mainfolder%\Server\Versions"
set curfolder=%CD%

if "%expansion%"=="vanilla" goto setup_vanilla
if "%expansion%"=="tbc" goto setup_tbc
if "%expansion%"=="wotlk" goto setup_wotlk

:setup_vanilla
COLOR 0E

set characters=classiccharacters
set playerbot=classicplayerbots
set world=classicmangos
set login=classicrealmd
set logsdb=classiclogs

set realmserver=realmd.exe
set worldserver=mangosd.exe

goto autosave_start_running

:setup_tbc
COLOR 0A

set characters=tbccharacters
set playerbot=tbcplayerbots
set world=tbcmangos
set login=tbcrealmd
set logsdb=tbclogs

set realmserver=realmd.exe
set worldserver=mangosd.exe

goto autosave_start_running

:setup_wotlk
COLOR 0B

set characters=wotlkcharacters
set playerbot=wotlkplayerbots
set world=wotlkmangos
set login=wotlkrealmd
set logsdb=wotlklogs

set realmserver=realmd.exe
set worldserver=mangosd.exe

goto autosave_start_running

:autosave_start_running
echo.
echo    SPP Classics - AutoSave started at %time%
echo    Will save every 15 minutes while server is running.
echo.
echo    Press 0 to close Auto Save

:autosave_loop
setlocal enabledelayedexpansion
CHOICE /C 01 /T 900 /D 1 /N /M "">nul
set err=!ERRORLEVEL!
IF !err! EQU 1 goto autosave_stop_running

set saveslot=autosave
set "MAX_SAVES=100"
set "SAVES_DIR=autosaves"
set "hour=%time:~0,2%"
set "hour=!hour: =0!"
set "minute=%time:~3,2%"
set "minute=!minute: =0!"
set "TIMESTAMP=%date:~6,4%%date:~3,2%%date:~0,2%_!hour!!minute!"
set "SAVE_PATH=%mainfolder%\Saves\%expansion%\%SAVES_DIR%"
set "SAVE_FOLDER=autosave_%TIMESTAMP%"
set "FULL_SAVE_PATH=%SAVE_PATH%\%SAVE_FOLDER%"

tasklist /FI "IMAGENAME eq !worldserver!" 2>NUL | find /I /N "!worldserver!">NUL
set err2=!ERRORLEVEL!
if !err2! EQU 0 (
mkdir "%SAVE_PATH%" 2>nul
mkdir "%FULL_SAVE_PATH%" 2>nul
"%mainfolder%\Server\Database\bin\mysqldump.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 %login% > "%FULL_SAVE_PATH%\realmd.sql"
"%mainfolder%\Server\Database\bin\mysqldump.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 %characters% > "%FULL_SAVE_PATH%\characters.sql"
echo autosave_%TIMESTAMP%>"%FULL_SAVE_PATH%\name.txt"
xcopy /y "%versions%\%expansion%_chars_version.spp" "%FULL_SAVE_PATH%">nul
xcopy /y "%versions%\%expansion%_realm_version.spp" "%FULL_SAVE_PATH%">nul
if not "%logs_version%"=="0" (
xcopy /y "%versions%\%expansion%_logs_version.spp" "%FULL_SAVE_PATH%">nul
)
xcopy /y "%versions%\%expansion%_bots_version.spp" "%FULL_SAVE_PATH%">nul
xcopy /y "%versions%\%expansion%_website_version.spp" "%FULL_SAVE_PATH%">nul
echo.
echo    Archiving save...
ping -n 1 127.0.0.1>nul
cd %SAVE_PATH%
"%mainfolder%\Server\Tools\7za.exe" a -t7z -mx=3 "%SAVE_PATH%\%SAVE_FOLDER%.7z" "%FULL_SAVE_PATH%">nul
cd %curfolder%
rmdir /s /q "%FULL_SAVE_PATH%" 2>nul
echo.
echo    Removing old saves...
ping -n 1 127.0.0.1>nul
set /a count=0
for /f "delims=" %%f in ('dir "%SAVE_PATH%\autosave_*" /a-d /b /o-d 2^>nul') do (
    set /a count+=1
    if !count! gtr %MAX_SAVES% (
        echo.
        echo    Removing: %%f
        del "%SAVE_PATH%\%%f" 2>nul
        rmdir /s /q "%SAVE_PATH%\%%f" 2>nul
        ping -n 1 127.0.0.1>nul
    )
)
echo.
echo    [!hour!^:!minute!] Auto-save completed.
)

if NOT !err2! EQU 0 (
    goto autosave_stop_running
)
endlocal
goto autosave_loop

:autosave_stop_running
echo    Stopping SPP Classics - Autosave...
ping -n 3 127.0.0.1>nul
exit
