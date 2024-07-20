@echo off
setlocal enabledelayedexpansion

:: Define the source and archive directories
set sourceDir=C:\path\to\roblox\files
set archiveDir=Z:\archive
set tempSortDir=%archiveDir%\sorted

:: Check if Drive Z: exists
if not exist "Z:\" (
    echo Drive Z: does not exist. Please make sure the drive is available.
    pause
    goto end
)

:: Create the archive directory if it doesn't exist
if not exist "%archiveDir%" (
    mkdir "%archiveDir%"
)

:: Create a temporary directory for sorting if it doesn't exist
if not exist "%tempSortDir%" (
    mkdir "%tempSortDir%"
)

:: Archive older Roblox files to the archive directory
echo Archiving older Roblox files (.rbxl, .rbxm) from %sourceDir% to %archiveDir%...
forfiles /P "%sourceDir%" /M *.rbxl /D -30 /C "cmd /c move @file %archiveDir%"
forfiles /P "%sourceDir%" /M *.rbxm /D -30 /C "cmd /c move @file %archiveDir%"

:: Sort the archived files by size
echo Sorting archived files by size...
for %%F in ("%archiveDir%\*.rbxl" "%archiveDir%\*.rbxm") do (
    set fileSize=%%~zF
    set fileName=%%~nxF
    copy "%%F" "%tempSortDir%\!fileSize!-!fileName!"
)

:: Display sorted files and prompt user for permission to delete
echo The following large files are archived and sorted by size:
dir /S /O-S "%tempSortDir%"
echo.

set /p delConfirm=Do you want to delete these old, large files? (Y/N): 
if /I "%delConfirm%"=="Y" (
    echo Deleting old, large files...
    del /Q "%tempSortDir%\*"
    echo Files deleted.
) else (
    echo Files were not deleted.
)

:: Clean up temporary directory
rd /S /Q "%tempSortDir%"

:end
echo Operation completed.
pause
