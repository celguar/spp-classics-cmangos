@echo off
:beginning
SET NAME=SPP - Classics Collection
TITLE %NAME%
set mainfolder=%CD%

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
if exist "%mainfolder%\Server\Database" goto beginning_part2
cls
echo.
echo  Preparing for the first launch...
ping -n 2 127.0.0.1>nul
cd "%mainfolder%\Server"
"%mainfolder%\Server\Tools\7za.exe" e -y -spf Database.7z > nul
REM "%mainfolder%\Server\Tools\7za.exe" e -y -spf Database_Playerbot.7z > nul
cd "%mainfolder%"
goto beginning

:install_website
echo.
echo  Extracting Webserver...
echo.
ping -n 2 127.0.0.1>nul
echo  Please, wait...
echo.
cd "%mainfolder%\Server\Tools"
"%mainfolder%\Server\Tools\7za.exe" e -y -spf Apache.7z > nul
cd "%mainfolder%"
echo  Done!
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
echo.
echo  List of the active Patrons
echo  --------------------------
echo.
more < "%mainfolder%\patrons.txt"
echo.
echo  ###################
echo  # Thank you guys! #
echo  ###################
ping -n 9 127.0.0.1>nul

cd "%mainfolder%"
goto select_expansion

:website_start
tasklist /FI "IMAGENAME eq spp-httpd.exe" 2>NUL | find /I /N "spp-httpd.exe">NUL
if "%ERRORLEVEL%"=="0" goto menu
cd "%mainfolder%\Server\Tools\Apache24"
start "" /min "apache_start.bat"
cd "%mainfolder%"
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
echo music > "%mainfolder%\website.on"
goto beginning

:select_expansion
mode con: cols=40 lines=30
SET NAME=SPP - Classics Collection
TITLE %NAME%
COLOR 0F
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
cls
echo ########################################
echo # SPP - Classics Collection            #
echo # https://spp-forum.de                 #
echo ########################################
echo.
echo   Choose expansion:
echo.
echo   1 - World of Warcraft
echo.
echo          [%module_check_vanilla%]
echo.
echo.
echo   2 - The Burning Crusade
echo.
echo          [%module_check_tbc%]
echo.
echo.
echo   3 - Wrath of the Lich King
echo.
echo          [%module_check_wotlk%]
REM echo 4 - World of Warcraft: Cataclysm               [%module_check_cata%]
echo.
echo   9 - Players Map [%website%]
echo.
echo   0 - Intro/Music [%music%]
echo.
echo   5 - Service menu
echo.
set /P choose_exp=What expansion do you want to play: 
if "%choose_exp%"=="1" (goto setup_vanilla)
if "%choose_exp%"=="2" (goto setup_tbc)
if "%choose_exp%"=="3" (goto setup_wotlk)
REM if "%choose_exp%"=="4" (goto setup_cata)
if "%choose_exp%"=="9" (goto website_switch)
if "%choose_exp%"=="0" (goto music_switch)
if "%choose_exp%"=="5" (goto service_menu)
if "%menu%"=="" (goto select_expansion)

:setup_vanilla
SET NAME=SPP - Vanilla
TITLE %NAME%
COLOR 0E
set expansion=vanilla

set characters=classiccharacters
set playerbot=classicplayerbots
set world=classicmangos
set login=classicrealmd

set realmserver=realmd.exe
set worldserver=mangosd.exe

set spp_update=vanilla_base
set world_update=vanilla_world_up1

goto settings

:setup_tbc
SET NAME=SPP - The Burning Crusade
TITLE %NAME%
COLOR 0A
set expansion=tbc

set characters=tbccharacters
set playerbot=tbcplayerbots
set world=tbcmangos
set login=tbcrealmd

set realmserver=realmd.exe
set worldserver=mangosd.exe

set spp_update=tbc_base
set world_update=tbc_world_up1

goto settings

:setup_wotlk
SET NAME=SPP - Wrath of the Lich King
TITLE %NAME%
COLOR 0B
set expansion=wotlk

set characters=wotlkcharacters
set playerbot=wotlkplayerbots
set world=wotlkmangos
set login=wotlkrealmd

set realmserver=realmd.exe
set worldserver=mangosd.exe

set spp_update=wotlk_base
set world_update=wotlk_world_up1

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
 
if not exist "%mainfolder%\%spp_update%.spp" goto update_install
if not exist "%mainfolder%\%world_update%.spp" goto update_world
if exist "%mainfolder%\website.on" del "%mainfolder%\Server\website\vanilla.spp"
if exist "%mainfolder%\website.on" del "%mainfolder%\Server\website\tbc.spp"
if exist "%mainfolder%\website.on" del "%mainfolder%\Server\website\wotlk.spp"
if exist "%mainfolder%\website.on" echo %expansion% > "%mainfolder%\Server\website\%expansion%.spp"
if exist "%mainfolder%\website.on" goto website_start
goto menu

:module_not_found
cls
echo.
echo  The %expansion% module not found
ping -n 2 127.0.0.1>nul
echo  Starting download in 10 seconds...
ping -n 10 127.0.0.1>nul
echo.
if "%choose_exp%"=="1" goto install_module_vanilla
if "%choose_exp%"=="2" goto install_module_tbc
if "%choose_exp%"=="3" goto install_module_wotlk
if "%choose_exp%"=="4" goto install_module_vanilla

