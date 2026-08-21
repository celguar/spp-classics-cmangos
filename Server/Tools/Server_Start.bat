@echo off
SET NAME=SPP Classics V2 Launcher
TITLE %NAME%
set mainfolder=%CD%

goto Colorend

:ColorNew
:: v1
:: Function to print colored text
SetLocal EnableExtensions EnableDelayedExpansion
:PrintColoredText
set "colorCode=[%~1m"
set "text=%~2[0m"

:: Print the text with the specified color
<nul set /p =!colorCode!!text!
rem echo(!colorCode!!text!

:: Return to caller
Goto :Eof

:ColorBlink
:: v1
:: Function to print colored text
SetLocal EnableExtensions EnableDelayedExpansion
:PrintColoredText
set "colorCode=[5m[%~1m"
set "text=%~2[0m[0m"

:: Print the text with the specified color
<nul set /p =!colorCode!!text!
rem echo(!colorCode!!text!

:: Return to caller
Goto :Eof

:ColorItalic
:: v1
:: Function to print colored text
SetLocal EnableExtensions EnableDelayedExpansion
:PrintColoredText
set "colorCode=[3m[%~1m"
set "text=%~2[0m[0m"

:: Print the text with the specified color
<nul set /p =!colorCode!!text!
rem echo(!colorCode!!text!

:: Return to caller
Goto :Eof

:ColorUnderline
:: v1
:: Function to print colored text
SetLocal EnableExtensions EnableDelayedExpansion
:PrintColoredText
set "colorCode=[4m[%~1m"
set "text=%~2[0m[0m"

:: Print the text with the specified color
<nul set /p =!colorCode!!text!
rem echo(!colorCode!!text!

:: Return to caller
Goto :Eof

:ColorStrike
:: v1
:: Function to print colored text
SetLocal EnableExtensions EnableDelayedExpansion
:PrintColoredText
set "colorCode=[9m[%~1m"
set "text=%~2[0m[0m"

:: Print the text with the specified color
<nul set /p =!colorCode!!text!
rem echo(!colorCode!!text!

:: Return to caller
Goto :Eof

:Color
:: v23c
:: Arguments: hexColor text [\n] ...
:: \n -> newline ... -> repeat
:: Supported in windows XP, 7, 8.
:: This version works using Cmd /U
:: In XP extended ascii characters are printed as dots.
:: For print quotes, use empty text.
SetLocal EnableExtensions EnableDelayedExpansion
Subst `: "!Temp!" >Nul &`: &Cd \
SetLocal DisableDelayedExpansion
Echo(|(Pause >Nul &Findstr "^" >`)
Cmd /A /D /C Set /P "=." >>` <Nul
For /F %%# In (
'"Prompt $H &For %%_ In (_) Do Rem"') Do (
Cmd /A /D /C Set /P "=%%# %%#" <Nul >`.1
Copy /Y `.1 /B + `.1 /B + `.1 /B `.3 /B >Nul
Copy /Y `.1 /B + `.1 /B + `.3 /B `.5 /B >Nul
Copy /Y `.1 /B + `.1 /B + `.5 /B `.7 /B >Nul
)
:__Color
Set "Text=%~2"
If Not Defined Text (Set Text=^")
SetLocal EnableDelayedExpansion
For %%_ In ("&" "|" ">" "<"
) Do Set "Text=!Text:%%~_=^%%~_!"
Set /P "LF=" <` &Set "LF=!LF:~0,1!"
For %%# in ("!LF!") Do For %%_ In (
\ / :) Do Set "Text=!Text:%%_=%%~#%%_%%~#!"
For /F delims^=^ eol^= %%# in ("!Text!") Do (
If #==#! EndLocal
If \==%%# (Findstr /A:%~1 . \` Nul
Type `.3) Else If /==%%# (Findstr /A:%~1 . /.\` Nul
Type `.5) Else (Cmd /A /D /C Echo %%#\..\`>`.dat
Findstr /F:`.dat /A:%~1 .
Type `.7))
If "\n"=="%~3" (Shift
Echo()
Shift
Shift
If ""=="%~1" Del ` `.1 `.3 `.5 `.7 `.dat &Goto :Eof
Goto :__Color
:Colorend

if NOT exist "%mainfolder%\SPP_Server\launcher.bat" goto not_installed
:start_server
cd "%mainfolder%\SPP_Server"
Launcher.bat
exit

:not_installed
echo.
call :Color 0B "   %NAME% is not installed"
ping -n 3 127.0.0.1>nul
echo.
echo.
call :Color 0B "   Use Server_Update.bat to download it"
echo.
echo.
pause
exit