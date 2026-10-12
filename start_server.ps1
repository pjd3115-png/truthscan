# TruthScan Localhost Launcher
Set-Location -Path $PSScriptRoot
Write-Host "======================================================" -ForegroundColor Cyan
Write-Host "   Starting TruthScan AI on Localhost (Port 8000)" -ForegroundColor Green
Write-Host "   Website URL: http://localhost:8000" -ForegroundColor Yellow
Write-Host "======================================================" -ForegroundColor Cyan

Start-Process "http://localhost:8000"
python -m http.server 8000
