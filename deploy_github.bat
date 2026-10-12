@echo off
title TruthScan AI - Deploy to GitHub
cd /d "%~dp0"

echo ==========================================================
echo         TruthScan AI - Push & Deploy to GitHub
echo ==========================================================
echo.
echo All files are committed to local Git.
echo.
echo Please create a new repository at: https://github.com/new
echo (Repository Name: truthscan, set to Public)
echo.
set /p REPO="Paste your GitHub Repository URL (e.g. https://github.com/YOUR_USERNAME/truthscan.git): "

if "%REPO%"=="" (
    echo No URL entered. Exiting...
    pause
    exit /b
)

echo.
echo Adding remote and pushing to main branch...
git remote remove origin 2>nul
git remote add origin %REPO%
git branch -M main
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ==========================================================
    echo SUCCESS! Code successfully pushed to GitHub!
    echo.
    echo NEXT STEP TO MAKE IT LIVE:
    echo 1. Open your repository on GitHub.
    echo 2. Go to: Settings -> Pages
    echo 3. Under Branch, select 'main' and click 'Save'.
    echo 4. Your website will be live in 1 minute!
    echo ==========================================================
) else (
    echo.
    echo Push failed. Please check your GitHub permissions and URL.
)

pause
