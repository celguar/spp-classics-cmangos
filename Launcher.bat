@echo off
:beginning
SET NAME=SPP - Classics Collection
TITLE %NAME%
set mainfolder=%CD%
set repack_version=2.1.6
set maps_date=06.06.2021
set /a website_version=4

IF NOT EXIST "%mainfolder%\music.on" (
  IF NOT EXIST "%mainfolder%\music.off" (
    echo music > "%mainfolder%\music.on"
  )
)

IF NOT EXIST "%mainfolder%\website.on" (
  IF NOT EXIST "%mainfolder%\website.off" (
    echo music > "%mainfolder%\website.on"
  )
)

if not exist "%mainfolder%\Server\Tools\Apache24" goto install_website
if not exist "%mainfolder%\Server\Tools\Notepad" goto install_notepad
if exist "%mainfolder%\Server\Database" goto beginning_part2
cls
echo.
echo    Preparing for the first launch...
ping -n 2 127.0.0.1>nul
cd "%mainfolder%\Server"
"%mainfolder%\Server\Tools\7za.exe" e -y -spf Database.7z > nul
REM "%mainfolder%\Server\Tools\7za.exe" e -y -spf Database_Playerbot.7z > nul
cd "%mainfolder%"
goto beginning

:install_website
echo.
echo    Extracting Webserver...
echo.
ping -n 3 127.0.0.1>nul
echo    Please, wait...
echo.
cd "%mainfolder%\Server\Tools"
"%mainfolder%\Server\Tools\7za.exe" e -y -spf Apache.7z > nul
cd "%mainfolder%"
echo    Done!
ping -n 3 127.0.0.1>nul
goto beginning

:update_website
mode con: cols=40 lines=30
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    Website update required!
ping -n 3 127.0.0.1>nul
echo.
echo    %current_website_version% ---^> %website_version%
ping -n 3 127.0.0.1>nul
echo.
echo    Please wait...
ping -n 3 127.0.0.1>nul
if exist "%mainfolder%\Server\website" rd /s /q "%mainfolder%\Server\website"
cd "%mainfolder%\Server"
mkdir website
"%mainfolder%\Server\Tools\7za.exe" e -y -spf -o"%mainfolder%\Server\website" website.7z > nul
cd "%mainfolder%"
echo.
echo    Updating Webserver...
ping -n 3 127.0.0.1>nul
echo.
echo    Please, wait...
cd "%mainfolder%\Server\Tools"
"%mainfolder%\Server\Tools\7za.exe" e -y -spf Apache.7z > nul
cd "%mainfolder%"
echo.
echo    Done!
ping -n 3 127.0.0.1>nul
>"%mainfolder%\website_version.spp" echo %website_version%
goto beginning

:install_notepad
echo.
echo    Extracting Notepad++...
echo.
ping -n 3 127.0.0.1>nul
echo    Please, wait...
echo.
cd "%mainfolder%\Server\Tools"
"%mainfolder%\Server\Tools\7za.exe" e -y -spf Notepad.7z > nul
cd "%mainfolder%"
echo    Done!
ping -n 3 127.0.0.1>nul
goto beginning

:beginning_part2
if exist "%mainfolder%\music.on" goto music_start
if exist "%mainfolder%\music.off" goto select_expansion

:music_start
mode con: cols=40 lines=30
tasklist /FI "IMAGENAME eq cmdmp3win.exe" 2>NUL | find /I /N "cmdmp3win.exe">NUL
if "%ERRORLEVEL%"=="0" goto select_expansion
cd "%mainfolder%\Server\Tools"
start cmdmp3win.exe launcher.mp3
cls
echo.
echo  Starting the launcher...
ping -n 2 127.0.0.1>nul
echo  Get ready...
ping -n 3 127.0.0.1>nul
cls
echo.
echo  Starting the launcher...
echo  Get ready...for something nostalgic...
ping -n 3 127.0.0.1>nul
cls
echo.
echo  CREDITS:
echo.
more < "%mainfolder%\credits.txt"
ping -n 9 127.0.0.1>nul
cls
rem echo.
rem echo  List of the active Patrons
rem echo  --------------------------
rem echo.
rem more < "%mainfolder%\patrons.txt"
rem echo.
rem echo  ###################
rem echo  # Thank you guys! #
rem echo  ###################
rem ping -n 9 127.0.0.1>nul
goto select_expansion

:website_start
tasklist /FI "IMAGENAME eq spp-httpd.exe" 2>NUL | find /I /N "spp-httpd.exe">NUL
if "%ERRORLEVEL%"=="0" goto menu
cd "%mainfolder%\Server\Tools\Apache24"
start "" /min "apache_start.bat"
cd "%mainfolder%"
cls
rem more < "%mainfolder%\header_spp.txt"
rem echo.
rem echo    Updating website news!
rem ping -n 1 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < "%mainfolder%\sql\%expansion%\website_news.sql"
rem echo.
rem echo    Done!
rem ping -n 1 127.0.0.1>nul
cls
goto menu

:music_switch
if exist "%mainfolder%\music.on" goto music_off
if exist "%mainfolder%\music.off" goto music_on

:website_switch
if exist "%mainfolder%\website.on" goto website_off
if exist "%mainfolder%\website.off" goto website_on

:music_off
taskkill /f /im cmdmp3win.exe
cls
del "%mainfolder%\music.on"
echo music > "%mainfolder%\music.off"
goto beginning

:music_on
del "%mainfolder%\music.off"
echo music > "%mainfolder%\music.on"
goto beginning

:website_off
taskkill /f /im spp-httpd.exe
cls
del "%mainfolder%\website.on"
echo music > "%mainfolder%\website.off"
goto beginning

:website_on
del "%mainfolder%\website.off"
echo website > "%mainfolder%\website.on"
tasklist /FI "IMAGENAME eq spp-httpd.exe" 2>NUL | find /I /N "spp-httpd.exe">NUL
if "%ERRORLEVEL%"=="0" goto beginning
REM cd "%mainfolder%\Server\Tools\Apache24"
REM start "" /min "apache_start.bat"
REM cd "%mainfolder%"
goto beginning

:select_expansion
endlocal
mode con: cols=40 lines=30
SET NAME=SPP - Classics Collection
TITLE %NAME%
COLOR 0F

set mangos_running=false
tasklist /FI "IMAGENAME eq mangosd.exe" 2>NUL | find /I /N "mangosd.exe">NUL
if "%ERRORLEVEL%"=="0" set mangos_running=true
tasklist /FI "IMAGENAME eq realmd.exe" 2>NUL | find /I /N "realmd.exe">NUL
if "%ERRORLEVEL%"=="0" (if %mangos_running%==false taskkill /f /im realmd.exe)
tasklist /FI "IMAGENAME eq mysqld.exe" 2>NUL | find /I /N "mysqld.exe">NUL
if "%ERRORLEVEL%"=="0" (if %mangos_running%==false "%mainfolder%\Server\Database\bin\mysqladmin.exe" -u root -p123456 --port=3310 shutdown)
tasklist /FI "IMAGENAME eq spp-httpd.exe" 2>NUL | find /I /N "spp-httpd.exe">NUL
if "%ERRORLEVEL%"=="0" (if %mangos_running%==false taskkill /f /im spp-httpd.exe)

rem add message to wait for db shutdown
tasklist /FI "IMAGENAME eq mysqld.exe" 2>NUL | find /I /N "mysqld.exe">NUL
if "%ERRORLEVEL%"=="0" (if %mangos_running%==false (
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    Closing database...
ping -n 3 127.0.0.1>nul
)
)

if exist "%mainfolder%\music.on" set music=ON
if exist "%mainfolder%\music.off" set music=OFF
if exist "%mainfolder%\website.on" set website=ON
if exist "%mainfolder%\website.off" set website=OFF
set module_check_vanilla=Not Installed
set module_check_tbc=Not Installed
set module_check_wotlk=Not Installed
set module_check_cata=Not Installed

if exist "%mainfolder%\Modules\vanilla\dbc" set module_check_vanilla=Installed
if exist "%mainfolder%\Modules\tbc\dbc" set module_check_tbc=Installed
if exist "%mainfolder%\Modules\wotlk\dbc" set module_check_wotlk=Installed
if exist "%mainfolder%\Modules\cata\dbc" set module_check_cata=Installed

for /f "tokens=2 delims=," %%I in (
    'wmic process where "name='mangosd.exe'" get ExecutablePath^,Handle /format:csv ^| find /i "mangosd.exe"'
) do (
if "%%~I"=="%mainfolder%\Server\Binaries\vanilla\Bin64\mangosd.exe" set module_running_vanilla=- [Running]
if "%%~I"=="%mainfolder%\Server\Binaries\tbc\Bin64\mangosd.exe" set module_running_tbc=- [Running]
if "%%~I"=="%mainfolder%\Server\Binaries\wotlk\Bin64\mangosd.exe" set module_running_wotlk=- [Running]
rem if "%%~I"=="%mainfolder%\Server\Binaries\vanilla\Bin64\mangosd.exe" goto setup_vanilla
rem if "%%~I"=="%mainfolder%\Server\Binaries\tbc\Bin64\mangosd.exe" goto setup_tbc
rem if "%%~I"=="%mainfolder%\Server\Binaries\wotlk\Bin64\mangosd.exe" goto setup_wotlk
)

cd "%mainfolder%"

if not exist "%mainfolder%\website_version.spp" goto update_website
set /p current_website_version=<"%mainfolder%\website_version.spp"
set /a "current_website_version=current_website_version"
if %current_website_version% LSS 1 (set /a "current_website_version=1")
if %current_website_version% LSS %website_version% goto update_website

if not exist "%mainfolder%\version.spp" (
echo %repack_version% > "%mainfolder%\version.spp"
goto changelog
)
if exist "%mainfolder%\version.spp" (set /p current_version=<"%mainfolder%\version.spp")
if %current_version% LSS %repack_version% (
echo %repack_version% > "%mainfolder%\version.spp"
goto changelog
)

cls
more < "%mainfolder%\header_spp.txt"
echo.
echo   Choose expansion:
echo.
echo   1 - World of Warcraft
echo.
echo          [%module_check_vanilla%] %module_running_vanilla%
echo.
echo.
echo   2 - The Burning Crusade
echo.
echo          [%module_check_tbc%] %module_running_tbc%
echo.
echo.
echo   3 - Wrath of the Lich King
echo.
echo          [%module_check_wotlk%] %module_running_wotlk%
REM echo 4 - World of Warcraft: Cataclysm               [%module_check_cata%]
echo.
echo   9 - Website [%website%]
echo.
echo   0 - Intro/Music [%music%]
echo.
echo   5 - Service menu
echo.
echo   6 - Changelog             Ver: %repack_version%
echo.
set /P choose_exp=What expansion do you want to play: 
if "%choose_exp%"=="1" (goto setup_vanilla)
if "%choose_exp%"=="2" (goto setup_tbc)
if "%choose_exp%"=="3" (goto setup_wotlk)
REM if "%choose_exp%"=="4" (goto setup_cata)
if "%choose_exp%"=="9" (goto website_switch)
if "%choose_exp%"=="0" (goto music_switch)
if "%choose_exp%"=="5" (goto service_menu)
if "%choose_exp%"=="6" (goto changelog)
if "%choose_exp%"=="" (goto select_expansion)

:setup_vanilla
SET NAME=SPP - Vanilla
TITLE %NAME%
COLOR 0E
set expansion=vanilla

set characters=classiccharacters
set playerbot=classicplayerbots
set world=classicmangos
set login=classicrealmd
set logsdb=classiclogs

set realmserver=realmd.exe
set worldserver=mangosd.exe

set spp_update=vanilla_base
set /a maps_version=1
set /a world_version=4
set /a chars_version=5
set /a realm_version=2
set /a logs_version=1
set /a bots_version=3
set /a website_db_version=2
set /a core_version=4

goto settings

:setup_tbc
SET NAME=SPP - Burning Crusade
TITLE %NAME%
COLOR 0A
set expansion=tbc

set characters=tbccharacters
set playerbot=tbcplayerbots
set world=tbcmangos
set login=tbcrealmd
set logsdb=tbclogs

set realmserver=realmd.exe
set worldserver=mangosd.exe

set spp_update=tbc_base
set /a maps_version=1
set /a world_version=5
set /a chars_version=4
set /a realm_version=2
set /a logs_version=1
set /a bots_version=3
set /a website_db_version=2
set /a core_version=4

goto settings

:setup_wotlk
SET NAME=SPP - WotLK
TITLE %NAME%
COLOR 0B
set expansion=wotlk

set characters=wotlkcharacters
set playerbot=wotlkplayerbots
set world=wotlkmangos
set login=wotlkrealmd
set logsdb=wotlklogs

set realmserver=realmd.exe
set worldserver=mangosd.exe

set spp_update=wotlk_base
set /a maps_version=1
set /a world_version=4
set /a chars_version=3
set /a realm_version=1
set /a logs_version=0
set /a bots_version=3
set /a website_db_version=2
set /a core_version=3

goto settings

cls
REM echo.
REM echo  This expansion is not included yet.
REM echo  Check back later.
REM more < "%mainfolder%\logo_%expansion%.txt"
REM echo.
REM pause
REM goto select_expansion

goto settings

:setup_cata
SET NAME=Single Player Project - Cataclysm
TITLE %NAME%
COLOR 0C
set expansion=cata

set characters=cata_characters
set playerbot=cata_playerbot
set world=cata_world
set login=cata_auth

set realmserver=authserver.exe
set worldserver=worldserver.exe

set spp_update=cata_base

goto settings

:settings
REM if exist "%mainfolder%\music.on" start cmdmp3win.exe install_vanilla.mp3
REM --- Settings ---

set host=127.0.0.1
set port=3310
set user=root
set pass=123456

REM --- Settings ---

:start_database
if not exist "%mainfolder%\Saves\%expansion%\autosave" mkdir "%mainfolder%\Saves\%expansion%\autosave"

