@echo off
setlocal enabledelayedexpansion

:menu
cls
echo Select a Windows utility to execute:
echo 1. ipconfig
echo 2. tasklist
echo 3. taskkill
echo 4. chkdsk
echo 5. format
echo 6. defrag
echo 7. find
echo 8. attrib
set /p choice=Enter your choice (1/8): 

if "%choice%"=="1" goto ipconfig
if "%choice%"=="2" goto tasklist
if "%choice%"=="3" goto taskkill
if "%choice%"=="4" goto chkdsk
if "%choice%"=="5" goto format
if "%choice%"=="6" goto defrag
if "%choice%"=="7" goto find
if "%choice%"=="8" goto attrib
echo Invalid choice. Please select a number from 1 to 8.
pause
goto menu

:ipconfig
ipconfig
goto end

:tasklist
tasklist
goto end

:taskkill
set /p pid=Enter the PID of the process to kill: 
if not defined pid (
    echo No PID entered. Returning to menu.
    pause
    goto menu
)
taskkill /PID %pid%
goto end

:chkdsk
set /p drive=Enter the drive letter (e.g., C:): 
if not defined drive (
    echo No drive letter entered. Returning to menu.
    pause
    goto menu
)
chkdsk %drive%
goto end

:format
set /p drive=Enter the drive letter to format (e.g., D:): 
if not defined drive (
    echo No drive letter entered. Returning to menu.
    pause
    goto menu
)
echo WARNING: This will erase all data on %drive%
set /p confirm=Are you sure you want to format %drive%? (Y/N): 
if /I not "%confirm%"=="Y" (
    echo Format cancelled. Returning to menu.
    pause
    goto menu
)
format %drive%
goto end

:defrag
set /p drive=Enter the drive letter to defrag (e.g., C:): 
if not defined drive (
    echo No drive letter entered. Returning to menu.
    pause
    goto menu
)
defrag %drive%
goto end

:find
set /p search=Enter the text to find: 
if not defined search (
    echo No text entered. Returning to menu.
    pause
    goto menu
)
set /p file=Enter the file to search in: 
if not defined file (
    echo No file entered. Returning to menu.
    pause
    goto menu
)
find "%search%" "%file%"
goto end

:attrib
set /p file=Enter the file or directory to change attributes for: 
if not defined file (
    echo No file or directory entered. Returning to menu.
    pause
    goto menu
)
set /p attributes=Enter the attributes to set (e.g., +r, -h, etc.): 
if not defined attributes (
    echo No attributes entered. Returning to menu.
    pause
    goto menu
)
attrib %attributes% %file%
goto end

:end
echo Operation completed. Returning to menu.
pause
goto menu
