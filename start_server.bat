@echo off
title TruthScan AI Server
cd /d "%~dp0"

echo ==========================================================
echo           Starting TruthScan AI Localhost Server
echo ==========================================================
echo.

:: 1. Try starting the built-in PowerShell server (works on all Windows PCs)
echo [1/3] Trying built-in Windows PowerShell Server...
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0server.ps1"
if %errorlevel% equ 0 goto done

:: 2. If PowerShell is restricted, try Python directly
echo.
echo [2/3] Trying Python server...
if exist "%LOCALAPPDATA%\Python\bin\python.exe" (
    start http://localhost:8000
    "%LOCALAPPDATA%\Python\bin\python.exe" -m http.server 8000
    goto done
)

py -m http.server 8000
if %errorlevel% equ 0 goto done

python -m http.server 8000
if %errorlevel% equ 0 goto done

:: 3. If no server engine found, open index.html directly in browser
echo.
echo [3/3] Opening TruthScan directly in your browser...
start "" "%~dp0index.html"

:done
pause
