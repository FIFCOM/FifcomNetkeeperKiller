@echo off
mode con: cols=65 lines=25
color 8b
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&& echo. && echo      未获取管理员权限 && ping -n 3 127.0.0.1>nul && exit
del "%appdata%\FIFCOM\FNK\FNK.exe" >nul 2>nul
del "%appdata%\FIFCOM\FNK\NTSD_FNK.exe" >nul 2>nul
del "%appdata%\FIFCOM\FNK\urls.txt" >nul 2>nul
del "C:\Users\%username%\Desktop\NetKeeper_FNK.lnk"
rd "%appdata%\FIFCOM\FNK\logs" >nul 2>nul
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
