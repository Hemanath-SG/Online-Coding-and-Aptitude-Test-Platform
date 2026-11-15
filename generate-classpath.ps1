# Script to prepare the offline runtime classpath for ApexEval Platform
Write-Host "Scanning local Maven repository for runtime dependencies..." -ForegroundColor Cyan

$allJars = Get-ChildItem -Path "$env:USERPROFILE\.m2\repository" -Recurse -Filter "*.jar" | 
    Where-Object { 
        $_.FullName -notmatch "org\\apache\\maven" -and 
        $_.FullName -notmatch "org\\sonatype" -and 
        $_.FullName -notmatch "org\\codehaus\\plexus" -and 
        $_.FullName -notmatch "org\\codehaus\\mojo" -and 
        $_.FullName -notmatch "com\\thoughtworks\\qdox" -and 
        $_.FullName -notmatch "slf4j-api\\1\.7\."
    } | Select-Object -ExpandProperty FullName

$cp = "target\classes;" + ($allJars -join ";")
[System.IO.File]::WriteAllText("$PSScriptRoot\classpath.txt", "-cp`n$cp`ncom.evalplatform.ApexEvalApplication")

Write-Host "Classpath generated successfully with $($allJars.Count) libraries." -ForegroundColor Green
