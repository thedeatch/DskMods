@echo off
:: Check for administrative privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script is NOT running with administrative privileges.
    echo Please run the script as an administrator.
    pause
    exit /b
)

:: Set options
set /p map_name="Map Name (No Extension): "
set /p source_dir="Map Folder (Source): "
set /p target_dir="Base Folder (Target): "

:: Check if the maps folder exists
if not exist "%target_dir%\maps" (
    mkdir "%target_dir%\maps"
)

:: Copy main map files
mklink "%target_dir%\maps\%map_name%.map" "%source_dir%\maps\%map_name%.map"
mklink "%target_dir%\maps\%map_name%.bsp" "%source_dir%\maps\%map_name%.bsp"

:: Copy folders contents
for /d %%X in (%source_dir%\*) DO (
	if not "%%~nX" == "maps" (
		mklink /J "%target_dir%\%%~nX" "%%X"
	)
)

pause