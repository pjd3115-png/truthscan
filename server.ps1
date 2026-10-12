# TruthScan Built-in Windows HTTP Server (No Python or external tools needed!)
$ErrorActionPreference = "SilentlyContinue"
$port = 8080
$dir = $PSScriptRoot
if (-not $dir) { $dir = (Get-Location).Path }

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "        TruthScan AI - Localhost Server                   " -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Cyan

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")
$listener.Prefixes.Add("http://127.0.0.1:$port/")

try {
    $listener.Start()
} catch {
    $port = 8000
    $listener = New-Object System.Net.HttpListener
    $listener.Prefixes.Add("http://localhost:$port/")
    $listener.Prefixes.Add("http://127.0.0.1:$port/")
    $listener.Start()
}

$url = "http://localhost:$port"
Write-Host "Server successfully started at: $url" -ForegroundColor Green
Write-Host "Opening your default browser..." -ForegroundColor Cyan
Start-Process $url

Write-Host "Server is running! To stop the server, close this window." -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Cyan

while ($listener.IsListening) {
    try {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response
        
        $localPath = $request.Url.LocalPath.TrimStart('/')
        if ([string]::IsNullOrWhiteSpace($localPath) -or $localPath -eq "/") {
            $localPath = "index.html"
        }
        
        $filePath = Join-Path $dir $localPath
        
        if (Test-Path $filePath -PathType Leaf) {
            $bytes = [System.IO.File]::ReadAllBytes($filePath)
            if ($filePath.EndsWith(".html")) { $response.ContentType = "text/html; charset=utf-8" }
            elseif ($filePath.EndsWith(".js")) { $response.ContentType = "application/javascript" }
            elseif ($filePath.EndsWith(".css")) { $response.ContentType = "text/css" }
            elseif ($filePath.EndsWith(".json")) { $response.ContentType = "application/json" }
            elseif ($filePath.EndsWith(".png")) { $response.ContentType = "image/png" }
            elseif ($filePath.EndsWith(".svg")) { $response.ContentType = "image/svg+xml" }
            else { $response.ContentType = "application/octet-stream" }
            
            $response.ContentLength64 = $bytes.Length
            $response.OutputStream.Write($bytes, 0, $bytes.Length)
        } else {
            $response.StatusCode = 404
            $notFoundBytes = [System.Text.Encoding]::UTF8.GetBytes("404 File Not Found")
            $response.OutputStream.Write($notFoundBytes, 0, $notFoundBytes.Length)
        }
        $response.Close()
    } catch {
        # ignore client disconnects
    }
}
