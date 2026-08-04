# Docker Desktop 실행 + 엔진 준비될 때까지 대기
$ErrorActionPreference = "Continue"
$exe = "C:\Users\a\AppData\Local\Programs\DockerDesktop\Docker Desktop.exe"

docker info 2>$null | Out-Null
if ($LASTEXITCODE -eq 0) {
    Write-Host "[OK] Docker engine already running."
    docker version
    exit 0
}

if (-not (Test-Path $exe)) {
    Write-Host "[ERR] Docker Desktop not found: $exe"
    Write-Host "Install Docker Desktop or fix the path."
    exit 1
}

Write-Host "[..] Starting Docker Desktop..."
Write-Host "    Leave the whale icon in the tray. Do NOT Quit until done."
Start-Process $exe

$max = 90
for ($i = 1; $i -le $max; $i++) {
    Start-Sleep -Seconds 2
    docker info 2>$null | Out-Null
    if ($LASTEXITCODE -eq 0) {
        Write-Host "[OK] Engine ready after $($i * 2) seconds."
        docker version
        exit 0
    }
    if ($i % 5 -eq 0) {
        Write-Host "    waiting... $($i * 2)s / $($max * 2)s"
    }
}

Write-Host "[ERR] Engine did not start. Open Docker Desktop UI and wait until it says Running."
exit 1
