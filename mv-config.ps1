# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force -ErrorAction Stop
# --- CONFIG ---
$steamLibs = @(
    "$env:ProgramFiles (x86)\Steam",
    "$env:ProgramFiles\Steam"
)

$cs2Path = $null
foreach ($steamBase in $steamLibs) {
    $testPath = Join-Path $steamBase "steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg"
    if (Test-Path $testPath) {
        $cs2Path = $testPath
        break
    }
}


if (-not $cs2Path) {
    Write-Host "Could not find CS2 installation directory."
    exit 1
}

# Copy the new file
Copy-Item  ".\autoexec.cfg" $cs2Path -Force
Write-Host "autoexec.cfg copied successfully."
