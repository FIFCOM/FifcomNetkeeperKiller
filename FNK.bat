@echo off

:Check
for /f "delims= " %%i in ('tasklist^|find /i "NK.exe"') do (
if /i "%%i"=="NK.exe" goto exist)
for /f "delims= " %%i in ('tasklist^|find /i "NetKeeper.exe"') do (
if /i "%%i"=="NetKeeper.exe" goto exist)
ping -n 1 www.baidu.com>nul
IF ERRORLEVEL 1 goto init
mshta.exe vbscript:Execute("msgbox "" 网络连接正常,无需启动NetKeeper""&vbNewLine&vbNewLine&"" Github : https://f15.pw/fnk""&vbNewLine&vbNewLine&"" [如需帮助请联系QQ1280874899]"",0,""FIFCOM NetKeeper Killer v1.1"":close")
exit

:init
start NetKeeper.exe
goto Check

:exist
ping -n 1 www.baidu.com>nul
IF ERRORLEVEL 1 goto exist
for /f "TOKENS=1" %%a in ('wmic PROCESS where "Name='NK.exe'" get ProcessID ^| findstr [0-9]') do set NKPID=%%a
"%AppData%\FIFCOM\FNK\NTSD_FNK.exe" -c q -p %NKPID%
goto heartbeat

:heartbeat
ping -n 1 www.baidu.com >nul
IF ERRORLEVEL 1 goto pingerr
ping -n 3 127.0.0.1 >nul
goto heartbeat

:pingerr
ping -n 1 cn.bing.com >nul
IF ERRORLEVEL 1 goto Check
ping -n 3 127.0.0.1 >nul
goto heartbeat