:install_module_vanilla
mode con: cols=80 lines=30
echo.
echo  Downloading Vanilla module...(~520 MB)
echo.
"%mainfolder%\Server\Tools\wget.exe" -c -q --show-progress ftp://161.97.113.128:9876/spp_classics_data/cmangos/vanilla.7z -P "%mainfolder%\Modules"
echo.
echo  Download complete. Checking file...
ping -n 3 127.0.0.1>nul
goto check_modules

:install_module_tbc
mode con: cols=80 lines=30
echo.
echo  Downloading TBC module...(~740 MB)
echo.
"%mainfolder%\Server\Tools\wget.exe" -c -q --show-progress ftp://161.97.113.128:9876/spp_classics_data/cmangos/tbc.7z -P "%mainfolder%\Modules"
echo.
echo  Download complete. Checking file...
ping -n 3 127.0.0.1>nul
goto check_modules

:install_module_wotlk
mode con: cols=80 lines=30
echo.
echo  Downloading WotLK module...(~1100 MB)
echo.
"%mainfolder%\Server\Tools\wget.exe" -c -q --show-progress ftp://161.97.113.128:9876/spp_classics_data/cmangos/wotlk.7z -P "%mainfolder%\Modules"
echo.
echo  Download complete. Checking file...
ping -n 3 127.0.0.1>nul
goto check_modules

:check_modules
mode con: cols=40 lines=30
if not exist "%mainfolder%\Modules\%expansion%.7z" goto module_not_found
cd "%mainfolder%\Modules"
mkdir %expansion%
cd %expansion%
echo.
echo  Extracting %expansion% module...
echo.
ping -n 2 127.0.0.1>nul
echo  Please, wait...
echo.
"%mainfolder%\Server\Tools\7za.exe" e -y -spf "%mainfolder%\Modules\%expansion%.7z" > nul
echo  Done!
ping -n 3 127.0.0.1>nul
del "%mainfolder%\Modules\%expansion%.7z"
cd "%mainfolder%"
goto update_install

:extract_worlddb
echo.
echo  Extracting world database...
echo.
cd "%mainfolder%\sql\%expansion%"
"%mainfolder%\Server\Tools\7za.exe" e -y -spf "%mainfolder%\sql\%expansion%\world.7z" > nul
echo  Done!
cd "%mainfolder%"
ping -n 2 127.0.0.1>nul
goto update_install

