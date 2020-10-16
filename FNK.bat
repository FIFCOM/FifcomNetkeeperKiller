@echo off
setlocal enabledelayedexpansion
set line=1

:Check
for /f "delims= " %%i in ('tasklist^|find /i "NK.exe"') do (
if /i "%%i"=="NK.exe" goto exist)
for /f "delims= " %%i in ('tasklist^|find /i "NetKeeper.exe"') do (
if /i "%%i"=="NetKeeper.exe" goto exist)
curl -sL http://api.fifcom.cn/FNK/check.php?tls=0 -o "$" && set /p check=<$ && del $ >nul 2>nul
if "%heartbeat%"=="1" (if "%check%"=="OK" goto heartbeat)
if not "%check%"=="OK" goto init
mshta.exe vbscript:Execute("msgbox "" 网络连接正常,无需启动NetKeeper""&vbNewLine&vbNewLine&"" Github : https://f15.pw/fnk""&vbNewLine&vbNewLine&"" [如需帮助请联系QQ1280874899]"",0,""FIFCOM NetKeeper Killer v1.1"":close")
exit

:init
start NetKeeper.exe
goto Check

:exist
ping -n 1 www.baidu.com>nul
IF ERRORLEVEL 1 goto exist
"%AppData%\FIFCOM\FNK\NTSD_FNK.exe" -c q -pn NK.exe
goto heartbeat

:heartbeat
set heartbeat=1
for /l %%i in (1,1,1) do (set /a line=!random!%%25+1 && for /f "delims== tokens=1*" %%a in ('type %AppData%\FIFCOM\FNK\urls.txt ^|C:\Windows\System32\findstr /i "%line%"') do set url=%%b)
ping -n 1 %url%>nul
IF ERRORLEVEL 1 goto check
ping -n 3 127.0.0.1 >nul
goto heartbeat
