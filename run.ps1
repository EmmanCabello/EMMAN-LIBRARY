$ErrorActionPreference = "Stop"
$env:JAVA_HOME = "C:\Program Files\Java\jdk-23"
$short = (cmd /c "for %I in (`"$PSScriptRoot`") do @echo %~sI").Trim()
if (-not $short) { $short = $PSScriptRoot }
Set-Location $short

$mavenHome = "C:\Users\Emman Cabello\apache-maven-3.9.9"
if (-not (Test-Path "$mavenHome\bin\mvn.cmd")) {
    $localMaven = Join-Path $short ".tools\apache-maven-3.9.9"
    if (-not (Test-Path "$localMaven\bin\mvn.cmd")) {
        New-Item -ItemType Directory -Force -Path (Join-Path $short ".tools") | Out-Null
        $zip = Join-Path $short ".tools\maven.zip"
        Write-Host "Downloading Apache Maven 3.9.9..."
        Invoke-WebRequest -UseBasicParsing -Uri "https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.9.9/apache-maven-3.9.9-bin.zip" -OutFile $zip
        Expand-Archive -Path $zip -DestinationPath (Join-Path $short ".tools") -Force
    }
    Copy-Item -Recurse -Force $localMaven $mavenHome
}

$env:MAVEN_HOME = $mavenHome
Write-Host "Packaging Lumina..."
& "$mavenHome\bin\mvn.cmd" -DskipTests package
$runDir = "C:\Users\Emman Cabello\lumina-run"
New-Item -ItemType Directory -Force -Path $runDir | Out-Null
Copy-Item "target\lumina-elibrary-1.0.0.jar" "$runDir\lumina-elibrary-1.0.0.jar" -Force
Set-Location $runDir
Write-Host "Starting Lumina on http://localhost:8080"
& "$env:JAVA_HOME\bin\java.exe" -jar "lumina-elibrary-1.0.0.jar"