:update_install
mode con: cols=40 lines=30
cls
if not exist "%mainfolder%\Modules\%expansion%\vmaps" goto check_modules
if not exist "%mainfolder%\sql\%expansion%\world.sql" goto extract_worlddb
echo.
echo  Installing database, please wait...
echo.
ping -n 10 127.0.0.1>nul
echo  Installing world database...
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 < "%mainfolder%\sql\%expansion%\drop_world.sql"
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < "%mainfolder%\sql\%expansion%\world.sql"
echo.
echo  Installing characters database...
ping -n 2 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 < "%mainfolder%\sql\%expansion%\drop_characters.sql"
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 < "%mainfolder%\sql\%expansion%\drop_realmd.sql"
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%characters% < "%mainfolder%\sql\%expansion%\characters.sql"
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < "%mainfolder%\sql\%expansion%\realmd.sql"
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 < "%mainfolder%\sql\%expansion%\drop_playerbot.sql"
echo.
echo  Applying characters updates...
ping -n 2 127.0.0.1>nul
for %%i in ("%mainfolder%\sql\%expansion%\characters\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\characters\*sql" if %%i neq "%mainfolder%\sql\%expansion%\characters\*sql" if %%i neq "%mainfolder%\sql\%expansion%\characters\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%characters% < %%i
echo.
echo  Applying playerbot updates...
ping -n 2 127.0.0.1>nul
for %%i in ("%mainfolder%\sql\%expansion%\playerbot\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\playerbot\*sql" if %%i neq "%mainfolder%\sql\%expansion%\playerbot\*sql" if %%i neq "%mainfolder%\sql\%expansion%\playerbot\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < %%i
for %%i in ("%mainfolder%\sql\%expansion%\realmd\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\realmd\*sql" if %%i neq "%mainfolder%\sql\%expansion%\realmd\*sql" if %%i neq "%mainfolder%\sql\%expansion%\realmd\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < %%i
echo.
echo  Applying world updates...
ping -n 2 127.0.0.1>nul
for %%i in ("%mainfolder%\sql\%expansion%\world\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\world\*sql" if %%i neq "%mainfolder%\sql\%expansion%\world\*sql" if %%i neq "%mainfolder%\sql\%expansion%\world\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
for %%i in ("%mainfolder%\sql\%expansion%\world\Instances\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\world\Instances\*sql" if %%i neq "%mainfolder%\sql\%expansion%\world\Instances\*sql" if %%i neq "%mainfolder%\sql\%expansion%\world\Instances\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
echo.
echo  Done!
ping -n 3 127.0.0.1>nul
echo %spp_update% > "%mainfolder%\%spp_update%.spp"
goto start_database

:update_world
mode con: cols=40 lines=30
if "%choose_exp%"=="4" goto menu
del "%mainfolder%\%expansion%_fr.spp"
del "%mainfolder%\%expansion%_de.spp"
del "%mainfolder%\%expansion%_ko.spp"
del "%mainfolder%\%expansion%_ch.spp"
del "%mainfolder%\%expansion%_mx.spp"
del "%mainfolder%\%expansion%_ru.spp"
del "%mainfolder%\%expansion%_tw.spp"
del "%mainfolder%\%expansion%_es.spp"
cls
echo.
echo  Extracting world update...
cd "%mainfolder%\sql\%expansion%"
"%mainfolder%\Server\Tools\7za.exe" e -y -spf "%mainfolder%\sql\%expansion%\world.7z" > nul
ping -n 2 127.0.0.1>nul
cd "%mainfolder%"
echo.
echo  Updating database, please wait...
echo.
ping -n 10 127.0.0.1>nul
echo  Installing updated world database...
ping -n 2 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 < "%mainfolder%\sql\%expansion%\drop_world.sql"
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < "%mainfolder%\sql\%expansion%\world.sql"
echo.
echo  Applying characters database updates...
ping -n 2 127.0.0.1>nul
for %%i in ("%mainfolder%\sql\%expansion%\realmd\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\realmd\*sql" if %%i neq "%mainfolder%\sql\%expansion%\realmd\*sql" if %%i neq "%mainfolder%\sql\%expansion%\realmd\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < %%i
for %%i in ("%mainfolder%\sql\%expansion%\characters_updates\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\characters_updates\*sql" if %%i neq "%mainfolder%\sql\%expansion%\characters_updates\*sql" if %%i neq "%mainfolder%\sql\%expansion%\characters_updates\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%characters% < %%i
echo.
echo  Applying world updates...
ping -n 2 127.0.0.1>nul
for %%i in ("%mainfolder%\sql\%expansion%\world\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\world\*sql" if %%i neq "%mainfolder%\sql\%expansion%\world\*sql" if %%i neq "%mainfolder%\sql\%expansion%\world\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
for %%i in ("%mainfolder%\sql\%expansion%\world\Instances\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\world\Instances\*sql" if %%i neq "%mainfolder%\sql\%expansion%\world\Instances\*sql" if %%i neq "%mainfolder%\sql\%expansion%\world\Instances\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
echo.
echo  Done!
ping -n 3 127.0.0.1>nul
echo %spp_update% > "%mainfolder%\%world_update%.spp"
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
REM if not exist "%mainfolder%\Saves\%expansion%\transfer" mkdir "%mainfolder%\Saves\%expansion%\transfer"
cls
echo ########################################
echo # %NAME%
echo # https://spp-forum.de
echo ########################################
more < "%mainfolder%\logo_%expansion%.txt"
echo.
REM echo MySQL settings
REM echo --------------
REM echo Host: %host%
REM echo Port: %port%
REM echo User: %user%
REM echo Pass: %pass%
REM echo --------------
REM echo.
REM echo 1 - Start servers (Win32)
echo  2 - Start servers (Win64)
echo.
echo  3 - Create game account
echo  4 - Change default server address
echo  5 - Save Manager
echo.
echo  6 - Reset randombots
echo  7 - Wipe characters, accounts, bots
echo.
tasklist /FI "IMAGENAME eq %worldserver%" 2>NUL | find /I /N "%worldserver%">NUL
if NOT "%ERRORLEVEL%"=="0" echo  8 - Install locales
echo.
tasklist /FI "IMAGENAME eq %worldserver%" 2>NUL | find /I /N "%worldserver%">NUL
if NOT "%ERRORLEVEL%"=="0" echo  9 - Back to expansion selector
echo  0 - Shutdown all servers
echo.
set /P menu=Enter a number: 
REM if "%menu%"=="1" (goto quick_start_servers_x86)
if "%menu%"=="1" (goto menu)
if "%menu%"=="2" (goto quick_start_servers_x64)
if "%menu%"=="3" (goto account_tool)
if "%menu%"=="4" (goto ip_changer)
if "%menu%"=="5" (goto save_menu)
if "%menu%"=="6" (goto clear_bots)
if "%menu%"=="7" (goto clear_characters)
if "%menu%"=="8" (goto install_locales_pre)
if "%menu%"=="9" (goto select_expansion)
if "%menu%"=="0" (goto shutdown_servers)
if "%menu%"=="" (goto menu)

goto menu

:clear_bots
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
echo.
echo  Reseting random bots...
echo.
ping -n 2 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\sql\%expansion%\reset_randombots.sql"
echo  Done! Going back...
ping -n 3 127.0.0.1>nul
goto menu

:clear_characters
mode con: cols=40 lines=30
COLOR 0C
cls
echo ########################################
echo # WARNING!                             #
echo # All characters and bots              #
echi # will be removed !!!                  #
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
echo.
echo  Wiping accounts...
ping -n 2 127.0.0.1>nul
echo.
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 < "%mainfolder%\sql\%expansion%\drop_characters.sql"
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 < "%mainfolder%\sql\%expansion%\drop_playerbot.sql"
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 < "%mainfolder%\sql\%expansion%\drop_realmd.sql"
echo  Wiping characters...
ping -n 2 127.0.0.1>nul
echo.
echo  Reinstalling character database...
ping -n 2 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%characters% < "%mainfolder%\sql\%expansion%\characters.sql"
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < "%mainfolder%\sql\%expansion%\realmd.sql"
echo.
echo  Applying characters database updates...
ping -n 2 127.0.0.1>nul
for %%i in ("%mainfolder%\sql\%expansion%\characters\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\characters\*sql" if %%i neq "%mainfolder%\sql\%expansion%\characters\*sql" if %%i neq "%mainfolder%\sql\%expansion%\characters\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%characters% < %%i
for %%i in ("%mainfolder%\sql\%expansion%\characters_updates\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\characters_updates\*sql" if %%i neq "%mainfolder%\sql\%expansion%\characters_updates\*sql" if %%i neq "%mainfolder%\sql\%expansion%\characters_updates\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%characters% < %%i
echo.
echo  Installing bots database...
ping -n 2 127.0.0.1>nul
for %%i in ("%mainfolder%\sql\%expansion%\playerbot\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\playerbot\*sql" if %%i neq "%mainfolder%\sql\%expansion%\playerbot\*sql" if %%i neq "%mainfolder%\sql\%expansion%\playerbot\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < %%i
echo.
echo  Done! Going back...
ping -n 3 127.0.0.1>nul
goto menu

:ip_changer
set /p current_ip=<"%mainfolder%\Settings\%expansion%\address.txt"
cls
echo.
echo  Current address: %current_ip%
echo.
set /P setip=Enter the new address:
echo %setip%>"%mainfolder%\Settings\%expansion%\address.txt"
if "%choose_exp%"=="1" set realmlist_address=REPLACE INTO `realmlist` VALUES ('1', 'Vanilla Realm', '%setip%', 8085, 1, 0, 1, 0, 0, '');
if "%choose_exp%"=="2" set realmlist_address=REPLACE INTO `realmlist` VALUES ('1', 'The Burning Crusade Realm', '%setip%', 8085, 1, 0, 1, 0, 0, '');
if "%choose_exp%"=="3" set realmlist_address=REPLACE INTO `realmlist` VALUES ('1', 'Wrath of the Lich King Realm', '%setip%', 8085, 1, 0, 1, 0, 0, '');
if "%choose_exp%"=="4" set realmlist_address=REPLACE INTO `realmlist` VALUES ('1', 'Single Player Project', '%setip%', '127.0.0.1', '255.255.255.0', 8085, 1, 0, 1, 0, 0, 15595, 2, 1);
echo.
echo  Saving the new address...
ping -n 2 127.0.0.1>nul
echo %realmlist_address%>"%mainfolder%\sql\%expansion%\realmlist.sql"
echo.
echo  Importing new address...
ping -n 2 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < "%mainfolder%\sql\%expansion%\realmlist.sql"
echo.
echo  Address changed to: %setip%
pause
goto menu

:install_locales_pre
cls
set locFR=X
set locES=X
set locDE=X
set locKO=X
set locCH=X
set locTW=X
set locRU=X
set locMX=X

:install_locales
cls
set lo_fr=Not Installed
set lo_es=Not Installed
set lo_de=Not Installed
set lo_ko=Not Installed
set lo_ch=Not Installed
set lo_tw=Not Installed
set lo_ru=Not Installed
set lo_mx=Not Installed

if exist "%mainfolder%\%expansion%_fr.spp" set lo_fr=Installed
if exist "%mainfolder%\%expansion%_es.spp" set lo_es=Installed
if exist "%mainfolder%\%expansion%_de.spp" set lo_de=Installed
if exist "%mainfolder%\%expansion%_ko.spp" set lo_ko=Installed
if exist "%mainfolder%\%expansion%_ch.spp" set lo_ch=Installed
if exist "%mainfolder%\%expansion%_tw.spp" set lo_tw=Installed
if exist "%mainfolder%\%expansion%_ru.spp" set lo_ru=Installed
if exist "%mainfolder%\%expansion%_mx.spp" set lo_mx=Installed

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
echo        N - Install selected
echo        X - Go back
echo.
set /p activity=Please select locales to install : 
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

if %activity% == N goto install_locales_go
if %activity% == n goto install_locales_go

if %activity% == X goto menu
if %activity% == x goto menu
if %activity%. == . goto menu
pause
goto menu

:ToggleLocFR
if %locFR% == X goto ToggleLocFRNo:
if %locFR% == V goto ToggleLocFRYes:
goto install_locales

:ToggleLocFRNo
set locFR=V
goto install_locales

:ToggleLocFRYes
set locFR=X
goto install_locales

:ToggleLocCH
if %locCH% == X goto ToggleLocCHNo:
if %locCH% == V goto ToggleLocCHYes:
goto install_locales

:ToggleLocCHNo
set locCH=V
goto install_locales

:ToggleLocCHYes
set locCH=X
goto install_locales

:ToggleLocTW
if %locTW% == X goto ToggleLocTWNo:
if %locTW% == V goto ToggleLocTWYes:
goto install_locales

:ToggleLocTWNo
set locTW=V
goto install_locales

:ToggleLocTWYes
set locTW=X
goto install_locales

:ToggleLocDE
if %locDE% == X goto ToggleLocDENo:
goto install_locales

:ToggleLocDENo
set locDE=V
goto install_locales

:ToggleLocDEYes
set locDE=X
goto install_locales

:ToggleLocES
if %locES% == X goto ToggleLocESNo:
if %locES% == V goto ToggleLocESYes:
goto install_locales

:ToggleLocESNo
set locES=V
goto install_locales

:ToggleLocESYes
set locES=X
goto install_locales

:ToggleLocMX
if %locMX% == X goto ToggleLocMXNo:
if %locMX% == V goto ToggleLocMXYes:
goto install_locales

:ToggleLocMXNo
set locMX=V
goto install_locales

:ToggleLocMXYes
set locMX=X
goto install_locales

:ToggleLocRU
if %locRU% == X goto ToggleLocRUNo:
if %locRU% == V goto ToggleLocRUYes:
goto install_locales

:ToggleLocRUNo
set locRU=V
goto install_locales

:ToggleLocRUYes
set locRU=X
goto install_locales

:ToggleLocKO
if %locKO% == X goto ToggleLocKONo:
if %locKO% == V goto ToggleLocKOYes:
goto install_locales

:ToggleLocKONo
set locKO=V
goto install_locales

:ToggleLocKOYes
set locKO=X
goto install_locales

:install_locales_go
cls
more < "%mainfolder%\header_locale.txt"
echo.
echo  Extracting locales...
ping -n 3 127.0.0.1>nul
echo.
echo  Please wait...
cd "%mainfolder%\sql\%expansion%"
"%mainfolder%\Server\Tools\7za.exe" e -y -spf "%mainfolder%\sql\%expansion%\locales.7z" > nul
echo.
cd "%mainfolder%"
ping -n 3 127.0.0.1>nul
echo  Preparing %expansion% DB...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < "%mainfolder%\sql\%expansion%\locales\prepare.sql"
ping -n 3 127.0.0.1>nul

:WorldDB
if %locFR% == V goto LoadFR:

:WorldDB1
if %locDE% == V goto LoadDE:

:WorldDB2
if %locKO% == V goto LoadKO:

:WorldDB3
if %locCH% == V goto LoadCH:

:WorldDB4
if %locTW% == V goto LoadTW:

:WorldDB5
if %locES% == V goto LoadES:

:WorldDB6
if %locMX% == V goto LoadMX:

:WorldDB7
if %locRU% == V goto LoadRU:

:locales_end
cls
more < "%mainfolder%\header_locale.txt"
echo.
echo  Locales installed!
ping -n 3 127.0.0.1>nul
echo.
echo  Removing temp files...
rd /s /q "%mainfolder%\sql\%expansion%\locales"
ping -n 3 127.0.0.1>nul
echo.
echo  Done!
ping -n 3 127.0.0.1>nul
echo.

goto install_locales_pre

:LoadFR
echo.
echo  Loading French Locale...
for %%i in ("%mainfolder%\sql\%expansion%\locales\French\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\locales\French\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\French\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\French\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
echo.
echo  Done!
echo %expansion% > "%mainfolder%\%expansion%_fr.spp"
ping -n 2 127.0.0.1>nul
goto WorldDB1:

:LoadDE
echo.
echo  Loading German Locale...
for %%i in ("%mainfolder%\sql\%expansion%\locales\German\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\locales\German\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\German\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\German\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
echo.
echo  Done!
echo %expansion% > "%mainfolder%\%expansion%_de.spp"
ping -n 2 127.0.0.1>nul
goto WorldDB2:

:LoadKO
echo.
echo  Loading Korean Locale...
for %%i in ("%mainfolder%\sql\%expansion%\locales\Korean\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\locales\Korean\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\Korean\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\Korean\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
echo.
echo  Done!
echo %expansion% > "%mainfolder%\%expansion%_ko.spp"
ping -n 2 127.0.0.1>nul
goto WorldDB3:

:LoadCH
echo.
echo  Loading Chinese Locale...
for %%i in ("%mainfolder%\sql\%expansion%\locales\Chinese\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\locales\Chinese\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\Chinese\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\Chinese\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
echo.
echo  Done!
echo %expansion% > "%mainfolder%\%expansion%_ch.spp"
ping -n 2 127.0.0.1>nul
goto WorldDB4:

:LoadTW
echo.
echo  Loading Taiwanese Locale...
for %%i in ("%mainfolder%\sql\%expansion%\locales\Taiwanese\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\locales\Taiwanese\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\Taiwanese\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\Taiwanese\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
echo.
echo  Done!
echo %expansion% > "%mainfolder%\%expansion%_tw.spp"
ping -n 2 127.0.0.1>nul
goto WorldDB5:

:LoadES
echo.
echo  Loading Spanish Locale...
for %%i in ("%mainfolder%\sql\%expansion%\locales\Spanish\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\locales\Spanish\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\Spanish\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\Spanish\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
echo.
echo  Done!
echo %expansion% > "%mainfolder%\%expansion%_es.spp"
ping -n 2 127.0.0.1>nul
goto WorldDB6:

:LoadMX
echo.
echo  Loading Spanish (SA) Locale...
for %%i in ("%mainfolder%\sql\%expansion%\locales\Spanish_South_American\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\locales\Spanish_South_American\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\Spanish_South_American\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\Spanish_South_American\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
echo.
echo  Done!
echo %expansion% > "%mainfolder%\%expansion%_mx.spp"
ping -n 2 127.0.0.1>nul
goto WorldDB7:

:LoadRU
echo.
echo  Loading Russian Locale...
for %%i in ("%mainfolder%\sql\%expansion%\locales\Russian\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\locales\Russian\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\Russian\*sql" if %%i neq "%mainfolder%\sql\%expansion%\locales\Russian\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%world% < %%i
echo.
echo  Done!
echo %expansion% > "%mainfolder%\%expansion%_ru.spp"
ping -n 2 127.0.0.1>nul
goto locales_end

:quick_start_servers_x86
taskkill /f /im cmdmp3win.exe
cls
set serverstartoption=1
set /p realmname1=<"%mainfolder%\Settings\%expansion%\name.txt

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
set /p realmname1=<"%mainfolder%\Settings\%expansion%\name.txt

echo.
echo  Starting the first realm...
echo.
echo  %realmname1%
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
echo.
echo ########################################
echo           # Autosave is on! #
echo ########################################
echo.
echo  Exporting accounts...please wait...
ping -n 1 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysqldump.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 %login% > "%mainfolder%\Saves\%expansion%\%saveslot%\realmd.sql"
echo.
echo  Done!
echo.
ping -n 1 127.0.0.1>nul
echo  Exporting characters...please wait...
ping -n 1 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysqldump.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 %characters% > "%mainfolder%\Saves\%expansion%\%saveslot%\characters.sql"
echo.
echo  Done!
echo.
ping -n 1 127.0.0.1>nul
if "%choose_exp%"=="1" echo  Exporting playerbots...please wait...
if "%choose_exp%"=="2" echo  Exporting playerbots...please wait...
if "%choose_exp%"=="3" echo  Exporting playerbots...please wait...
ping -n 1 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysqldump.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 %playerbot% > "%mainfolder%\Saves\%expansion%\%saveslot%\playerbot.sql"
echo.
echo  Done!
echo.
ping -n 1 127.0.0.1>nul
if "%serverstartoption%"=="1" (goto server_x86)
if "%serverstartoption%"=="2" (goto server_x64)

:servers_start
cls
cd "%mainfolder%\Settings\%expansion%
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
if "%menu%"=="1" (Start ..\..\Server\Binaries\%expansion%\Bin\%worldserver%)
tasklist /FI "IMAGENAME eq %realmserver%" 2>NUL | find /I /N "%realmserver%">NUL
if "%ERRORLEVEL%"=="0" goto menu
start /min ..\..\Server\Binaries\%expansion%\Bin\%realmserver%
REM start Server\Tools\server_check.bat"
goto menu

:server_x64
cd "%mainfolder%\Settings\%expansion%"
if "%menu%"=="2" (Start ..\..\Server\Binaries\%expansion%\Bin64\%worldserver%)
tasklist /FI "IMAGENAME eq %realmserver%" 2>NUL | find /I /N "%realmserver%">NUL
if "%ERRORLEVEL%"=="0" goto menu
start /min ..\..\Server\Binaries\%expansion%\Bin64\%realmserver%
REM start Server\Tools\server_check.bat"
goto menu

:save_menu
cls
echo.
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
REM set customnametransfer=Cmangos Save

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
REM if exist "%mainfolder%\Saves\%expansion%\transfer\name.txt" set /p customnametrans=<"%mainfolder%\Saves\%expansion%\transfer\name.txt"

echo.
echo  SPP Save Manager.
echo.
echo  This is the list of saves.
echo.
echo  Select an action below.
echo.
echo  -----------------------
echo  Save 1  -  [%customname1%]
echo  Save 2  -  [%customname2%]
echo  Save 3  -  [%customname3%]
echo  Save 4  -  [%customname4%]
echo  Save 5  -  [%customname5%]
echo  Save 6  -  [%customname6%]
echo  Save 7  -  [%customname7%]
echo  Save 8  -  [%customname8%]
echo  Save 9  -  [%customname9%]
echo  Save 10 -  [Autosave]
if exist "%mainfolder%\Saves\%expansion%\old\name.txt" echo.
if exist "%mainfolder%\Saves\%expansion%\old\name.txt" echo  --------Old Save-------
if exist "%mainfolder%\Saves\%expansion%\old\name.txt" echo  Save 11 -  [%customnameold%]
REM if exist "%mainfolder%\Saves\%expansion%\transfer\name.txt" echo.
REM if exist "%mainfolder%\Saves\%expansion%\transfer\name.txt" echo  ------CMangos Save-----
REM if exist "%mainfolder%\Saves\%expansion%\transfer\name.txt" echo  Save 12 -  [%customnametrans%]
echo  -----------------------
echo.
echo  1 - Save
echo  2 - Load
echo  3 - Delete
echo.
echo  4 - Turn autosave on/off [%autosave%]
echo.
echo  5 - Open the Saves folder
echo.
echo  0 - Back to main menu
echo.
set /P savemenu=Select your option: 
if "%savemenu%"=="1" (goto saveslot_choose)
if "%savemenu%"=="2" (goto saveslot_choose)
if "%savemenu%"=="3" (goto saveslot_choose)
if "%savemenu%"=="4" (goto autosave_switch)
if "%savemenu%"=="5" (explorer.exe Saves)
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
REM if "%saveslot%"=="12" (set saveslot=transfer)
if "%saveslot%"=="" (goto save_menu)

if "%savemenu%"=="1" (goto export_char_check)
if "%savemenu%"=="2" (goto import_char_check)
if "%savemenu%"=="3" (goto delete_saveslot_check)

:delete_saveslot_check
cls
if exist "%mainfolder%\Saves\%expansion%\%saveslot%\characters.sql" goto delete_saveslot
echo.
echo  You can not delete an empty slot...
echo.
ping -n 3 127.0.0.1>nul
goto save_menu

:delete_saveslot
cls
echo.
set /P menu=Are you sure want to clear #%saveslot% save? (Y/n)
if "%menu%"=="n" (goto menu)
if "%menu%"=="y" (goto delete_saveslot_1)

:delete_saveslot_1
cls
echo.
echo  Removing slot %saveslot% save files...
del "%mainfolder%\Saves\%expansion%\%saveslot%\realmd.sql"
del "%mainfolder%\Saves\%expansion%\%saveslot%\characters.sql"
del "%mainfolder%\Saves\%expansion%\%saveslot%\playerbot.sql"
del "%mainfolder%\Saves\%expansion%\%saveslot%\name.txt"
ping -n 2 127.0.0.1>nul
echo.
echo  Save %saveslot% is empty now.
echo.
ping -n 3 127.0.0.1>nul
goto save_menu

:export_notransfer
cls
echo.
if "%saveslot%"=="transfer" echo  Transfer slot is for import only...
if "%saveslot%"=="old" echo  Old SPP slot is for import only...
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
echo.
echo  This will overwrite your previous save!
echo.
set /P menu=Are you sure want save into this slot? (Y/n)
if "%menu%"=="n" (goto menu)
if "%menu%"=="y" (goto export_char_1)

:export_char_1
cls
echo.
set /P slotname=Enter a name for the save slot:
echo %slotname%>"%mainfolder%\Saves\%expansion%\%saveslot%\name.txt"
echo.
echo  Exporting accounts...please wait...
"%mainfolder%\Server\Database\bin\mysqldump.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 %login% > "%mainfolder%\Saves\%expansion%\%saveslot%\realmd.sql"
ping -n 2 127.0.0.1>nul
echo.
echo  Done!
echo.
ping -n 2 127.0.0.1>nul
echo  Exporting characters...please wait...
"%mainfolder%\Server\Database\bin\mysqldump.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 %characters% > "%mainfolder%\Saves\%expansion%\%saveslot%\characters.sql"
ping -n 2 127.0.0.1>nul
echo.
echo  Done!
echo.
ping -n 2 127.0.0.1>nul
if "%choose_exp%"=="1" echo  Exporting playerbots...please wait...
if "%choose_exp%"=="2" echo  Exporting playerbots...please wait...
if "%choose_exp%"=="3" echo  Exporting playerbots...please wait...
ping -n 2 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysqldump.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 %playerbot% > "%mainfolder%\Saves\%expansion%\%saveslot%\playerbot.sql"
ping -n 2 127.0.0.1>nul
echo.
echo  Done!
echo.
ping -n 2 127.0.0.1>nul
echo  Save slot %saveslot% created.
ping -n 2 127.0.0.1>nul
echo  Saves are stored in the Saves folder.
echo.
ping -n 3 127.0.0.1>nul
goto menu

:import_char_check
cls
if exist "%mainfolder%\Saves\%expansion%\%saveslot%\characters.sql" goto import_char
echo.
echo  This slot is empty
echo  Please select another one
echo.
ping -n 3 127.0.0.1>nul
goto save_menu

:import_char
cls
echo.
echo  Please stop all your servers
echo  before continuing!
echo.
echo  This will overwrite your current DB!
echo.
set /P menu=Are you sure want to do this? (Y/n)
if "%menu%"=="n" (goto menu)
if "%menu%"=="y" (goto import_char_1)

:convert_old_data
echo  Converting accounts...
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < "%mainfolder%\sql\%expansion%\convert_realmd.sql"
ping -n 2 127.0.0.1>nul
REM echo.
REM echo  Done!
ping -n 2 127.0.0.1>nul
echo.
echo  Converting characters...
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%characters% < "%mainfolder%\sql\%expansion%\convert_characters.sql"
ping -n 2 127.0.0.1>nul
REM echo.
REM echo  Done!
ping -n 2 127.0.0.1>nul
echo.
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < "%mainfolder%\sql\%expansion%\realmlist.sql"
echo  Updating realmlist...
ping -n 2 127.0.0.1>nul
echo.
if "%saveslot%"=="old" goto import_playerbots
if "%saveslot%"=="transfer" goto import_continue

:import_char_1
cls
echo.
echo  Importing accounts...
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < "%mainfolder%\Saves\%expansion%\%saveslot%\realmd.sql"
ping -n 2 127.0.0.1>nul
REM echo.
REM echo  Done!
echo.
ping -n 2 127.0.0.1>nul
echo  Importing characters...
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%characters% < "%mainfolder%\Saves\%expansion%\%saveslot%\characters.sql"
ping -n 2 127.0.0.1>nul
REM echo.
REM echo  Done!
ping -n 2 127.0.0.1>nul
echo.
if "%saveslot%"=="old" goto convert_old_data
if "%saveslot%"=="transfer" goto convert_old_data
:import_playerbots
if "%choose_exp%"=="1" echo  Importing playerbots...
if "%choose_exp%"=="2" echo  Importing playerbots...
if "%choose_exp%"=="3" echo  Importing playerbots...
"%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\Saves\%expansion%\%saveslot%\playerbot.sql"
if "%saveslot%"=="old" ping -n 2 127.0.0.1>nul
if "%saveslot%"=="old" echo.
if "%saveslot%"=="old" echo. Converting playerbots...
if "%saveslot%"=="old" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\sql\%expansion%\playerbot\characters_ai_playerbot_equip_cache.sql"
if "%saveslot%"=="old" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\sql\%expansion%\playerbot\characters_ai_playerbot_rarity_cache.sql"
if "%saveslot%"=="old" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\sql\%expansion%\playerbot\characters_ai_playerbot_rnditem_cache.sql"
if "%saveslot%"=="old" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%playerbot% < "%mainfolder%\sql\%expansion%\playerbot\characters_ai_playerbot_tele_cache.sql"
ping -n 2 127.0.0.1>nul
echo.
REM if "%choose_exp%"=="1" echo  Done!
REM if "%choose_exp%"=="2" echo  Done!
REM if "%choose_exp%"=="3" echo  Done!
ping -n 2 127.0.0.1>nul
:import_continue
echo  Importing characters updates...
echo.
for %%i in ("%mainfolder%\sql\%expansion%\realmd\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\realmd\*sql" if %%i neq "%mainfolder%\sql\%expansion%\realmd\*sql" if %%i neq "%mainfolder%\sql\%expansion%\realmd\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%login% < %%i
for %%i in ("%mainfolder%\sql\%expansion%\characters\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\characters\*sql" if %%i neq "%mainfolder%\sql\%expansion%\characters\*sql" if %%i neq "%mainfolder%\sql\%expansion%\characters\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%characters% < %%i
for %%i in ("%mainfolder%\sql\%expansion%\characters_updates\*sql") do if %%i neq "%mainfolder%\sql\%expansion%\characters_updates\*sql" if %%i neq "%mainfolder%\sql\%expansion%\characters_updates\*sql" if %%i neq "%mainfolder%\sql\%expansion%\characters_updates\*sql" "%mainfolder%\Server\Database\bin\mysql.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --database=%characters% < %%i
ping -n 2 127.0.0.1>nul
echo  Done!
ping -n 3 127.0.0.1>nul
echo.
cls
echo.
echo  Save slot %saveslot% import completed.
echo.
ping -n 3 127.0.0.1>nul
goto menu

:account_tool
cls
echo.
echo   - Start the server
echo   - Open "mangosd.exe" window
echo   - Use the following command:
echo.
echo    account create NAME PASSWORD
echo.
echo  To create an administrator account:
echo.
echo    account set gm NAME 3
echo.
echo  Change the NAME and PASSWORD to yours
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
echo.
echo ########################################
echo           # Autosave is on! #
echo ########################################
echo.
echo  Exporting accounts...please wait...
"%mainfolder%\Server\Database\bin\mysqldump.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 %login% > "%mainfolder%\Saves\%expansion%\%saveslot%\realmd.sql"
ping -n 1 127.0.0.1>nul
echo.
echo  Done!
ping -n 1 127.0.0.1>nul
echo.
echo  Exporting characters...please wait...
"%mainfolder%\Server\Database\bin\mysqldump.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 %characters% > "%mainfolder%\Saves\%expansion%\%saveslot%\characters.sql"
ping -n 1 127.0.0.1>nul
echo.
echo  Done!
ping -n 1 127.0.0.1>nul
echo.
if "%choose_exp%"=="1" echo  Exporting playerbots...please wait...
if "%choose_exp%"=="2" echo  Exporting playerbots...please wait...
if "%choose_exp%"=="3" echo  Exporting playerbots...please wait...
"%mainfolder%\Server\Database\bin\mysqldump.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 %playerbot% > "%mainfolder%\Saves\%expansion%\%saveslot%\playerbot.sql"
ping -n 1 127.0.0.1>nul
echo.
echo  Done!
echo.
ping -n 1 127.0.0.1>nul
echo  Shutting down...
ping -n 2 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysqladmin.exe" -u root -p123456 --port=3310 shutdown

goto exit

:service_menu
cls
COLOR 03
more < "%mainfolder%\header_spp.txt"
echo.
echo        Welcome to Service Menu!
echo.
echo.
echo    Choose desired operation:
echo.
echo   1 - Install VCredist x86
echo.
echo   2 - Install VCredist x64
echo.
echo   3 - Fix Database after crash
echo.
echo   4 - Report bug
echo.
echo   0 - Go back
echo.
set /P choose_service=Enter your choice: 
if "%choose_service%"=="1" (goto vcredist_install_x86)
if "%choose_service%"=="2" (goto vcredist_install_x64)
if "%choose_service%"=="3" (goto fix_database)
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
ping -n 3 127.0.0.1>nul
echo    Starting Database
start "" /min "%mainfolder%\Server\Database\start.bat"
ping -n 3 127.0.0.1>nul
echo.
echo    Please wait...
ping -n 3 127.0.0.1>nul
echo.
echo    Fixing Database errors...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysqlcheck.exe" --defaults-extra-file="%mainfolder%\Server\Database\connection.cnf" --default-character-set=utf8 --auto-repair --check --all-databases
ping -n 3 127.0.0.1>nul
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    Check complete
ping -n 3 127.0.0.1>nul
echo.
echo    Shutting down the database...
ping -n 3 127.0.0.1>nul
"%mainfolder%\Server\Database\bin\mysqladmin.exe" -u root -p123456 --port=3310 shutdown
ping -n 3 127.0.0.1>nul
cls
more < "%mainfolder%\header_spp.txt"
echo.
echo    DB check complete!
ping -n 3 127.0.0.1>nul
echo.
echo    Press any key to go back
echo.
pause
goto service_menu


:vcredist_install_x86
cls
echo ########################################
echo # SPP - Classics Collection            #
echo # https://spp-forum.de                 #
echo ########################################
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
echo ########################################
echo # SPP - Classics Collection            #
echo # https://spp-forum.de                 #
echo ########################################
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