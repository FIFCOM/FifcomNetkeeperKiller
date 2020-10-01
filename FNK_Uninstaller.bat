@echo off
mode con: cols=65 lines=25
color 8b
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&& echo. && echo      未获取管理员权限 && ping -n 3 127.0.0.1>nul && exit
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "FifcomNetkeeperKiller-AutoRun-Svc" /f >nul 2>nul
del "%appdata%\FIFCOM\FNK\FifcomNetkeeperKiller-AutoRun-Svc-MBZjqkTzoXcwN3Ep6C6yWoRr3TqOdvn4.bat" >nul 2>nul
del "%appdata%\FIFCOM\FNK\ntsd_FNKoMe05k.exe" >nul 2>nul
rd "%appdata%\FIFCOM\FNK" >nul 2>nul
cls
echo.
echo.      FNK Uninstaller
echo.   ___________________________________________________________
echo.
echo.
echo.      FNK 已从您的计算机移除。
pause>nul
exit