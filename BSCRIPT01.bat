@echo off
REM Open five websites
start https://www.google.com
start https://www.microsoft.com
start https://www.github.com
start https://www.youtube.com
start https://www.wikipedia.org

REM Launch Calculator and Notepad
start calc.exe
start notepad.exe

REM Initiate system shutdown after a brief delay
timeout /t 10 /nobreak
shutdown /s /t 30

exit
