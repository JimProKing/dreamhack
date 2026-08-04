# blue-whale (#853) — Hub 이미지 레이어에서 삭제된 flag 복구
# 사용:
#   1) Docker Desktop 실행 (Server 뜰 때까지)
#   2) powershell -ExecutionPolicy Bypass -File .\solve.ps1

$ErrorActionPreference = "Continue"
$Image = "dreamhackofficial/blue-whale:1"
$Work = Join-Path $PSScriptRoot "_work"

Write-Host "=== blue-whale solve ==="
Write-Host "NOTE: Do NOT docker build. We analyze Hub image layers."
Write-Host ""

# 1) Docker engine
docker info 2>$null | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Host "[!] Docker engine not running. Starting Desktop..."
    & (Join-Path $PSScriptRoot "start-docker.ps1")
    if ($LASTEXITCODE -ne 0) { exit 1 }
}

# 2) Pull
Write-Host "[..] docker pull $Image"
docker pull $Image
if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERR] pull failed — is Docker Desktop fully started?"
    exit 1
}

# 3) Final filesystem has no flag
Write-Host "[..] final container /home/chall (flag should be gone):"
docker run --rm --entrypoint ls $Image -la /home/chall

# 4) Save + unpack
if (Test-Path $Work) { Remove-Item $Work -Recurse -Force }
New-Item -ItemType Directory -Path $Work | Out-Null
$tarPath = Join-Path $Work "image.tar"
$unpack = Join-Path $Work "unpacked"
New-Item -ItemType Directory -Path $unpack | Out-Null

Write-Host "[..] docker save ..."
docker save $Image -o $tarPath
if (-not (Test-Path $tarPath)) { Write-Host "[ERR] save failed"; exit 1 }

Write-Host "[..] unpack image.tar ..."
tar -xf $tarPath -C $unpack
if ($LASTEXITCODE -ne 0) { Write-Host "[ERR] tar extract image failed"; exit 1 }

# 5) Only layer blobs listed in manifest.json
$manifestPath = Join-Path $unpack "manifest.json"
if (-not (Test-Path $manifestPath)) {
    Write-Host "[ERR] manifest.json missing"
    exit 1
}
$manifest = Get-Content $manifestPath -Raw | ConvertFrom-Json
$layerRelPaths = @($manifest[0].Layers)
Write-Host "[..] scanning $($layerRelPaths.Count) layers ..."

$flags = New-Object System.Collections.Generic.List[string]

foreach ($rel in $layerRelPaths) {
    $blob = Join-Path $unpack ($rel -replace '/', '\')
    if (-not (Test-Path $blob)) {
        Write-Host "  skip missing $rel"
        continue
    }

    $names = & tar -tf $blob 2>$null
    if ($LASTEXITCODE -ne 0) { continue }

    $interesting = $names | Where-Object { $_ -match 'flag|DH\{|\.wh\.' }
    if (-not $interesting) { continue }

    $layerOut = Join-Path $Work ("layer_" + [IO.Path]::GetFileName($rel).Substring(0, 12))
    New-Item -ItemType Directory -Path $layerOut -Force | Out-Null
    & tar -xf $blob -C $layerOut 2>$null

    Get-ChildItem $layerOut -Recurse -File -Force -ErrorAction SilentlyContinue | ForEach-Object {
        if ($_.Name -eq "flag" -and $_.Length -gt 0 -and $_.Length -lt 500) {
            $content = ([IO.File]::ReadAllText($_.FullName)).Trim()
            if ($content -match '^DH\{.+\}$') {
                if (-not $flags.Contains($content)) { $flags.Add($content) }
                Write-Host "[+] flag file content: $content"
            }
        }
        if ($_.Name -match '^DH\{.+\}$') {
            if (-not $flags.Contains($_.Name)) { $flags.Add($_.Name) }
            Write-Host "[+] flag as filename: $($_.Name)"
        }
        if ($_.Name -match '^\.wh\.(DH\{.+\})$') {
            $n = $Matches[1]
            if (-not $flags.Contains($n)) { $flags.Add($n) }
            Write-Host "[i] whiteout (was deleted later): $n"
        }
    }
}

Write-Host ""
if ($flags.Count -eq 0) {
    Write-Host "[ERR] No flag found."
    exit 1
}

Write-Host "========== FLAG =========="
$flags | ForEach-Object { Write-Host $_ }
Write-Host "=========================="
Write-Host "Submit the DH{...} line on Dreamhack."
