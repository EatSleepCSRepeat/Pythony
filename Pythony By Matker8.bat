@echo off
title Pythony Workspace 

:: Set workspace directory
set WORKSPACE_DIR=%~dp0workspace
if not exist %WORKSPACE_DIR% mkdir %WORKSPACE_DIR%

:: Navigate to workspace directory
cd /d %WORKSPACE_DIR%

:: Create and activate virtual environment
if not exist venv (
    python -m venv venv
)
call venv\Scripts\activate

:: Custom commands
:menu
echo.
echo Welcome to your Python Workspace!
echo 1. Install a package
echo 2. List installed packages
echo 3. Run a Python script
echo 4. Exit
echo.
set /p choice=Choose an option (1-4): 

if %choice%==1 (
    set /p package=Enter package name to install: 
    pip install %package%
    goto menu
) else if %choice%==2 (
    pip list
    pause
    goto menu
) else if %choice%==3 (
    set /p script=Enter Python script name to run: 
    python %script%
    pause
    goto menu
) else if %choice%==4 (
    exit
) else (
    echo Invalid choice, please try again.
    goto menu
)




@echo off
setlocal

REM Set the path to your virtual environment's Python executable
set VENV_PATH=workspace\venv\Scripts\python.exe

REM Set the path to the directory containing the Python packages
set PACKAGE_DIR=workspace\venv\python_mods

REM Loop through all files in the PACKAGE_DIR
for %%f in (%PACKAGE_DIR%\*.whl) do (
    echo Installing package %%f
    %VENV_PATH% -m pip install %%f
)

for %%f in (%PACKAGE_DIR%\*.tar.gz) do (
    echo Installing package %%f
    %VENV_PATH% -m pip install %%f
)

echo All packages installed.
pause


