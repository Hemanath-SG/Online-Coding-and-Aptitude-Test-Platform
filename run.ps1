Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host "           ApexEval - Enterprise Online Assessment Platform" -ForegroundColor Cyan
Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host "Booting application on http://localhost:8080 ...`n" -ForegroundColor Yellow

if (-not (Test-Path "$PSScriptRoot\target\classes\com\evalplatform\ApexEvalApplication.class")) {
    Write-Host "Compiling Java sources..." -ForegroundColor Cyan
    & "$PSScriptRoot\mvnw.cmd" compile -o
}

if (-not (Test-Path "$PSScriptRoot\classpath.txt")) {
    & "$PSScriptRoot\generate-classpath.ps1"
}

& java "@$PSScriptRoot\classpath.txt"
