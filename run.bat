@echo off
setlocal
echo ===============================================================================
echo            ApexEval - Enterprise Online Assessment Platform
echo ===============================================================================
echo Starting application on http://localhost:8080 ...
echo.

if not exist "target\classes\com\evalplatform\ApexEvalApplication.class" (
    echo Compiling source code...
    call mvnw.cmd compile -o
)

if not exist "classpath.txt" (
    echo Generating classpath...
    powershell -ExecutionPolicy Bypass -File "%~dp0generate-classpath.ps1"
)

java @classpath.txt
pause