IF NOT EXIST "%mainfolder%\autosave.on" (
  IF NOT EXIST "%mainfolder%\autosave.off" (
    echo autosave > "%mainfolder%\autosave.on"
  )
)

IF NOT EXIST "%mainfolder%\website.on" (
  IF NOT EXIST "%mainfolder%\website.off" (
    echo website > "%mainfolder%\website.on"
  )
)

start "" /min "%mainfolder%\Server\Database\start.bat"

if not exist "%mainfolder%\Modules\%expansion%\dbc" del "%mainfolder%\%expansion%_maps_version.spp"

if not exist "%mainfolder%\%spp_update%.spp" goto update_install
if not exist "%mainfolder%\%expansion%_maps_version.spp" goto update_maps
if not exist "%mainfolder%\%expansion%_world_version.spp" goto update_world
if not exist "%mainfolder%\%expansion%_chars_version.spp" goto update_chars
if not exist "%mainfolder%\%expansion%_realm_version.spp" goto update_realm
if not exist "%mainfolder%\%expansion%_logs_version.spp" (if not "%logs_version%"=="0" goto update_logs)
if not exist "%mainfolder%\%expansion%_bots_version.spp" goto update_bots
if not exist "%mainfolder%\%expansion%_website_version.spp" goto install_website_db

set /p current_maps_version=<"%mainfolder%\%expansion%_maps_version.spp"
set /p current_world_version=<"%mainfolder%\%expansion%_world_version.spp"
set /p current_chars_version=<"%mainfolder%\%expansion%_chars_version.spp"
set /p current_realm_version=<"%mainfolder%\%expansion%_realm_version.spp"
set /p current_logs_version=<"%mainfolder%\%expansion%_logs_version.spp"
set /p current_bots_version=<"%mainfolder%\%expansion%_bots_version.spp"
set /p current_website_db_version=<"%mainfolder%\%expansion%_website_version.spp"

rem convert to int
set /a "current_maps_version=current_maps_version"
set /a "current_world_version=current_world_version"
set /a "current_chars_version=current_chars_version"
set /a "current_realm_version=current_realm_version"
set /a "current_logs_version=current_logs_version"
set /a "current_bots_version=current_bots_version"
set /a "current_website_db_version=current_website_db_version"

if %current_maps_version% LSS 1 (set current_maps_version=1)
if %current_world_version% LSS 1 (set current_world_version=1)
if %current_chars_version% LSS 1 (set current_chars_version=1)
if %current_realm_version% LSS 1 (set current_realm_version=1)
if %current_logs_version% LSS 1 (if not "%logs_version%"=="0" set current_logs_version=1)
if %current_bots_version% LSS 1 (set current_bots_version=1)
if %current_website_db_version% LSS 1 (set current_website_db_version=1)

rem echo %current_maps_version% - maps
rem echo %current_world_version% - world
rem echo %current_chars_version% - chars
rem echo %current_bots_version% - bots
rem pause

if %current_maps_version% LSS %maps_version% goto update_maps
if %current_world_version% LSS %world_version% goto update_world
if %current_chars_version% LSS %chars_version% goto update_chars
if %current_realm_version% LSS %realm_version% goto update_realm
if %current_logs_version% LSS %logs_version% (if not "%logs_version%"=="0" goto update_logs)
if %current_bots_version% LSS %bots_version% goto update_bots
if %current_website_db_version% LSS %website_db_version% goto update_website_db

if exist "%mainfolder%\website.on" del "%mainfolder%\Server\website\vanilla.spp"
if exist "%mainfolder%\website.on" del "%mainfolder%\Server\website\tbc.spp"
if exist "%mainfolder%\website.on" del "%mainfolder%\Server\website\wotlk.spp"
if exist "%mainfolder%\website.on" echo %expansion% > "%mainfolder%\Server\website\%expansion%.spp"
if exist "%mainfolder%\website.on" goto website_start

goto menu

:module_not_found
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    The %expansion% module not found
ping -n 2 127.0.0.1>nul
echo    Starting download in 10 seconds...
ping -n 10 127.0.0.1>nul
echo.
if "%choose_exp%"=="1" goto install_module_vanilla
if "%choose_exp%"=="2" goto install_module_tbc
if "%choose_exp%"=="3" goto install_module_wotlk
if "%choose_exp%"=="4" goto install_module_vanilla

:install_module_vanilla
mode con: cols=80 lines=30
echo.
echo    Downloading Vanilla module...(~520 MB)
echo.
"%mainfolder%\Server\Tools\wget.exe" -c -q --show-progress "ftp://207.244.228.248/spp_classics_v2/vanilla.7z" -P "%mainfolder%\Modules"
echo.
echo    Download complete. Checking file...
ping -n 3 127.0.0.1>nul
goto check_modules

:install_module_tbc
mode con: cols=80 lines=30
echo.
echo    Downloading TBC module...(~740 MB)
echo.
"%mainfolder%\Server\Tools\wget.exe" -c -q --show-progress "ftp://207.244.228.248/spp_classics_v2/tbc.7z" -P "%mainfolder%\Modules"
echo.
echo    Download complete. Checking file...
ping -n 3 127.0.0.1>nul
goto check_modules

:install_module_wotlk
mode con: cols=80 lines=30
echo.
echo    Downloading WotLK module...(~1100 MB)
echo.
"%mainfolder%\Server\Tools\wget.exe" -c -q --show-progress "ftp://207.244.228.248/spp_classics_v2/wotlk.7z" -P "%mainfolder%\Modules"
echo.
echo    Download complete. Checking file...
ping -n 3 127.0.0.1>nul
goto check_modules

:check_modules
mode con: cols=40 lines=30
if not exist "%mainfolder%\Modules\%expansion%\maps" (
if not exist "%mainfolder%\Modules\%expansion%.7z" goto module_not_found
cd "%mainfolder%\Modules"
mkdir %expansion%
cd %expansion%
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    Extracting %expansion% module...
ping -n 2 127.0.0.1>nul
echo.
echo    Please, wait...
"%mainfolder%\Server\Tools\7za.exe" e -y -spf "%mainfolder%\Modules\%expansion%.7z" > nul
echo.
echo    Done!
ping -n 3 127.0.0.1>nul
del "%mainfolder%\Modules\%expansion%.7z"
cd "%mainfolder%"
)
if exist "%mainfolder%\Modules\%expansion%\maps" (
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    Existing %expansion% maps found!
ping -n 3 127.0.0.1>nul
echo.
echo    Checking version...
ping -n 3 127.0.0.1>nul
echo.
echo    Please, wait...
rem check file last modified date
FOR /F "TOKENS=2" %%A IN ('WHERE /T "%mainfolder%\Modules\%expansion%\maps:0002035.map"') do (
if "%%A" GEQ "%maps_date%" (
echo.
echo    Existing maps version: OK!
ping -n 3 127.0.0.1>nul
echo.
echo    Skipping download...
ping -n 3 127.0.0.1>nul
)
if "%%A" LSS "%maps_date%" (
echo.
echo    Existing maps version: FAIL!
ping -n 3 127.0.0.1>nul
echo.
echo    NEED: %maps_date% HAVE: %%A
ping -n 3 127.0.0.1>nul
echo.
echo    Resuming download...
ping -n 3 127.0.0.1>nul
goto module_not_found
)
)
)
>"%mainfolder%\%expansion%_maps_version.spp" echo %maps_version%
goto update_install

:extract_worlddb
more < "%mainfolder%\header_spp.txt"
echo.
echo    Extracting world db...
ping -n 3 127.0.0.1>nul
cd "%mainfolder%\sql\%expansion%"
"%mainfolder%\Server\Tools\7za.exe" e -y -spf "%mainfolder%\sql\%expansion%\world.7z" > nul
echo.
echo    Done!
cd "%mainfolder%"
ping -n 2 127.0.0.1>nul
goto update_install

