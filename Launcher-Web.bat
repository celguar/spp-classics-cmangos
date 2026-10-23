@echo off
setlocal
title SPP Classics V2 - Web Launcher
cd /d "%~dp0"

rem Web based launcher (admin panel). Uses Node.js from PATH, or downloads a
rem portable copy into Server\Tools\node on first start.
set "NODE_VERSION=v22.12.0"
set "NODE_DIR=%~dp0Server\Tools\node"
set "NODE="

for /f "tokens=4-5 delims=[.] " %%i in ('ver') do (if %%i==Version (set winver=%%j) else (set winver=%%i))
if not "%winver%"=="10" (
  echo.
  echo    The web launcher needs Windows 10 or newer.
  echo    Please use Launcher.bat on this computer.
  echo.
  pause
  exit /b 1
)

if exist "%NODE_DIR%\node.exe" set "NODE=%NODE_DIR%\node.exe"
if defined NODE goto run
for /f "delims=" %%i in ('where node 2^>nul') do if not defined NODE set "NODE=%%i"
if not defined NODE goto download
"%NODE%" -e "process.exit(+process.versions.node.split('.')[0] >= 18 ? 0 : 1)"
if errorlevel 1 (
  set "NODE="
  goto download
)
goto run

:download
echo.
echo    Node.js 18+ was not found, downloading portable Node.js %NODE_VERSION% - about 30 MB...
echo.
set "NODE_ZIP=%~dp0Server\Tools\node.zip"
set "NODE_URL=https://nodejs.org/dist/%NODE_VERSION%/node-%NODE_VERSION%-win-x64.zip"
where curl >nul 2>nul
if not errorlevel 1 (
  curl -L --fail -o "%NODE_ZIP%" "%NODE_URL%"
) else (
  "%~dp0Server\Tools\wget.exe" -q --show-progress --no-check-certificate "%NODE_URL%" -O "%NODE_ZIP%"
)
if not exist "%NODE_ZIP%" goto download_failed
"%~dp0Server\Tools\7za.exe" x -y -o"%~dp0Server\Tools" "%NODE_ZIP%" >nul
del "%NODE_ZIP%"
if exist "%NODE_DIR%" rd /s /q "%NODE_DIR%"
move "%~dp0Server\Tools\node-%NODE_VERSION%-win-x64" "%NODE_DIR%" >nul
if not exist "%NODE_DIR%\node.exe" goto download_failed
set "NODE=%NODE_DIR%\node.exe"

:run
"%NODE%" "%~dp0WebLauncher\server.js" %*
if errorlevel 1 pause
exit /b

:download_failed
echo.
echo    Could not download Node.js. Install it from https://nodejs.org
echo    or use Launcher.bat instead.
echo.
pause
exit /b 1