:update_install
mode con: cols=40 lines=30
cls
if not exist "%mainfolder%\%expansion%_maps_version.spp" goto check_modules
if not exist "%mainfolder%\sql\%expansion%\world.sql" goto extract_worlddb
more < "%mainfolder%\header_spp.txt"
echo.
echo    Installing database, please wait...
ping -n 3 127.0.0.1>nul
echo.
echo    Installing world db...
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 < "%mainfolder%\sql\%expansion%\drop_world.sql"
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < "%mainfolder%\sql\%expansion%\world.sql"
rem echo.
echo    Installing characters db...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 < "%mainfolder%\sql\%expansion%\drop_characters.sql"
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%characters% < "%mainfolder%\sql\%expansion%\characters.sql"
rem echo.
echo    Installing logs db...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 < "%mainfolder%\sql\%expansion%\drop_logs.sql"
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%logsdb% < "%mainfolder%\sql\%expansion%\logs.sql"
rem echo.
echo    Installing accounts db...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 < "%mainfolder%\sql\%expansion%\drop_realmd.sql"
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < "%mainfolder%\sql\%expansion%\realmd.sql"
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < "%mainfolder%\sql\%expansion%\realmlist.sql"
rem echo.
echo    Installing playerbot db...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 < "%mainfolder%\sql\%expansion%\drop_playerbot.sql"
for %%i in ("%mainfolder%\sql\%expansion%\playerbot\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\playerbot\*sql" if %%i neq "%mainfolder%\sql\%expansion%\playerbot\*sql" if %%i neq "%mainfolder%\sql\%expansion%\playerbot\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < %%i
echo.
rem echo    Applying world db updates...
rem ping -n 3 127.0.0.1>nul
rem set /a "next_world_version=current_world_version+1"
rem for /l %%x in (%next_world_version%, 1, %world_version%) do (
rem   ping -n 2 127.0.0.1>nul
rem   for %%i in ("%mainfolder%\sql\%expansion%\updates\world\%%x\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\updates\world\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\world\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\world\%%x\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
rem )
echo    Applying world db mods...
ping -n 3 127.0.0.1>nul
for %%i in ("%mainfolder%\sql\%expansion%\world\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\world\*sql" if %%i neq "%mainfolder%\sql\%expansion%\world\*sql" if %%i neq "%mainfolder%\sql\%expansion%\world\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
rem echo.
echo    Applying characters db updates...
ping -n 3 127.0.0.1>nul
set /a "next_chars_version=current_chars_version+1"
for /l %%x in (%next_chars_version%, 1, %chars_version%) do (
   ping -n 2 127.0.0.1>nul
   for %%i in ("%mainfolder%\sql\%expansion%\updates\characters\%%x\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\updates\characters\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\characters\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\characters\%%x\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%characters% < %%i
)
echo    Applying characters db mods...
ping -n 3 127.0.0.1>nul
for %%i in ("%mainfolder%\sql\%expansion%\characters\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\characters\*sql" if %%i neq "%mainfolder%\sql\%expansion%\characters\*sql" if %%i neq "%mainfolder%\sql\%expansion%\characters\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%characters% < %%i
rem echo.
echo    Applying accounts db updates...
ping -n 3 127.0.0.1>nul
set /a "next_realm_version=current_realm_version+1"
for /l %%x in (%next_realm_version%, 1, %realm_version%) do (
   ping -n 2 127.0.0.1>nul
   for %%i in ("%mainfolder%\sql\%expansion%\updates\realmd\%%x\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\updates\realmd\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\realmd\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\realmd\%%x\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < %%i
)
echo    Applying accounts db mods...
ping -n 3 127.0.0.1>nul
for %%i in ("%mainfolder%\sql\%expansion%\realmd\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\realmd\*sql" if %%i neq "%mainfolder%\sql\%expansion%\realmd\*sql" if %%i neq "%mainfolder%\sql\%expansion%\realmd\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < %%i
rem echo.
echo    Applying playerbot db updates...
ping -n 3 127.0.0.1>nul
set /a "next_bots_version=current_bots_version+1"
for /l %%x in (%next_bots_version%, 1, %bots_version%) do (
   ping -n 2 127.0.0.1>nul
   for %%i in ("%mainfolder%\sql\%expansion%\updates\playerbot\%%x\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\updates\playerbot\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\playerbot\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\playerbot\%%x\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < %%i
)
echo.
echo    Updating bots travel paths...
ping -n 3 127.0.0.1>nul
cd "%mainfolder%\sql\%expansion%\playerbot"
"%mainfolder%\Server\Tools\7za.exe" e -y -spf "%mainfolder%\sql\%expansion%\playerbot\nodes_%expansion%.7z" > nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\sql\%expansion%\playerbot\nodes_%expansion%.sql"
del "%mainfolder%\sql\%expansion%\playerbot\nodes_%expansion%.sql"
cd "%mainfolder%"
echo.
echo    Done!
ping -n 3 127.0.0.1>nul
del "%mainfolder%\sql\%expansion%\world.sql"
echo %spp_update% > "%mainfolder%\%spp_update%.spp"
>"%mainfolder%\%expansion%_world_version.spp" echo %world_version%
>"%mainfolder%\%expansion%_chars_version.spp" echo %chars_version%
>"%mainfolder%\%expansion%_realm_version.spp" echo %realm_version%
if not "%logs_version%"=="0" (
>"%mainfolder%\%expansion%_logs_version.spp" echo %logs_version%
)
>"%mainfolder%\%expansion%_bots_version.spp" echo %bots_version%
goto start_database

:update_maps
mode con: cols=40 lines=30
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    Maps update required!
ping -n 3 127.0.0.1>nul
echo.
echo    %current_maps_version% ---^> %maps_version%
ping -n 3 127.0.0.1>nul
echo.
echo    Please wait...
ping -n 3 127.0.0.1>nul
if exist "%mainfolder%\Modules\%expansion%\maps" (
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    Existing %expansion% maps found!
ping -n 3 127.0.0.1>nul
echo.
echo    Checking version...
ping -n 3 127.0.0.1>nul
echo.
echo    Please, wait...
ping -n 3 127.0.0.1>nul
rem check file last modified date
FOR /F "TOKENS=2" %%A IN ('WHERE /T "%mainfolder%\Modules\%expansion%\maps:0002035.map"') do (
if "%%A" GEQ "%maps_date%" (
echo.
echo    Existing maps version: OK!
ping -n 3 127.0.0.1>nul
echo.
echo    Skipping download...
ping -n 3 127.0.0.1>nul
>"%mainfolder%\%expansion%_maps_version.spp" echo %maps_version%
goto start_database
)
if "%%A" LSS "%maps_date%" (
echo.
echo    Existing maps version: FAIL!
ping -n 3 127.0.0.1>nul
echo.
echo    NEED: %maps_date% HAVE: %%A
ping -n 3 127.0.0.1>nul
echo.
echo    Resuming download...
ping -n 3 127.0.0.1>nul
)
)
)
echo.
echo    Downloading %expansion% files...
"%mainfolder%\Server\Tools\wget.exe" -c -q --show-progress "ftp://207.244.228.248/spp_classics_v2/%expansion%.7z" -P "%mainfolder%\Modules"
echo.
echo    Download complete. Checking file...
ping -n 3 127.0.0.1>nul
if not exist "%mainfolder%\Modules\%expansion%.7z" (
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    Module download error
ping -n 3 127.0.0.1>nul
echo.
echo    Please try again...
ping -n 3 127.0.0.1>nul
goto select_expansion
)
rd /s /q "%mainfolder%\Modules\%expansion%"
cd "%mainfolder%\Modules"
mkdir %expansion%
cd %expansion%
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    Extracting %expansion% module...
ping -n 3 127.0.0.1>nul
echo.
echo    Please, wait...
"%mainfolder%\Server\Tools\7za.exe" e -y -spf "%mainfolder%\Modules\%expansion%.7z" > nul
echo.
echo    Done!
ping -n 3 127.0.0.1>nul
del "%mainfolder%\Modules\%expansion%.7z"
cd "%mainfolder%"
>"%mainfolder%\%expansion%_maps_version.spp" echo %maps_version%
goto start_database

:update_world
rem setlocal enableDelayedExpansion
mode con: cols=40 lines=30
REM if "%choose_exp%"=="4" goto menu
del "%mainfolder%\%expansion%_fr.spp"
del "%mainfolder%\%expansion%_de.spp"
del "%mainfolder%\%expansion%_ko.spp"
del "%mainfolder%\%expansion%_ch.spp"
del "%mainfolder%\%expansion%_mx.spp"
del "%mainfolder%\%expansion%_ru.spp"
del "%mainfolder%\%expansion%_tw.spp"
del "%mainfolder%\%expansion%_es.spp"
del "%mainfolder%\%expansion%_fr_re.spp"
del "%mainfolder%\%expansion%_de_re.spp"
del "%mainfolder%\%expansion%_ko_re.spp"
del "%mainfolder%\%expansion%_ch_re.spp"
del "%mainfolder%\%expansion%_mx_re.spp"
del "%mainfolder%\%expansion%_ru_re.spp"
del "%mainfolder%\%expansion%_tw_re.spp"
del "%mainfolder%\%expansion%_es_re.spp"
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    World db update required!
ping -n 3 127.0.0.1>nul
echo.
echo    %current_world_version% ---^> %world_version%
ping -n 3 127.0.0.1>nul
echo.
echo    Please wait...
ping -n 3 127.0.0.1>nul
echo.
echo    Extracting world db...
ping -n 3 127.0.0.1>nul
cd "%mainfolder%\sql\%expansion%"
"%mainfolder%\Server\Tools\7za.exe" e -y -spf "%mainfolder%\sql\%expansion%\world.7z" > nul
cd "%mainfolder%"
echo.
echo    Wiping world db...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 < "%mainfolder%\sql\%expansion%\drop_world.sql"
echo.
echo    Installing world db...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < "%mainfolder%\sql\%expansion%\world.sql"
rem echo    Applying world db updates...
rem ping -n 3 127.0.0.1>nul
rem set /a next_world_version=%current_world_version%+1
rem for /l %%x in (%next_world_version%, 1, %world_version%) do (
rem    ping -n 2 127.0.0.1>nul
rem    for %%i in ("%mainfolder%\sql\%expansion%\updates\world\%%x\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\updates\world\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\world\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\world\%%x\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
rem )
rem for %%i in ("%mainfolder%\sql\%expansion%\updates\world\common\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\updates\world\common\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\world\common\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\world\common\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
echo.
echo    Applying world db mods...
ping -n 3 127.0.0.1>nul
for %%i in ("%mainfolder%\sql\%expansion%\world\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\world\*sql" if %%i neq "%mainfolder%\sql\%expansion%\world\*sql" if %%i neq "%mainfolder%\sql\%expansion%\world\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
echo.
echo    Done!
ping -n 3 127.0.0.1>nul
rem echo.
rem echo    Locales are removed in this process!
rem ping -n 3 127.0.0.1>nul
rem echo    To reinstall use locales menu.
rem ping -n 5 127.0.0.1>nul
del "%mainfolder%\sql\%expansion%\world.sql"
>"%mainfolder%\%expansion%_world_version.spp" echo %world_version%
goto start_database

:reinstall_world_do
mode con: cols=40 lines=30
REM if "%choose_exp%"=="4" goto menu
del "%mainfolder%\%expansion%_fr.spp"
del "%mainfolder%\%expansion%_de.spp"
del "%mainfolder%\%expansion%_ko.spp"
del "%mainfolder%\%expansion%_ch.spp"
del "%mainfolder%\%expansion%_mx.spp"
del "%mainfolder%\%expansion%_ru.spp"
del "%mainfolder%\%expansion%_tw.spp"
del "%mainfolder%\%expansion%_es.spp"
del "%mainfolder%\%expansion%_fr_re.spp"
del "%mainfolder%\%expansion%_de_re.spp"
del "%mainfolder%\%expansion%_ko_re.spp"
del "%mainfolder%\%expansion%_ch_re.spp"
del "%mainfolder%\%expansion%_mx_re.spp"
del "%mainfolder%\%expansion%_ru_re.spp"
del "%mainfolder%\%expansion%_tw_re.spp"
del "%mainfolder%\%expansion%_es_re.spp"
del "%mainfolder%\%expansion%_world_version.spp"
set current_world_version=0
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    Reinstalling world db!
ping -n 3 127.0.0.1>nul
echo.
echo    Please wait...
ping -n 3 127.0.0.1>nul
echo.
echo    Extracting world db...
ping -n 3 127.0.0.1>nul
cd "%mainfolder%\sql\%expansion%"
"%mainfolder%\Server\Tools\7za.exe" e -y -spf "%mainfolder%\sql\%expansion%\world.7z" > nul
cd "%mainfolder%"
echo.
echo    Wiping world db...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 < "%mainfolder%\sql\%expansion%\drop_world.sql"
echo.
echo    Installing world db...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < "%mainfolder%\sql\%expansion%\world.sql"
rem echo.
rem echo    Applying world db updates...
rem ping -n 3 127.0.0.1>nul
rem set /a next_world_version=%current_world_version%+1
rem for /l %%x in (%next_world_version%, 1, %world_version%) do (
rem    ping -n 2 127.0.0.1>nul
rem    for %%i in ("%mainfolder%\sql\%expansion%\updates\world\%%x\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\updates\world\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\world\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\world\%%x\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
rem )
rem for %%i in ("%mainfolder%\sql\%expansion%\updates\world\common\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\updates\world\common\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\world\common\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\world\common\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
echo.
echo    Applying world db mods...
ping -n 3 127.0.0.1>nul
for %%i in ("%mainfolder%\sql\%expansion%\world\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\world\*sql" if %%i neq "%mainfolder%\sql\%expansion%\world\*sql" if %%i neq "%mainfolder%\sql\%expansion%\world\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
echo.
echo    Done!
ping -n 3 127.0.0.1>nul
rem echo.
rem echo    Locales are removed in this process!
rem ping -n 3 127.0.0.1>nul
rem echo    To reinstall use locales menu.
rem ping -n 5 127.0.0.1>nul
del "%mainfolder%\sql\%expansion%\world.sql"
>"%mainfolder%\%expansion%_world_version.spp" echo %world_version%
goto start_database

:update_chars
mode con: cols=40 lines=30
REM if "%choose_exp%"=="4" goto menu
rem set /a current_chars_version=<"%mainfolder%\%expansion%_chars_version.spp"
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    Character db update required!
ping -n 3 127.0.0.1>nul
echo.
echo    %current_chars_version% ---^> %chars_version%
ping -n 3 127.0.0.1>nul
echo.
echo    Please wait...
ping -n 3 127.0.0.1>nul
echo.
echo    Applying characters db updates...
ping -n 3 127.0.0.1>nul
set /a "next_chars_version=current_chars_version+1"
for /l %%x in (%next_chars_version%, 1, %chars_version%) do (
   ping -n 1 127.0.0.1>nul
   for %%i in ("%mainfolder%\sql\%expansion%\updates\characters\%%x\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\updates\characters\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\characters\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\characters\%%x\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%characters% < %%i
)
echo.
echo    Done!
ping -n 3 127.0.0.1>nul
>"%mainfolder%\%expansion%_chars_version.spp" echo %chars_version%
goto start_database

:update_realm
mode con: cols=40 lines=30
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    Accounts db update required!
ping -n 3 127.0.0.1>nul
echo.
echo    %current_realm_version% ---^> %realm_version%
ping -n 3 127.0.0.1>nul
echo.
echo    Please wait...
ping -n 3 127.0.0.1>nul
echo.
echo    Applying accounts db updates...
ping -n 3 127.0.0.1>nul
set /a "next_realm_version=current_realm_version+1"
for /l %%x in (%next_realm_version%, 1, %realm_version%) do (
   ping -n 1 127.0.0.1>nul
   for %%i in ("%mainfolder%\sql\%expansion%\updates\realmd\%%x\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\updates\realmd\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\realmd\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\realmd\%%x\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < %%i
)
echo.
echo    Done!
ping -n 3 127.0.0.1>nul
>"%mainfolder%\%expansion%_realm_version.spp" echo %realm_version%
goto start_database

:update_logs
mode con: cols=40 lines=30
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    Logs db update required!
ping -n 3 127.0.0.1>nul
echo.
echo    %current_logs_version% ---^> %logs_version%
ping -n 3 127.0.0.1>nul
echo.
echo    Please wait...
ping -n 3 127.0.0.1>nul
echo.
echo    Reinstalling logs database...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 < "%mainfolder%\sql\%expansion%\drop_logs.sql"
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%logsdb% < "%mainfolder%\sql\%expansion%\logs.sql"
echo.
echo    Done!
ping -n 3 127.0.0.1>nul
if not "%logs_version%"=="0" (
>"%mainfolder%\%expansion%_logs_version.spp" echo %logs_version%
)
goto start_database

:update_bots
mode con: cols=40 lines=30
REM if "%choose_exp%"=="4" goto menu
rem set /a current_bots_version=<"%mainfolder%\%expansion%_bots_version.spp"
rem if not exist "%mainfolder%\%expansion%_bots_version.spp" (set /a current_bots_version=0)
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    Playerbot db update required!
ping -n 3 127.0.0.1>nul
echo.
echo    %current_bots_version% ---^> %bots_version%
ping -n 3 127.0.0.1>nul
echo.
echo    Please wait...
ping -n 3 127.0.0.1>nul
echo.
echo    Applying playerbot db updates...
ping -n 3 127.0.0.1>nul
set /a "next_bots_version=current_bots_version+1"
for /l %%x in (%next_bots_version%, 1, %bots_version%) do (
   ping -n 1 127.0.0.1>nul
   for %%i in ("%mainfolder%\sql\%expansion%\updates\playerbot\%%x\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\updates\playerbot\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\playerbot\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\playerbot\%%x\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < %%i
)
echo.
echo    Updating bots travel paths...
ping -n 3 127.0.0.1>nul
cd "%mainfolder%\sql\%expansion%\playerbot"
"%mainfolder%\Server\Tools\7za.exe" e -y -spf "%mainfolder%\sql\%expansion%\playerbot\nodes_%expansion%.7z" > nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\sql\%expansion%\playerbot\nodes_%expansion%.sql"
echo.
echo    Done!
ping -n 3 127.0.0.1>nul
del "%mainfolder%\sql\%expansion%\playerbot\nodes_%expansion%.sql"
cd "%mainfolder%"
>"%mainfolder%\%expansion%_bots_version.spp" echo %bots_version%
goto start_database

:install_website_db
mode con: cols=40 lines=30
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    Installing Website db!
ping -n 3 127.0.0.1>nul
echo.
echo    Please wait...
ping -n 3 127.0.0.1>nul
echo.
echo    Extracting Armory db...
ping -n 3 127.0.0.1>nul
echo.
echo    Please wait...
ping -n 3 127.0.0.1>nul
cd "%mainfolder%\sql\%expansion%"
"%mainfolder%\Server\Tools\7za.exe" e -y -spf "%mainfolder%\sql\%expansion%\armory.7z" > nul
cd "%mainfolder%"
echo.
echo    Installing Armory db...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 < "%mainfolder%\sql\%expansion%\armory.sql"
echo.
echo    Installing website tables...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < "%mainfolder%\sql\%expansion%\website.sql"
echo.
echo    Done!
ping -n 3 127.0.0.1>nul
del "%mainfolder%\sql\%expansion%\armory.sql"
cls
>"%mainfolder%\%expansion%_website_version.spp" echo %website_db_version%
goto start_database

:update_website_db
mode con: cols=40 lines=30
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    Website db update required!
ping -n 3 127.0.0.1>nul
echo.
echo    %current_website_db_version% ---^> %website_db_version%
ping -n 3 127.0.0.1>nul
echo.
echo    Please wait...
ping -n 3 127.0.0.1>nul
echo.
echo    Extracting Armory db...
ping -n 3 127.0.0.1>nul
cd "%mainfolder%\sql\%expansion%"
"%mainfolder%\Server\Tools\7za.exe" e -y -spf "%mainfolder%\sql\%expansion%\armory.7z" > nul
echo.
cd "%mainfolder%"
echo    Installing Armory db...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 < "%mainfolder%\sql\%expansion%\armory.sql"
echo.
echo    Installing Website updates...
ping -n 3 127.0.0.1>nul
set /a "next_website_db_version=current_website_db_version+1"
for /l %%x in (%next_website_db_version%, 1, %website_db_version%) do (
   ping -n 1 127.0.0.1>nul
   for %%i in ("%mainfolder%\sql\%expansion%\updates\website\%%x\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\updates\website\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\website\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\website\%%x\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < %%i
)
echo.
echo    Done!
ping -n 3 127.0.0.1>nul
del "%mainfolder%\sql\%expansion%\armory.sql"
>"%mainfolder%\%expansion%_website_version.spp" echo %website_db_version%
goto start_database

:menu
endlocal
mode con: cols=40 lines=30
if "%choose_exp%"=="1" (COLOR 0E)
if "%choose_exp%"=="2" (COLOR 0A)
if "%choose_exp%"=="3" (COLOR 0B)
if exist "%mainfolder%\autosave.on" set autosave=ON
if exist "%mainfolder%\autosave.off" set autosave=OFF
if not exist "%mainfolder%\Saves" mkdir "%mainfolder%\Saves"
if not exist "%mainfolder%\Saves\%expansion%" mkdir "%mainfolder%\Saves\%expansion%"
if not exist "%mainfolder%\Saves\%expansion%\1" mkdir "%mainfolder%\Saves\%expansion%\1"
if not exist "%mainfolder%\Saves\%expansion%\2" mkdir "%mainfolder%\Saves\%expansion%\2"
if not exist "%mainfolder%\Saves\%expansion%\3" mkdir "%mainfolder%\Saves\%expansion%\3"
if not exist "%mainfolder%\Saves\%expansion%\4" mkdir "%mainfolder%\Saves\%expansion%\4"
if not exist "%mainfolder%\Saves\%expansion%\5" mkdir "%mainfolder%\Saves\%expansion%\5"
if not exist "%mainfolder%\Saves\%expansion%\6" mkdir "%mainfolder%\Saves\%expansion%\6"
if not exist "%mainfolder%\Saves\%expansion%\7" mkdir "%mainfolder%\Saves\%expansion%\7"
if not exist "%mainfolder%\Saves\%expansion%\8" mkdir "%mainfolder%\Saves\%expansion%\8"
if not exist "%mainfolder%\Saves\%expansion%\9" mkdir "%mainfolder%\Saves\%expansion%\9"
if not exist "%mainfolder%\Saves\%expansion%\old" mkdir "%mainfolder%\Saves\%expansion%\old"
if not "%choose_exp%"=="1" (if not exist "%mainfolder%\Saves\%expansion%\transfer" mkdir "%mainfolder%\Saves\%expansion%\transfer")
cls
echo ########################################
echo # %NAME%
echo # https://spp-forum.de
echo ########################################
more < "%mainfolder%\logo_%expansion%.txt"
echo.
REM echo 1 - Start servers (Win32)
echo   2 - Start servers (Win64)
echo.
echo   3 - Create game account
echo   4 - Server settings
echo   R - Reset randombots
if "%website%"=="ON" echo   M - Open website
echo.
echo   5 - Save Manager
echo.
echo   7 - Wipe Database
echo.
tasklist /FI "IMAGENAME eq %worldserver%" 2>NUL | find /I /N "%worldserver%">NUL
rem if NOT "%ERRORLEVEL%"=="0" echo   8 - Install locales
rem echo.
tasklist /FI "IMAGENAME eq %worldserver%" 2>NUL | find /I /N "%worldserver%">NUL
if NOT "%ERRORLEVEL%"=="0" echo   9 - Back to expansion selector
echo   0 - Shutdown all servers
echo.
echo    Ver: %repack_version% Core: %core_version% DB: %current_world_version%:%current_chars_version%:%current_realm_version% Web: %current_website_version%
echo.
set /P menu_option=Enter your choice: 
REM if "%menu_option%"=="1" (goto quick_start_servers_x86)
rem if "%menu_option%"=="1" (goto menu)
if "%menu_option%"=="2" (goto quick_start_servers_x64)
if "%menu_option%"=="3" (goto account_tool)
if "%menu_option%"=="4" (goto server_settings)
if "%menu_option%"=="r" (goto bots_menu)
if "%menu_option%"=="R" (goto bots_menu)
if "%menu_option%"=="5" (goto save_menu)
if "%menu_option%"=="7" (goto wipe_db)
if "%menu_option%"=="8" (goto install_locales_pre)
if "%menu_option%"=="9" (goto select_expansion)
if "%menu_option%"=="0" (goto shutdown_servers)
if "%menu_option%"=="m" (goto open_map)
if "%menu_option%"=="M" (goto open_map)
if "%menu_option%"=="" (goto menu)
goto menu

:server_settings
cls
more < "%mainfolder%\header_spp.txt"
more < "%mainfolder%\logo_%expansion%.txt"
echo    -------- Server Settings --------
echo.
echo   MySQL Host: %host%  Port: %port%
echo         User: %user%  Pass: %pass%
echo.
echo   1 - World settings
echo.
echo   2 - Bots settings
echo.
echo   3 - Change server address
echo.
echo   4 - Change realm name
echo.
echo   0 - Go back
echo.
set /P choose_setting=Enter your choice: 
if "%choose_setting%"=="1" (goto world_settings)
if "%choose_setting%"=="2" (goto bots_settings)
if "%choose_setting%"=="3" (goto ip_changer)
if "%choose_setting%"=="4" (goto rename_realm)
if "%choose_setting%"=="0" (goto menu)
if "%choose_setting%"=="" (goto server_settings)
goto server_settings

:world_settings
cls
more < "%mainfolder%\header_spp.txt"
more < "%mainfolder%\logo_%expansion%.txt"
echo.
echo    Opening world settings...
ping -n 2 127.0.0.1>nul
echo.
echo    Edit carefully!
ping -n 2 127.0.0.1>nul
"%mainfolder%\Server\Tools\Notepad\notepad++.exe" "%mainfolder%\Settings\%expansion%\mangosd.conf"
goto menu

:bots_settings
cls
more < "%mainfolder%\header_spp.txt"
more < "%mainfolder%\logo_%expansion%.txt"
echo.
echo    Opening bots settings...
ping -n 2 127.0.0.1>nul
echo.
echo    Edit carefully!
ping -n 2 127.0.0.1>nul
"%mainfolder%\Server\Tools\Notepad\notepad++.exe" "%mainfolder%\Settings\%expansion%\aiplayerbot.conf"
goto menu

:reinstall_world
COLOR 0C
cls
echo ########################################
echo # WARNING!                             #
echo # World Database will be reinstalled!  #
echo # Any custom things will be removed!   #
echo ########################################
echo.
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO menu
tasklist /FI "IMAGENAME eq %realmserver%" 2>NUL | find /I /N "%realmserver%">NUL
if "%ERRORLEVEL%"=="0" taskkill /f /im %realmserver%
tasklist /FI "IMAGENAME eq %worldserver%" 2>NUL | find /I /N "%worldserver%">NUL
if "%ERRORLEVEL%"=="0" taskkill /f /im %worldserver%
goto reinstall_world_do

:open_map
cls
if "%website%"=="OFF" (goto menu)
more < "%mainfolder%\header_spp.txt"
more < "%mainfolder%\logo_%expansion%.txt"
echo.
echo    Opening website
echo    in default browser...
ping -n 3 127.0.0.1>nul
start http://127.0.0.1
goto menu

:bots_menu
cls
more < "%mainfolder%\header_spp.txt"
more < "%mainfolder%\logo_%expansion%.txt"
echo    -------- Bots Reset --------
echo.
echo   1 - Reset Random Bots
echo       - randomise timer
echo       - online bot number
echo.
echo   2 - Delete Random Bots
echo       - Delete all random bots
echo         except for bots who are:
echo         in friends or guild
echo.
echo   3 - Delete ALL Random Bots
echo       - Delete all random bots
echo.
echo   0 - Go back
echo.
set /P bots_option=Enter your choice: 
if "%bots_option%"=="1" (goto reset_bots)
if "%bots_option%"=="2" (goto delete_bots)
if "%bots_option%"=="3" (goto delete_all_bots)
if "%bots_option%"=="0" (goto menu)
if "%bots_option%"=="" (goto bots_menu)
goto menu

:reset_bots
mode con: cols=40 lines=30
COLOR 0C
cls
echo ########################################
echo # WARNING!                             #
echo # All random bots will be reset!       #
echo ########################################
echo.
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO menu
tasklist /FI "IMAGENAME eq %realmserver%" 2>NUL | find /I /N "%realmserver%">NUL
if "%ERRORLEVEL%"=="0" taskkill /f /im %realmserver%
tasklist /FI "IMAGENAME eq %worldserver%" 2>NUL | find /I /N "%worldserver%">NUL
if "%ERRORLEVEL%"=="0" taskkill /f /im %worldserver%
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    Reseting random bots...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\sql\%expansion%\reset_randombots.sql"
echo.
echo    Done!
ping -n 3 127.0.0.1>nul
goto menu

:delete_bots
mode con: cols=40 lines=30
COLOR 0C
cls
echo ########################################
echo # WARNING!                             #
echo # All random bots will be removed!     #
echo #                                      #
echo # Bots in friend/guild will stay!      #
echo ########################################
echo.
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO menu
tasklist /FI "IMAGENAME eq %realmserver%" 2>NUL | find /I /N "%realmserver%">NUL
if "%ERRORLEVEL%"=="0" taskkill /f /im %realmserver%
tasklist /FI "IMAGENAME eq %worldserver%" 2>NUL | find /I /N "%worldserver%">NUL
if "%ERRORLEVEL%"=="0" taskkill /f /im %worldserver%
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    Scheduling deleting random bots...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\sql\%expansion%\reset_randombots.sql"
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\sql\%expansion%\delete_randombots.sql"
echo.
echo    Done!
ping -n 2 127.0.0.1>nul
echo.
echo    On next restart bots will be removed
echo    and new bots will be created
ping -n 5 127.0.0.1>nul
goto menu

:delete_all_bots
mode con: cols=40 lines=30
COLOR 0C
cls
echo ########################################
echo # WARNING!                             #
echo # All random bots will be removed!     #
echo #                                      #
echo # Including those in guilds/friends!   #
echo ########################################
echo.
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO menu
tasklist /FI "IMAGENAME eq %realmserver%" 2>NUL | find /I /N "%realmserver%">NUL
if "%ERRORLEVEL%"=="0" taskkill /f /im %realmserver%
tasklist /FI "IMAGENAME eq %worldserver%" 2>NUL | find /I /N "%worldserver%">NUL
if "%ERRORLEVEL%"=="0" taskkill /f /im %worldserver%
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    Scheduling deleting random bots...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\sql\%expansion%\reset_randombots.sql"
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\sql\%expansion%\delete_all_randombots.sql"
echo.
echo    Done!
ping -n 2 127.0.0.1>nul
echo.
echo    On next restart bots will be removed
echo    and new bots will be created
ping -n 5 127.0.0.1>nul
goto menu

:wipe_db
cls
more < "%mainfolder%\header_spp.txt"
more < "%mainfolder%\logo_%expansion%.txt"
echo    -------- Wipe Database --------
echo.
echo   1 - Wipe World DB
echo     - Reinstall world DB
echo     - Custom spawns or items
echo       will be removed
echo.
echo   2 - Wipe Characters DB
echo     - Wipe all characters
echo       including bot chars
echo.
echo   3 - Wipe Chars and Accs
echo     - Wipe all characters
echo       and accounts
echo.
echo   0 - Go back
echo.
set /P choose_setting=Enter your choice: 
if "%choose_setting%"=="1" (goto reinstall_world)
if "%choose_setting%"=="2" (goto clear_characters)
if "%choose_setting%"=="3" (goto clear_characcs)
if "%choose_setting%"=="0" (goto menu)
if "%choose_setting%"=="" (goto menu)
goto menu

:clear_characters
mode con: cols=40 lines=30
COLOR 0C
cls
echo ########################################
echo # WARNING!                             #
echo # All characters and bots              #
echo # will be removed !!!                  #
echo ########################################
echo.
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO menu
tasklist /FI "IMAGENAME eq %realmserver%" 2>NUL | find /I /N "%realmserver%">NUL
if "%ERRORLEVEL%"=="0" taskkill /f /im %realmserver%
tasklist /FI "IMAGENAME eq %worldserver%" 2>NUL | find /I /N "%worldserver%">NUL
if "%ERRORLEVEL%"=="0" taskkill /f /im %worldserver%
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    Wiping characters and bots...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 < "%mainfolder%\sql\%expansion%\drop_characters.sql"
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 < "%mainfolder%\sql\%expansion%\drop_playerbot.sql"
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 < "%mainfolder%\sql\%expansion%\drop_logs.sql"
echo.
echo    Reinstalling characters db...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%characters% < "%mainfolder%\sql\%expansion%\characters.sql"
echo.
echo    Reinstalling logs db...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%logsdb% < "%mainfolder%\sql\%expansion%\logs.sql"
echo.
echo    Reinstalling bots db...
ping -n 3 127.0.0.1>nul
for %%i in ("%mainfolder%\sql\%expansion%\playerbot\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\playerbot\*sql" if %%i neq "%mainfolder%\sql\%expansion%\playerbot\*sql" if %%i neq "%mainfolder%\sql\%expansion%\playerbot\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < %%i
echo.
echo    Applying characters db updates...
ping -n 3 127.0.0.1>nul
set /a "next_chars_version=1"
for /l %%x in (%next_chars_version%, 1, %chars_version%) do (
   ping -n 2 127.0.0.1>nul
   for %%i in ("%mainfolder%\sql\%expansion%\updates\characters\%%x\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\updates\characters\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\characters\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\characters\%%x\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%characters% < %%i
)
echo    Applying characters db mods...
ping -n 3 127.0.0.1>nul
for %%i in ("%mainfolder%\sql\%expansion%\characters\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\characters\*sql" if %%i neq "%mainfolder%\sql\%expansion%\characters\*sql" if %%i neq "%mainfolder%\sql\%expansion%\characters\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%characters% < %%i
rem echo.
echo    Applying playerbot db updates...
ping -n 3 127.0.0.1>nul
set /a "next_bots_version=1"
for /l %%x in (%next_bots_version%, 1, %bots_version%) do (
   ping -n 2 127.0.0.1>nul
   for %%i in ("%mainfolder%\sql\%expansion%\updates\playerbot\%%x\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\updates\playerbot\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\playerbot\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\playerbot\%%x\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < %%i
)
echo.
echo    Updating bots travel paths...
ping -n 3 127.0.0.1>nul
cd "%mainfolder%\sql\%expansion%\playerbot"
"%mainfolder%\Server\Tools\7za.exe" e -y -spf "%mainfolder%\sql\%expansion%\playerbot\nodes_%expansion%.7z" > nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\sql\%expansion%\playerbot\nodes_%expansion%.sql"
del "%mainfolder%\sql\%expansion%\playerbot\nodes_%expansion%.sql"
cd "%mainfolder%"
echo.
echo    Done!
ping -n 3 127.0.0.1>nul
goto menu

:clear_characcs
mode con: cols=40 lines=30
COLOR 0C
cls
echo ########################################
echo # WARNING!                             #
echo # All characters and accounts          #
echo # will be removed !!!                  #
echo ########################################
echo.
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO menu
tasklist /FI "IMAGENAME eq %realmserver%" 2>NUL | find /I /N "%realmserver%">NUL
if "%ERRORLEVEL%"=="0" taskkill /f /im %realmserver%
tasklist /FI "IMAGENAME eq %worldserver%" 2>NUL | find /I /N "%worldserver%">NUL
if "%ERRORLEVEL%"=="0" taskkill /f /im %worldserver%
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    Wiping characters and bots...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 < "%mainfolder%\sql\%expansion%\drop_characters.sql"
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 < "%mainfolder%\sql\%expansion%\drop_playerbot.sql"
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 < "%mainfolder%\sql\%expansion%\drop_realmd.sql"
echo.
echo    Reinstalling characters db...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%characters% < "%mainfolder%\sql\%expansion%\characters.sql"
echo.
echo    Reinstalling accounts db...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < "%mainfolder%\sql\%expansion%\realmd.sql"
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < "%mainfolder%\sql\%expansion%\realmlist.sql"
echo.
echo    Reinstalling logs db...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%logsdb% < "%mainfolder%\sql\%expansion%\logs.sql"
echo.
echo    Reinstalling bots db...
ping -n 3 127.0.0.1>nul
for %%i in ("%mainfolder%\sql\%expansion%\playerbot\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\playerbot\*sql" if %%i neq "%mainfolder%\sql\%expansion%\playerbot\*sql" if %%i neq "%mainfolder%\sql\%expansion%\playerbot\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < %%i
echo.
echo    Applying characters db updates...
ping -n 3 127.0.0.1>nul
set /a "next_chars_version=1"
for /l %%x in (%next_chars_version%, 1, %chars_version%) do (
   ping -n 2 127.0.0.1>nul
   for %%i in ("%mainfolder%\sql\%expansion%\updates\characters\%%x\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\updates\characters\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\characters\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\characters\%%x\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%characters% < %%i
)
echo    Applying characters db mods...
ping -n 3 127.0.0.1>nul
for %%i in ("%mainfolder%\sql\%expansion%\characters\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\characters\*sql" if %%i neq "%mainfolder%\sql\%expansion%\characters\*sql" if %%i neq "%mainfolder%\sql\%expansion%\characters\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%characters% < %%i
echo    Applying accounts db updates...
ping -n 3 127.0.0.1>nul
set /a "next_realm_version=1"
for /l %%x in (%next_realm_version%, 1, %realm_version%) do (
   ping -n 2 127.0.0.1>nul
   for %%i in ("%mainfolder%\sql\%expansion%\updates\realmd\%%x\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\updates\realmd\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\realmd\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\realmd\%%x\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < %%i
)
echo    Applying accounts db mods...
ping -n 3 127.0.0.1>nul
for %%i in ("%mainfolder%\sql\%expansion%\realmd\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\realmd\*sql" if %%i neq "%mainfolder%\sql\%expansion%\realmd\*sql" if %%i neq "%mainfolder%\sql\%expansion%\realmd\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < %%i
echo    Applying playerbot db updates...
ping -n 3 127.0.0.1>nul
set /a "next_bots_version=1"
for /l %%x in (%next_bots_version%, 1, %bots_version%) do (
   ping -n 2 127.0.0.1>nul
   for %%i in ("%mainfolder%\sql\%expansion%\updates\playerbot\%%x\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\updates\playerbot\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\playerbot\%%x\*sql" if %%i neq "%mainfolder%\sql\%expansion%\updates\playerbot\%%x\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < %%i
)
echo.
echo    Updating bots travel paths...
ping -n 3 127.0.0.1>nul
cd "%mainfolder%\sql\%expansion%\playerbot"
"%mainfolder%\Server\Tools\7za.exe" e -y -spf "%mainfolder%\sql\%expansion%\playerbot\nodes_%expansion%.7z" > nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\sql\%expansion%\playerbot\nodes_%expansion%.sql"
del "%mainfolder%\sql\%expansion%\playerbot\nodes_%expansion%.sql"
cd "%mainfolder%"
echo.
echo    Installing website tables...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < "%mainfolder%\sql\%expansion%\website.sql"
echo.
echo    Done!
ping -n 3 127.0.0.1>nul
goto menu

:ip_changer
set /p current_ip=<"%mainfolder%\Settings\%expansion%\address.txt"
set /p current_name=<"%mainfolder%\Settings\%expansion%\name.txt"
cls
if "%current_ip%"=="" set current_ip=127.0.0.1
more < "%mainfolder%\header_spp.txt"
echo.
echo    Current address:
echo    %current_ip%
echo.
set /P setip=Enter new address (X to cancel):
if "%setip%"=="" goto menu
if "%setip%"=="x" goto menu
if "%setip%"=="X" goto menu
echo %setip% > "%mainfolder%\Settings\%expansion%\address.txt"
set realmlist_address=UPDATE `realmlist` SET `address`='%setip%' WHERE  `id`=1;UPDATE `realmlist` SET `name`='%current_name%' WHERE  `id`=1;
echo.
echo    Saving new address...
ping -n 3 127.0.0.1>nul
echo %realmlist_address%>"%mainfolder%\sql\%expansion%\realmlist.sql"
echo.
echo    Applying new address...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < "%mainfolder%\sql\%expansion%\realmlist.sql"
echo.
echo    Address changed to:
echo    %setip%
echo.
ping -n 5 127.0.0.1>nul
goto menu

:rename_realm
set /p current_ip=<"%mainfolder%\Settings\%expansion%\address.txt"
set /p current_name=<"%mainfolder%\Settings\%expansion%\name.txt"
if "%current_ip%"=="" set current_ip=127.0.0.1
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    Current name:
echo    %current_name%
echo.
set /P setname=Enter new realm name (X to cancel):
if "%setname%"=="" goto menu
if "%setname%"=="x" goto menu
if "%setname%"=="X" goto menu
echo %setname% > "%mainfolder%\Settings\%expansion%\name.txt"
set realmlist_address=UPDATE `realmlist` SET `address`='%current_ip%' WHERE  `id`=1;UPDATE `realmlist` SET `name`='%setname%' WHERE  `id`=1;
echo.
echo    Saving new realm name...
ping -n 3 127.0.0.1>nul
echo %realmlist_address%>"%mainfolder%\sql\%expansion%\realmlist.sql"
echo.
echo    Applying new realm name...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < "%mainfolder%\sql\%expansion%\realmlist.sql"
echo.
echo    Realm name changed to:
echo    %setname%
echo.
ping -n 5 127.0.0.1>nul
goto menu

:install_locales_pre
cls
set locFR= 
set locES= 
set locDE= 
set locKO= 
set locCH= 
set locTW= 
set locRU= 
set locMX= 
set loc_replace=NO

:install_locales
cls
set lo_fields=NO
set lo_fr=Not Installed
set lo_es=Not Installed
set lo_de=Not Installed
set lo_ko=Not Installed
set lo_ch=Not Installed
set lo_tw=Not Installed
set lo_ru=Not Installed
set lo_mx=Not Installed

if exist "%mainfolder%\%expansion%_locale_fields.spp" set lo_fields=YES

if exist "%mainfolder%\%expansion%_fr.spp" set lo_fr=Installed
if exist "%mainfolder%\%expansion%_es.spp" set lo_es=Installed
if exist "%mainfolder%\%expansion%_de.spp" set lo_de=Installed
if exist "%mainfolder%\%expansion%_ko.spp" set lo_ko=Installed
if exist "%mainfolder%\%expansion%_ch.spp" set lo_ch=Installed
if exist "%mainfolder%\%expansion%_tw.spp" set lo_tw=Installed
if exist "%mainfolder%\%expansion%_ru.spp" set lo_ru=Installed
if exist "%mainfolder%\%expansion%_mx.spp" set lo_mx=Installed

if exist "%mainfolder%\%expansion%_fr_re.spp" set lo_fr=ENG replaced
if exist "%mainfolder%\%expansion%_es_re.spp" set lo_es=ENG replaced
if exist "%mainfolder%\%expansion%_de_re.spp" set lo_de=ENG replaced
if exist "%mainfolder%\%expansion%_ko_re.spp" set lo_ko=ENG replaced
if exist "%mainfolder%\%expansion%_ch_re.spp" set lo_ch=ENG replaced
if exist "%mainfolder%\%expansion%_tw_re.spp" set lo_tw=ENG replaced
if exist "%mainfolder%\%expansion%_ru_re.spp" set lo_ru=ENG replaced
if exist "%mainfolder%\%expansion%_mx_re.spp" set lo_mx=ENG replaced

set loc_already_replaced=NO
if exist "%mainfolder%\%expansion%_fr_re.spp" set loc_already_replaced=YES
if exist "%mainfolder%\%expansion%_es_re.spp" set loc_already_replaced=YES
if exist "%mainfolder%\%expansion%_de_re.spp" set loc_already_replaced=YES
if exist "%mainfolder%\%expansion%_ko_re.spp" set loc_already_replaced=YES
if exist "%mainfolder%\%expansion%_ch_re.spp" set loc_already_replaced=YES
if exist "%mainfolder%\%expansion%_tw_re.spp" set loc_already_replaced=YES
if exist "%mainfolder%\%expansion%_ru_re.spp" set loc_already_replaced=YES
if exist "%mainfolder%\%expansion%_mx_re.spp" set loc_already_replaced=YES

more < "%mainfolder%\header_locale.txt"
echo.
echo    Choose locales :
echo.
echo    F - French       (%locFR%) [%lo_fr%]
echo    G - German       (%locDE%) [%lo_de%]
echo    R - Russian      (%locRU%) [%lo_ru%]
echo    C - Chinese      (%locCH%) [%lo_ch%]
echo    T - Taiwanese    (%locTW%) [%lo_tw%]
echo    S - Spanish      (%locES%) [%lo_es%]
echo    M - Spanish (SA) (%locMX%) [%lo_mx%]
echo    K - Korean       (%locKO%) [%lo_ko%]
echo.
echo    P - Replace English        [%loc_replace%]
echo    Note: Only one can replace english!
echo.
if %loc_already_replaced% == YES echo    O - Restore English
if %loc_already_replaced% == YES echo.
echo        N - Install selected
echo        X - Go back
echo.
set /p activity=Select locales to install:
if %activity% == F goto ToggleLocFR:
if %activity% == f goto ToggleLocFR:
if %activity% == G goto ToggleLocDE:
if %activity% == g goto ToggleLocDE:
if %activity% == R goto ToggleLocRU:
if %activity% == r goto ToggleLocRU:
if %activity% == T goto ToggleLocTW:
if %activity% == t goto ToggleLocTW:
if %activity% == C goto ToggleLocCH:
if %activity% == c goto ToggleLocCH:
if %activity% == M goto ToggleLocMX:
if %activity% == m goto ToggleLocMX:
if %activity% == S goto ToggleLocES:
if %activity% == s goto ToggleLocES:
if %activity% == K goto ToggleLocKO:
if %activity% == k goto ToggleLocKO:
if %activity% == P goto ToggleRe:
if %activity% == p goto ToggleRe:
if %activity% == o goto restore_locale:
if %activity% == O goto restore_locale:
if %activity% == N goto install_locales_go
if %activity% == n goto install_locales_go
if %activity% == X goto menu
if %activity% == x goto menu
goto install_locales

:ToggleRe
if %loc_replace% == NO goto ToggleReNo:
if %loc_replace% == YES goto ToggleReYes:
goto install_locales

:ToggleReNo
set loc_replace=YES
goto install_locales

:ToggleReYes
set loc_replace=NO
goto install_locales

:ToggleLocFR
if not "%locFR%" == "%locFR: =%" goto ToggleLocFRNo:
if %locFR% == X goto ToggleLocFRYes:
goto install_locales

:ToggleLocFRNo
set locFR=X
goto install_locales

:ToggleLocFRYes
set locFR= 
goto install_locales

:ToggleLocCH
if not "%locCH%" == "%locCH: =%" goto ToggleLocCHNo:
if %locCH% == X goto ToggleLocCHYes:
goto install_locales

:ToggleLocCHNo
set locCH=X
goto install_locales

:ToggleLocCHYes
set locCH= 
goto install_locales

:ToggleLocTW
if not "%locTW%" == "%locTW: =%" goto ToggleLocTWNo:
if %locTW% == X goto ToggleLocTWYes:
goto install_locales

:ToggleLocTWNo
set locTW=X
goto install_locales

:ToggleLocTWYes
set locTW= 
goto install_locales

:ToggleLocDE
if not "%locDE%" == "%locDE: =%" goto ToggleLocDENo:
goto install_locales

:ToggleLocDENo
set locDE=X
goto install_locales

:ToggleLocDEYes
set locDE= 
goto install_locales

:ToggleLocES
if not "%locES%" == "%locES: =%" goto ToggleLocESNo:
if %locES% == X goto ToggleLocESYes:
goto install_locales

:ToggleLocESNo
set locES=X
goto install_locales

:ToggleLocESYes
set locES= 
goto install_locales

:ToggleLocMX
if not "%locMX%" == "%locMX: =%" goto ToggleLocMXNo:
if %locMX% == X goto ToggleLocMXYes:
goto install_locales

:ToggleLocMXNo
set locMX=X
goto install_locales

:ToggleLocMXYes
set locMX= 
goto install_locales

:ToggleLocRU
if not "%locRU%" == "%locRU: =%" goto ToggleLocRUNo:
if %locRU% == X goto ToggleLocRUYes:
goto install_locales

:ToggleLocRUNo
set locRU=X
goto install_locales

:ToggleLocRUYes
set locRU= 
goto install_locales

:ToggleLocKO
if not "%locKO%" == "%locKO: =%" goto ToggleLocKONo:
if %locKO% == X goto ToggleLocKOYes:
goto install_locales

:ToggleLocKONo
set locKO=X
goto install_locales

:ToggleLocKOYes
set locKO= 
goto install_locales

:install_locales_go
cls
more < "%mainfolder%\header_locale.txt"
echo.
echo    Extracting locales...
ping -n 3 127.0.0.1>nul
echo.
echo    Please wait...
cd "%mainfolder%\sql\%expansion%"
"%mainfolder%\Server\Tools\7za.exe" e -y -spf "%mainfolder%\sql\%expansion%\locales.7z" > nul
cd "%mainfolder%"
ping -n 3 127.0.0.1>nul
echo.
echo    Preparing %expansion% DB...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < "%mainfolder%\sql\%expansion%\locales\prepare.sql"
echo.
echo    Installing text locales...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < "%mainfolder%\sql\%expansion%\locales\BroadcastTextLocales.sql"

ping -n 3 127.0.0.1>nul
if %loc_replace% == YES goto locales_replace_1

:locales_continue

:WorldDB
if "%locFR%" == "X" goto LoadFR:

:WorldDB1
if "%locDE%" == "X" goto LoadDE:

:WorldDB2
if "%locKO%" == "X" goto LoadKO:

:WorldDB3
if "%locCH%" == "X" goto LoadCH:

:WorldDB4
if "%locTW%" == "X" goto LoadTW:

:WorldDB5
if "%locES%" == "X" goto LoadES:

:WorldDB6
if "%locMX%" == "X" goto LoadMX:

:WorldDB7
if "%locRU%"== "X" goto LoadRU:

:locales_end
cls
more < "%mainfolder%\header_locale.txt"
echo.
echo    Locales installed!
ping -n 3 127.0.0.1>nul
echo.
echo    Removing temp files...
rd /s /q "%mainfolder%\sql\%expansion%\locales"
ping -n 3 127.0.0.1>nul
echo.
echo    Done!
ping -n 3 127.0.0.1>nul
echo.
goto menu

:LoadFR
set cur_loc=fr
echo.
echo    Installing French Locale...
for %%i in ("%mainfolder%\sql\%expansion%\locales\French\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\locales\French\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\French\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\French\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
echo %expansion% > "%mainfolder%\%expansion%_fr.spp"
ping -n 2 127.0.0.1>nul
if %loc_replace% == YES goto locales_replace_2
goto WorldDB1:

:LoadDE
set cur_loc=de
echo.
echo    Installing German Locale...
for %%i in ("%mainfolder%\sql\%expansion%\locales\German\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\locales\German\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\German\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\German\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
echo %expansion% > "%mainfolder%\%expansion%_de.spp"
ping -n 2 127.0.0.1>nul
if %loc_replace% == YES goto locales_replace_2
goto WorldDB2:

:LoadKO
set cur_loc=ko
echo.
echo    Installing Korean Locale...
for %%i in ("%mainfolder%\sql\%expansion%\locales\Korean\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\locales\Korean\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\Korean\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\Korean\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
echo %expansion% > "%mainfolder%\%expansion%_ko.spp"
ping -n 2 127.0.0.1>nul
if %loc_replace% == YES goto locales_replace_2
goto WorldDB3:

:LoadCH
set cur_loc=ch
echo.
echo    Installing Chinese Locale...
for %%i in ("%mainfolder%\sql\%expansion%\locales\Chinese\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\locales\Chinese\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\Chinese\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\Chinese\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
echo %expansion% > "%mainfolder%\%expansion%_ch.spp"
ping -n 2 127.0.0.1>nul
if %loc_replace% == YES goto locales_replace_2
goto WorldDB4:

:LoadTW
set cur_loc=tw
echo.
echo    Installing Taiwanese Locale...
for %%i in ("%mainfolder%\sql\%expansion%\locales\Taiwanese\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\locales\Taiwanese\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\Taiwanese\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\Taiwanese\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
echo %expansion% > "%mainfolder%\%expansion%_tw.spp"
ping -n 2 127.0.0.1>nul
if %loc_replace% == YES goto locales_replace_2
goto WorldDB5:

:LoadES
set cur_loc=es
echo.
echo    Installing Spanish Locale...
for %%i in ("%mainfolder%\sql\%expansion%\locales\Spanish\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\locales\Spanish\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\Spanish\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\Spanish\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
echo %expansion% > "%mainfolder%\%expansion%_es.spp"
ping -n 2 127.0.0.1>nul
if %loc_replace% == YES goto locales_replace_2
goto WorldDB6:

:LoadMX
set cur_loc=mx
echo.
echo    Installing Spanish (SA) Locale...
for %%i in ("%mainfolder%\sql\%expansion%\locales\Spanish_South_American\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\locales\Spanish_South_American\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\Spanish_South_American\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\Spanish_South_American\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
echo %expansion% > "%mainfolder%\%expansion%_mx.spp"
ping -n 2 127.0.0.1>nul
if %loc_replace% == YES goto locales_replace_2
goto WorldDB7:

:LoadRU
set cur_loc=ru
echo.
echo    Installing Russian Locale...
for %%i in ("%mainfolder%\sql\%expansion%\locales\Russian\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\locales\Russian\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\Russian\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\Russian\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
echo %expansion% > "%mainfolder%\%expansion%_ru.spp"
ping -n 2 127.0.0.1>nul
if %loc_replace% == YES goto locales_replace_2
goto locales_end

:locales_replace_1
echo.
if %loc_already_replaced% == NO echo    Backing up English locale...
if %loc_already_replaced% == NO ping -n 3 127.0.0.1>nul
if %lo_fields% == NO ("%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < "%mainfolder%\sql\%expansion%\locales\add_fields.sql")
if %lo_fields% == NO (echo %expansion% > "%mainfolder%\%expansion%_locale_fields.spp")
set lo_fields = YES
if %loc_already_replaced% == NO ping -n 3 127.0.0.1>nul
if %loc_already_replaced% == NO "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < "%mainfolder%\sql\%expansion%\locales\save_english.sql"
if exist "%mainfolder%\%expansion%_fr_re.spp" del "%mainfolder%\%expansion%_fr_re.spp"
if exist "%mainfolder%\%expansion%_de_re.spp" del "%mainfolder%\%expansion%_de_re.spp"
if exist "%mainfolder%\%expansion%_ko_re.spp" del "%mainfolder%\%expansion%_ko_re.spp"
if exist "%mainfolder%\%expansion%_ch_re.spp" del "%mainfolder%\%expansion%_ch_re.spp"
if exist "%mainfolder%\%expansion%_mx_re.spp" del "%mainfolder%\%expansion%_mx_re.spp"
if exist "%mainfolder%\%expansion%_ru_re.spp" del "%mainfolder%\%expansion%_ru_re.spp"
if exist "%mainfolder%\%expansion%_tw_re.spp" del "%mainfolder%\%expansion%_tw_re.spp"
if exist "%mainfolder%\%expansion%_es_re.spp" del "%mainfolder%\%expansion%_es_re.spp"
REM cls
REM more < "%mainfolder%\header_locale.txt"
goto locales_continue

:locales_replace_2
echo.
echo    Replacing English locale...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < "%mainfolder%\sql\%expansion%\locales\replace_%cur_loc%.sql"
echo.
echo    Done!
ping -n 3 127.0.0.1>nul
echo %expansion% > "%mainfolder%\%expansion%_%cur_loc%_re.spp"
if %cur_loc% == fr goto WorldDB1:
if %cur_loc% == de goto WorldDB2:
if %cur_loc% == ko goto WorldDB3:
if %cur_loc% == ch goto WorldDB4:
if %cur_loc% == tw goto WorldDB5:
if %cur_loc% == es goto WorldDB6:
if %cur_loc% == mx goto WorldDB7:
if %cur_loc% == ru goto locales_end
goto install_locales

:restore_locale
cls
more < "%mainfolder%\header_locale.txt"
echo.
echo    Extracting locales...
ping -n 3 127.0.0.1>nul
echo.
echo    Please wait...
cd "%mainfolder%\sql\%expansion%"
"%mainfolder%\Server\Tools\7za.exe" e -y -spf "%mainfolder%\sql\%expansion%\locales.7z" > nul
cd "%mainfolder%"
ping -n 3 127.0.0.1>nul
echo.
echo    Restoring English locale...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < "%mainfolder%\sql\%expansion%\locales\load_english.sql"
echo.
echo    Done!
ping -n 3 127.0.0.1>nul
del "%mainfolder%\%expansion%_fr_re.spp"
del "%mainfolder%\%expansion%_de_re.spp"
del "%mainfolder%\%expansion%_ko_re.spp"
del "%mainfolder%\%expansion%_ch_re.spp"
del "%mainfolder%\%expansion%_mx_re.spp"
del "%mainfolder%\%expansion%_ru_re.spp"
del "%mainfolder%\%expansion%_tw_re.spp"
del "%mainfolder%\%expansion%_es_re.spp"
goto locales_end

:quick_start_servers_x86
taskkill /f /im cmdmp3win.exe
cls
set serverstartoption=1
set /p realmname1=<"%mainfolder%\Settings\%expansion%\name.txt"
echo ########################################
echo # %NAME%
echo # https://spp-forum.de
echo ########################################
echo.
echo  Starting the first realm...
echo.
echo  %realmname1%
echo.
ping -n 5 127.0.0.1>nul
goto check_autosave_start

:quick_start_servers_x64
taskkill /f /im cmdmp3win.exe
cls
set serverstartoption=2
set /p realmname1=<"%mainfolder%\Settings\%expansion%\name.txt"
more < "%mainfolder%\header_spp.txt"
echo.
echo    Starting %expansion% realm...
echo.
echo    %realmname1%
echo.
ping -n 5 127.0.0.1>nul
goto check_autosave_start

:check_autosave_start
if exist "%mainfolder%\autosave.on" goto autosave_start
if "%serverstartoption%"=="1" (goto server_x86)
if "%serverstartoption%"=="2" (goto server_x64)
goto menu

:autosave_start
cls
set saveslot=autosave
more < "%mainfolder%\header_spp.txt"
echo.
echo           Autosave is on!
echo.
echo    Exporting accounts...
ping -n 1 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysqldump.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 %login% > "%mainfolder%\Saves\%expansion%\%saveslot%\realmd.sql"
echo.
echo    Done!
echo.
ping -n 1 127.0.0.1>nul
echo    Exporting characters...
ping -n 1 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysqldump.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 %characters% > "%mainfolder%\Saves\%expansion%\%saveslot%\characters.sql"
echo.
echo    Done!
echo.
ping -n 1 127.0.0.1>nul
echo    Exporting playerbots...
ping -n 1 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysqldump.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 %playerbot% > "%mainfolder%\Saves\%expansion%\%saveslot%\playerbot.sql"
echo.
echo    Done!
echo.
ping -n 1 127.0.0.1>nul
if "%serverstartoption%"=="1" (goto server_x86)
if "%serverstartoption%"=="2" (goto server_x64)

:servers_start
cls
cd "%mainfolder%\Settings\%expansion%"
echo.
echo Select your architecture.
echo Win32 better for low-end pc or laptops.
echo.
echo 1 - Win32
echo 2 - Win64
echo.
set /P serverstartoption=Select your option: 
goto check_autosave_start

:server_x86
cd "%mainfolder%\Settings\%expansion%"
if "%serverstartoption%"=="1" (Start ..\..\Server\Binaries\%expansion%\Bin\%worldserver%)
tasklist /FI "IMAGENAME eq %realmserver%" 2>NUL | find /I /N "%realmserver%">NUL
if "%ERRORLEVEL%"=="0" goto menu
start /min ..\..\Server\Binaries\%expansion%\Bin\%realmserver%
REM start Server\Tools\server_check.bat"
goto menu

:server_x64
cd "%mainfolder%\Settings\%expansion%"
if "%serverstartoption%"=="2" (Start ..\..\Server\Binaries\%expansion%\Bin64\%worldserver%)
tasklist /FI "IMAGENAME eq %realmserver%" 2>NUL | find /I /N "%realmserver%">NUL
if "%ERRORLEVEL%"=="0" goto menu
start /min ..\..\Server\Binaries\%expansion%\Bin64\%realmserver%
REM start Server\Tools\server_check.bat"
goto menu

:save_menu
cls
set customname1=Empty slot
set customname2=Empty slot
set customname3=Empty slot
set customname4=Empty slot
set customname5=Empty slot
set customname6=Empty slot
set customname7=Empty slot
set customname8=Empty slot
set customname9=Empty slot
set customnameold=Old Save
set customnametransfer=Transfer Save

if exist "%mainfolder%\Saves\%expansion%\1\name.txt" set /p customname1=<"%mainfolder%\Saves\%expansion%\1\name.txt"
if exist "%mainfolder%\Saves\%expansion%\2\name.txt" set /p customname2=<"%mainfolder%\Saves\%expansion%\2\name.txt"
if exist "%mainfolder%\Saves\%expansion%\3\name.txt" set /p customname3=<"%mainfolder%\Saves\%expansion%\3\name.txt"
if exist "%mainfolder%\Saves\%expansion%\4\name.txt" set /p customname4=<"%mainfolder%\Saves\%expansion%\4\name.txt"
if exist "%mainfolder%\Saves\%expansion%\5\name.txt" set /p customname5=<"%mainfolder%\Saves\%expansion%\5\name.txt"
if exist "%mainfolder%\Saves\%expansion%\6\name.txt" set /p customname6=<"%mainfolder%\Saves\%expansion%\6\name.txt"
if exist "%mainfolder%\Saves\%expansion%\7\name.txt" set /p customname7=<"%mainfolder%\Saves\%expansion%\7\name.txt"
if exist "%mainfolder%\Saves\%expansion%\8\name.txt" set /p customname8=<"%mainfolder%\Saves\%expansion%\8\name.txt"
if exist "%mainfolder%\Saves\%expansion%\9\name.txt" set /p customname9=<"%mainfolder%\Saves\%expansion%\9\name.txt"
if exist "%mainfolder%\Saves\%expansion%\old\name.txt" set /p customnameold=<"%mainfolder%\Saves\%expansion%\old\name.txt"
if exist "%mainfolder%\Saves\%expansion%\transfer\name.txt" set /p customnametransfer=<"%mainfolder%\Saves\%expansion%\transfer\name.txt"

more < "%mainfolder%\header_save.txt"
echo.
echo   Save 1  -  [%customname1%]
echo   Save 2  -  [%customname2%]
echo   Save 3  -  [%customname3%]
echo   Save 4  -  [%customname4%]
echo   Save 5  -  [%customname5%]
echo   Save 6  -  [%customname6%]
echo   Save 7  -  [%customname7%]
echo   Save 8  -  [%customname8%]
echo   Save 9  -  [%customname9%]
echo   Save 10 -  [Autosave]
if exist "%mainfolder%\Saves\%expansion%\old\name.txt" echo.
if exist "%mainfolder%\Saves\%expansion%\old\name.txt" echo  -------Old Save-------
if exist "%mainfolder%\Saves\%expansion%\old\name.txt" echo   Save 11 -  [%customnameold%]
if exist "%mainfolder%\Saves\%expansion%\transfer\name.txt" echo.
if "%choose_exp%"=="2" if exist "%mainfolder%\Saves\%expansion%\transfer\name.txt" echo  -------Vanilla Save-------
if "%choose_exp%"=="3" if exist "%mainfolder%\Saves\%expansion%\transfer\name.txt" echo  ---------TBC Save---------
if exist "%mainfolder%\Saves\%expansion%\transfer\name.txt" echo   Save 12 -  [%customnametransfer%]
echo  -----------------------
echo.
echo   1 - Save     2 - Load     3 - Delete
echo.
echo   4 - Turn autosave on/off [%autosave%]
echo   5 - Open the Saves folder
echo.
echo   0 - Back to main menu
echo.
set /P savemenu=Select your option: 
if "%savemenu%"=="1" (goto saveslot_choose)
if "%savemenu%"=="2" (goto saveslot_choose)
if "%savemenu%"=="3" (goto saveslot_choose)
if "%savemenu%"=="4" (goto autosave_switch)
if "%savemenu%"=="5" (explorer.exe "%mainfolder%\Saves\%expansion%")
if "%savemenu%"=="0" (goto menu)
if "%savemenu%"=="" (goto save_menu)
goto save_menu
echo.
:saveslot_choose
set /P saveslot=Select a save slot: 
if "%saveslot%"=="1" (set saveslot=1)
if "%saveslot%"=="2" (set saveslot=2)
if "%saveslot%"=="3" (set saveslot=3)
if "%saveslot%"=="4" (set saveslot=4)
if "%saveslot%"=="5" (set saveslot=5)
if "%saveslot%"=="6" (set saveslot=6)
if "%saveslot%"=="7" (set saveslot=7)
if "%saveslot%"=="8" (set saveslot=8)
if "%saveslot%"=="9" (set saveslot=9)
if "%saveslot%"=="10" (set saveslot=autosave)
if "%saveslot%"=="11" (set saveslot=old)
if "%saveslot%"=="12" (set saveslot=transfer)
if "%saveslot%"=="" (goto save_menu)

if "%savemenu%"=="1" (goto export_char_check)
if "%savemenu%"=="2" (goto import_char_check)
if "%savemenu%"=="3" (goto delete_saveslot_check)

:delete_saveslot_check
cls
if exist "%mainfolder%\Saves\%expansion%\%saveslot%\characters.sql" goto delete_saveslot
more < "%mainfolder%\header_save.txt"
echo.
echo    You can not delete an empty slot...
echo.
ping -n 3 127.0.0.1>nul
goto save_menu

:delete_saveslot
cls
more < "%mainfolder%\header_save.txt"
echo.
SET /P AREYOUSURE=Delete #%saveslot% save? (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO save_menu
goto delete_saveslot_1

:delete_saveslot_1
cls
more < "%mainfolder%\header_save.txt"
echo.
echo    Removing save #%saveslot%...
ping -n 3 127.0.0.1>nul
rem remove whole folder to wipe version files
rd /s /q "%mainfolder%\Saves\%expansion%\%saveslot%"
rem del "%mainfolder%\Saves\%expansion%\%saveslot%\realmd.sql"
rem del "%mainfolder%\Saves\%expansion%\%saveslot%\characters.sql"
rem del "%mainfolder%\Saves\%expansion%\%saveslot%\playerbot.sql"
rem del "%mainfolder%\Saves\%expansion%\%saveslot%\name.txt"
mkdir "%mainfolder%\Saves\%expansion%\%saveslot%"
echo.
echo    Save #%saveslot% is empty now.
echo.
ping -n 3 127.0.0.1>nul
goto save_menu

:export_notransfer
cls
more < "%mainfolder%\header_save.txt"
echo.
if "%saveslot%"=="transfer" echo    Transfer slot is for import only...
if "%saveslot%"=="old" echo    Old SPP slot is for import only...
echo.
ping -n 3 127.0.0.1>nul
goto save_menu

:export_char_check
cls
if "%saveslot%"=="transfer" goto export_notransfer
if "%saveslot%"=="old" goto export_notransfer
if exist "%mainfolder%\Saves\%expansion%\%saveslot%\characters.sql" goto export_char
goto export_char_1

:export_char
cls
more < "%mainfolder%\header_save.txt"
echo.
echo    This will overwrite previous save!
echo.
SET /P AREYOUSURE=Overwrite save in this slot? (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO save_menu
goto export_char_1

:export_char_1
cls
more < "%mainfolder%\header_save.txt"
echo.
set /P slotname=Enter a name for the save:
echo %slotname%>"%mainfolder%\Saves\%expansion%\%saveslot%\name.txt"
cls
more < "%mainfolder%\header_save.txt"
ping -n 2 127.0.0.1>nul
echo.
echo    Creating save #%saveslot% "%slotname%"
ping -n 3 127.0.0.1>nul
echo.
echo    Exporting accounts...
ping -n 2 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysqldump.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 %login% > "%mainfolder%\Saves\%expansion%\%saveslot%\realmd.sql"
echo.
echo    Exporting characters...
ping -n 2 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysqldump.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 %characters% > "%mainfolder%\Saves\%expansion%\%saveslot%\characters.sql"
echo.
echo    Exporting playerbots...
ping -n 2 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysqldump.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 %playerbot% > "%mainfolder%\Saves\%expansion%\%saveslot%\playerbot.sql"
echo.
echo    Saving version info...
ping -n 2 127.0.0.1>nul
xcopy /y "%mainfolder%\%expansion%_chars_version.spp" "%mainfolder%\Saves\%expansion%\%saveslot%">nul
xcopy /y "%mainfolder%\%expansion%_realm_version.spp" "%mainfolder%\Saves\%expansion%\%saveslot%">nul
if not "%logs_version%"=="0" (
xcopy /y "%mainfolder%\%expansion%_logs_version.spp" "%mainfolder%\Saves\%expansion%\%saveslot%">nul
)
xcopy /y "%mainfolder%\%expansion%_bots_version.spp" "%mainfolder%\Saves\%expansion%\%saveslot%">nul
xcopy /y "%mainfolder%\%expansion%_website_version.spp" "%mainfolder%\Saves\%expansion%\%saveslot%">nul
echo.
echo    Done!
ping -n 2 127.0.0.1>nul
echo.
echo    Save #%saveslot% "%slotname%" created.
ping -n 4 127.0.0.1>nul
rem echo.
rem echo    Saves are stored here:
rem ping -n 2 127.0.0.1>nul
rem echo    SPP_Server/Saves/%expansion%/
rem ping -n 4 127.0.0.1>nul
goto menu

:import_char_check
cls
if exist "%mainfolder%\Saves\%expansion%\%saveslot%\characters.sql" goto import_char
more < "%mainfolder%\header_save.txt"
echo.
echo    This slot is empty
ping -n 2 127.0.0.1>nul
echo    Please select another one
echo.
ping -n 3 127.0.0.1>nul
goto save_menu

:import_char
cls
more < "%mainfolder%\header_save.txt"
echo.
echo    Please stop all your servers
echo    before continuing!
echo.
echo    This will overwrite your characters!
echo.
if "%saveslot%"=="transfer" echo    IMPORTANT!
if "%saveslot%"=="transfer" echo    After vanilla - tbc transfer
if "%saveslot%"=="transfer" echo    all random bots are deleted
if "%saveslot%"=="transfer" echo    Except for bots who are:
if "%saveslot%"=="transfer" echo    - in someone's Friends list
if "%saveslot%"=="transfer" echo    - in real player's guild
if "%saveslot%"=="transfer" echo.
SET /P AREYOUSURE=Are you sure want to do this? (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO save_menu
goto import_char_1

:convert_old_data
echo    Converting accounts...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < "%mainfolder%\sql\%expansion%\convert_realmd.sql"
echo.
echo    Converting characters...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%characters% < "%mainfolder%\sql\%expansion%\convert_characters.sql"
echo.
echo    Updating realmlist...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < "%mainfolder%\sql\%expansion%\realmlist.sql"
echo.
echo    Installing website tables...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < "%mainfolder%\sql\%expansion%\website.sql"
if "%saveslot%"=="old" goto import_playerbots

:convert_transfer_data
echo.
echo    Upgrading accounts...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < "%mainfolder%\sql\%expansion%\transfer_realmd.sql"
echo.
echo    Upgrading characters...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%characters% < "%mainfolder%\sql\%expansion%\transfer_characters.sql"
echo.
echo    Updating realmlist...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < "%mainfolder%\sql\%expansion%\realmlist.sql"
echo.
echo    Installing website tables...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < "%mainfolder%\sql\%expansion%\website.sql"
if "%saveslot%"=="transfer" goto import_playerbots

:import_char_1
cls
if exist "%mainfolder%\Saves\%expansion%\%saveslot%\name.txt" set /p tempname=<"%mainfolder%\Saves\%expansion%\%saveslot%\name.txt"
more < "%mainfolder%\header_save.txt"
ping -n 2 127.0.0.1>nul
echo.
echo    Loading save #%saveslot% "%tempname%"
ping -n 3 127.0.0.1>nul
echo.
echo    Importing accounts...
ping -n 2 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < "%mainfolder%\Saves\%expansion%\%saveslot%\realmd.sql"
echo.
echo    Importing characters...
ping -n 2 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%characters% < "%mainfolder%\Saves\%expansion%\%saveslot%\characters.sql"
if "%saveslot%"=="old" goto convert_old_data
if "%saveslot%"=="transfer" goto convert_transfer_data
:import_playerbots
echo.
echo    Importing playerbots...
ping -n 2 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\Saves\%expansion%\%saveslot%\playerbot.sql"
if "%saveslot%"=="old" ping -n 2 127.0.0.1>nul
if "%saveslot%"=="old" echo.
if "%saveslot%"=="old" echo    Converting playerbots...
if "%saveslot%"=="old" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\sql\%expansion%\playerbot\characters_ai_playerbot_equip_cache.sql"
if "%saveslot%"=="old" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\sql\%expansion%\playerbot\characters_ai_playerbot_rarity_cache.sql"
if "%saveslot%"=="old" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\sql\%expansion%\playerbot\characters_ai_playerbot_rnditem_cache.sql"
if "%saveslot%"=="old" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\sql\%expansion%\playerbot\characters_ai_playerbot_tele_cache.sql"
if "%saveslot%"=="old" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\sql\%expansion%\reset_randombots.sql"
if "%saveslot%"=="old" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\sql\%expansion%\delete_randombots.sql"
if "%saveslot%"=="transfer" ping -n 2 127.0.0.1>nul
if "%saveslot%"=="transfer" echo.
if "%saveslot%"=="transfer" echo    Upgrading playerbots...
if "%saveslot%"=="transfer" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\sql\%expansion%\playerbot\characters_ai_playerbot_equip_cache.sql"
if "%saveslot%"=="transfer" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\sql\%expansion%\playerbot\characters_ai_playerbot_rarity_cache.sql"
if "%saveslot%"=="transfer" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\sql\%expansion%\playerbot\characters_ai_playerbot_rnditem_cache.sql"
if "%saveslot%"=="transfer" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\sql\%expansion%\playerbot\characters_ai_playerbot_tele_cache.sql"
if "%saveslot%"=="transfer" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\sql\%expansion%\reset_randombots.sql"
if "%saveslot%"=="transfer" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\sql\%expansion%\delete_randombots.sql"
REM if "%choose_exp%"=="1" echo  Done!
REM if "%choose_exp%"=="2" echo  Done!
REM if "%choose_exp%"=="3" echo  Done!
:import_continue
echo.
echo    Loading version info...
ping -n 2 127.0.0.1>nul
if exist "%mainfolder%\%expansion%_chars_version.spp" del "%mainfolder%\%expansion%_chars_version.spp">nul
if exist "%mainfolder%\%expansion%_realm_version.spp" del "%mainfolder%\%expansion%_realm_version.spp">nul
if not "%logs_version%"=="0" (
if exist "%mainfolder%\%expansion%_logs_version.spp" del "%mainfolder%\%expansion%_logs_version.spp">nul
)
if exist "%mainfolder%\%expansion%_bots_version.spp" del "%mainfolder%\%expansion%_bots_version.spp">nul
if exist "%mainfolder%\%expansion%_website_version.spp" del "%mainfolder%\%expansion%_website_version.spp">nul
if not "%saveslot%"=="transfer" (
if not "%saveslot%"=="old" (
if exist "%mainfolder%\Saves\%expansion%\%saveslot%\%expansion%_chars_version.spp" xcopy /y "%mainfolder%\Saves\%expansion%\%saveslot%\%expansion%_chars_version.spp" "%mainfolder%">nul
if exist "%mainfolder%\Saves\%expansion%\%saveslot%\%expansion%_realm_version.spp" xcopy /y "%mainfolder%\Saves\%expansion%\%saveslot%\%expansion%_realm_version.spp" "%mainfolder%">nul
if not "%logs_version%"=="0" (
if exist "%mainfolder%\Saves\%expansion%\%saveslot%\%expansion%_logs_version.spp" xcopy /y "%mainfolder%\Saves\%expansion%\%saveslot%\%expansion%_logs_version.spp" "%mainfolder%">nul
)
if exist "%mainfolder%\Saves\%expansion%\%saveslot%\%expansion%_bots_version.spp" xcopy /y "%mainfolder%\Saves\%expansion%\%saveslot%\%expansion%_bots_version.spp" "%mainfolder%">nul
if exist "%mainfolder%\Saves\%expansion%\%saveslot%\%expansion%_website_version.spp" xcopy /y "%mainfolder%\Saves\%expansion%\%saveslot%\%expansion%_website_version.spp" "%mainfolder%">nul
)
)
rem echo.
rem echo    Applying characters db updates...
rem ping -n 2 127.0.0.1>nul
rem for %%i in ("%mainfolder%\sql\%expansion%\characters_updates\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\characters_updates\*sql" if %%i neq "%mainfolder%\sql\%expansion%\characters_updates\*sql" if %%i neq "%mainfolder%\sql\%expansion%\characters_updates\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%characters% < %%i
rem echo.
rem echo    Applying accounts db updates...
rem ping -n 2 127.0.0.1>nul
rem for %%i in ("%mainfolder%\sql\%expansion%\realmd_updates\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\realmd_updates\*sql" if %%i neq "%mainfolder%\sql\%expansion%\realmd_updates\*sql" if %%i neq "%mainfolder%\sql\%expansion%\realmd_updates\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < %%i
rem echo.
rem echo    Applying playerbot db updates...
rem ping -n 2 127.0.0.1>nul
rem for %%i in ("%mainfolder%\sql\%expansion%\playerbot_updates\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\playerbot_updates\*sql" if %%i neq "%mainfolder%\sql\%expansion%\playerbot_updates\*sql" if %%i neq "%mainfolder%\sql\%expansion%\playerbot_updates\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < %%i
echo.
echo    Done!
ping -n 2 127.0.0.1>nul
echo.
echo    Save #%saveslot% "%tempname%" loaded.
ping -n 4 127.0.0.1>nul
goto start_database

:account_tool
cls
more < "%mainfolder%\header_spp.txt"
more < "%mainfolder%\logo_%expansion%.txt"
echo.
echo    1) Start the server
echo    2) Open "mangosd.exe" window
echo    3) Use the following command:
echo.
if "%choose_exp%"=="1" echo     account create NAME PASSWORD
if "%choose_exp%"=="2" echo     account create NAME PASSWORD
if "%choose_exp%"=="3" echo     account create NAME PASSWORD
echo.
echo    To give GM rights use:
echo.
echo     account set gm NAME 3
echo.
echo    Change the NAME and PASSWORD to yours
echo.
pause
goto menu

:shutdown_servers
cls
tasklist /FI "IMAGENAME eq %realmserver%" 2>NUL | find /I /N "%realmserver%">NUL
if "%ERRORLEVEL%"=="0" taskkill /f /im %realmserver%
tasklist /FI "IMAGENAME eq %worldserver%" 2>NUL | find /I /N "%worldserver%">NUL
if "%ERRORLEVEL%"=="0" taskkill /f /im %worldserver%
tasklist /FI "IMAGENAME eq %worldserver%" 2>NUL | find /I /N "%worldserver%">NUL
if "%ERRORLEVEL%"=="0" taskkill /f /im %worldserver%
tasklist /FI "IMAGENAME eq cmdmp3win.exe" 2>NUL | find /I /N "cmdmp3win.exe">NUL
if "%ERRORLEVEL%"=="0" taskkill /f /im cmdmp3win.exe
tasklist /FI "IMAGENAME eq spp-httpd.exe" 2>NUL | find /I /N "spp-httpd.exe">NUL
if "%ERRORLEVEL%"=="0" taskkill /f /im spp-httpd.exe
cls
if exist "%mainfolder%\autosave.on" goto autosave_shutdown
"%mainfolder%\Server\Database\bin\mysqladmin.exe" -u root -p123456 --port=3310 shutdown

goto exit

:autosave_shutdown
set saveslot=autosave
more < "%mainfolder%\header_spp.txt"
echo.
echo           Autosave is on!
ping -n 1 127.0.0.1>nul
echo.
echo    Exporting accounts...
"%mainfolder%\Server\Database\bin\mysqldump.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 %login% > "%mainfolder%\Saves\%expansion%\%saveslot%\realmd.sql"
ping -n 1 127.0.0.1>nul
echo.
echo    Done!
ping -n 1 127.0.0.1>nul
echo.
echo    Exporting characters...
"%mainfolder%\Server\Database\bin\mysqldump.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 %characters% > "%mainfolder%\Saves\%expansion%\%saveslot%\characters.sql"
ping -n 1 127.0.0.1>nul
echo.
echo    Done!
ping -n 1 127.0.0.1>nul
echo.
echo    Exporting playerbots...
"%mainfolder%\Server\Database\bin\mysqldump.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 %playerbot% > "%mainfolder%\Saves\%expansion%\%saveslot%\playerbot.sql"
ping -n 1 127.0.0.1>nul
echo.
echo    Done!
echo.
ping -n 1 127.0.0.1>nul
echo    Shutting down...
ping -n 2 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysqladmin.exe" -u root -p123456 --port=3310 shutdown

goto exit

:changelog
cls
setlocal EnableDelayedExpansion
mode con: cols=60 lines=40
rem more < "%mainfolder%\header_spp.txt"
echo ############################################################
echo # SPP - Classics Collection                                #
echo # https://spp-forum.de                                     #
echo ############################################################
echo.
set /a count=0
set /a newcount=0
for %%f in ("%mainfolder%\Changelog\*.txt") do (
set /a newcount+=1
)
if "%selected_log%"=="" (set selected_log=0)
set logname[0]=1
set manylogs=0
set choose_log=0
rem echo Selected Log:%selected_log%
if %selected_log% GTR 0 (
echo          -------- Changelog v%selected_log% --------
more < "%mainfolder%\Changelog\%selected_log%.txt"
echo.
)
for /f "tokens=*" %%f in ('dir /b /o-n "%mainfolder%\Changelog\*.txt"') do (
set /a count+=1
set logname[!count!]=%%~nf
rem echo Log Name: !logname[%count%]!
rem echo "%log!count!%"
rem echo !count!
rem set /p val=<%%f
rem echo "fullname: %%f"
rem echo "name: %%~nf"
rem echo "contents: !val!"
if !count! EQU 1 (if %selected_log% EQU 0 (
echo          -------- Changelog v%%~nf --------
more < "%mainfolder%\Changelog\%%~nf.txt"
)
if %selected_log% EQU 0 echo.
if %selected_log% GTR 0 (
if %selected_log% NEQ %%~nf (echo    !count! - %%~nf)
)
)
if !count! GTR 1 (
if !count! LSS 6 ( if %selected_log% NEQ %%~nf (echo    !count! - %%~nf))
)
if !count! GTR 5 (
if !manylogs! EQU 0 (
set manylogs=manylogs
echo    6 - More logs...)
)
)
echo.
echo    Press Enter to continue
echo.
set /P choose_log=Enter your choice: 
if %choose_log% NEQ 0 (
if "%choose_log%"=="6" (
explorer.exe Changelog
goto changelog)
rem echo Selected Log: %choose_log%
rem echo Selected log name: !logname[%choose_log%]!
rem echo Selected log name2: %logname[1]%
set selected_log=!logname[%choose_log%]!
rem set lognametemp=testingstuffultra
goto changelog
)
if "%choose_log%"=="0" (goto select_expansion)
if "%choose_log%"=="" (goto select_expansion)
goto select_expansion

:service_menu
cls
COLOR 03
more < "%mainfolder%\header_spp.txt"
echo.
echo      -------- Service Menu --------
echo.
echo    1 - Fix Database after crash
echo.
echo    2 - Install VCredist x64
echo.
echo    3 - Install VCredist x86
echo.
echo    4 - Report bug
echo.
echo    0 - Go back
echo.
set /P choose_service=Enter your choice: 
if "%choose_service%"=="1" (goto fix_database)
if "%choose_service%"=="2" (goto vcredist_install_x64)
if "%choose_service%"=="3" (goto vcredist_install_x86)
if "%choose_service%"=="4" (goto report_issue)
if "%choose_service%"=="0" (goto select_expansion)
goto service_menu

:vcredist_install_all
cls
echo.
cd "%mainfolder%\Addons\vcredist"
start "InstallAll.bat"
cd "%mainfolder%"
goto service_menu

:report_issue
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    ike3 is the developer of
echo    playerbots system
echo.
echo      We use a modified version of it
echo.
echo    Press any key to open our bug-tracker
echo    on GitHub
echo.
pause
start https://github.com/celguar/mangosbot-bots/issues
goto service_menu

:fix_database
cls
more < "%mainfolder%\header_spp.txt"
echo.
ping -n 2 127.0.0.1>nul
echo    Starting database...
start "" /min "%mainfolder%\Server\Database\start.bat"
ping -n 3 127.0.0.1>nul
echo.
echo    Please wait...
ping -n 3 127.0.0.1>nul
echo.
echo    Checking database errors...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysqlcheck.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --auto-repair --check --all-databases
ping -n 3 127.0.0.1>nul
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    Check complete!
ping -n 3 127.0.0.1>nul
echo.
echo    Shutting down the database...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysqladmin.exe" -u root -p123456 --port=3310 shutdown
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    Check complete!
echo.
echo    Shutting down the database...
echo.
echo    Done!
ping -n 3 127.0.0.1>nul
rem echo.
rem echo    Press any key to go back
rem echo.
rem pause
goto select_expansion


:vcredist_install_x86
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    Complete VCredist installation
"%mainfolder%\Addons\vcredist\2005 Updated\vcredist_x86.exe" /Q
"%mainfolder%\Addons\vcredist\2008 SP1\vcredist_x86.exe" /qb
"%mainfolder%\Addons\vcredist\2010\vcredist_x86.exe" /passive /norestart
"%mainfolder%\Addons\vcredist\2012 Update 4\vcredist_x86.exe" /passive /norestart
"%mainfolder%\Addons\vcredist\2013\vcredist_x86.exe" /install /passive /norestart
"%mainfolder%\Addons\vcredist\2015 Update 3\vc_redist.x86.exe" /install /passive /norestart
"%mainfolder%\Addons\vcredist\2017\vc_redist.x86.exe" /install /passive /norestart
goto service_menu

:vcredist_install_x64
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    Complete VCredist installation
"%mainfolder%\Addons\vcredist\2005 Updated\vcredist_x64.exe" /Q
"%mainfolder%\Addons\vcredist\2008 SP1\vcredist_x64.exe" /qb
"%mainfolder%\Addons\vcredist\2010\vcredist_x64.exe" /passive /norestart
"%mainfolder%\Addons\vcredist\2012 Update 4\vcredist_x64.exe" /passive /norestart
"%mainfolder%\Addons\vcredist\2013\vcredist_x64.exe" /install /passive /norestart
"%mainfolder%\Addons\vcredist\2015 Update 3\vc_redist.x64.exe" /install /passive /norestart
"%mainfolder%\Addons\vcredist\2017\vc_redist.x64.exe" /install /passive /norestart
goto service_menu

:log_file
notepad "%mainfolder%\Server\Logs\server.log"
goto service_menu

:autosave_switch
if exist "%mainfolder%\autosave.on" goto autosave_off
if exist "%mainfolder%\autosave.off" goto autosave_on

:autosave_off
cls
del "%mainfolder%\autosave.on"
echo autosave > "%mainfolder%\autosave.off"
goto save_menu

:autosave_on
del "%mainfolder%\autosave.off"
echo autosave > "%mainfolder%\autosave.on"
goto save_menu


:exit
exit