# i1KosarCONNOR - File Installer
# Downloads and replaces files in the correct locations

Write-Host "i1KosarCONNOR Installer" -ForegroundColor Cyan
Write-Host "Installing files, please wait..." -ForegroundColor Yellow

try {
    # Create all folders if they don't exist
    $folders = @(
        "C:\Program Files (x86)\Steam\plugins\luatools\public",
        "C:\Program Files (x86)\Steam\plugins\luatools\backend\locales",
        "C:\Program Files (x86)\Steam\plugins\luatools\backend",
        "C:\Program Files (x86)\Steam\plugins\luatools"
    )
    foreach ($folder in $folders) {
        if (!(Test-Path $folder)) {
            New-Item -ItemType Directory -Path $folder -Force | Out-Null
            Write-Host "Created folder: $folder" -ForegroundColor DarkGray
        }
    }

    # 1. luatools.js → public folder
    Write-Host "`n[1/5] Installing luatools.js..." -ForegroundColor White
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/CONNORKURD/Alpha-1/refs/heads/main/luatools.js" `
        -OutFile "C:\Program Files (x86)\Steam\plugins\luatools\public\luatools.js" -UseBasicParsing
    Write-Host "      Done!" -ForegroundColor Green

    # 2. en.json → backend/locales folder
    Write-Host "[2/5] Installing en.json..." -ForegroundColor White
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/CONNORKURD/Alpha-1/refs/heads/main/en.json" `
        -OutFile "C:\Program Files (x86)\Steam\plugins\luatools\backend\locales\en.json" -UseBasicParsing
    Write-Host "      Done!" -ForegroundColor Green

    # 3. plugin.json → luatools root folder
    Write-Host "[3/5] Installing plugin.json..." -ForegroundColor White
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/CONNORKURD/Alpha-1/refs/heads/main/plugin.json" `
        -OutFile "C:\Program Files (x86)\Steam\plugins\luatools\plugin.json" -UseBasicParsing
    Write-Host "      Done!" -ForegroundColor Green

    # 4. luatools-icon.png → public folder
    Write-Host "[4/5] Installing luatools-icon.png..." -ForegroundColor White
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/CONNORKURD/Alpha-1/refs/heads/main/luatools-icon.png" `
        -OutFile "C:\Program Files (x86)\Steam\plugins\luatools\public\luatools-icon.png" -UseBasicParsing
    Write-Host "      Done!" -ForegroundColor Green

    # 5. logger.py → backend folder
    Write-Host "[5/5] Installing logger.py..." -ForegroundColor White
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/CONNORKURD/Alpha-1/refs/heads/main/logger.py" `
        -OutFile "C:\Program Files (x86)\Steam\plugins\luatools\backend\logger.py" -UseBasicParsing
    Write-Host "      Done!" -ForegroundColor Green

    Write-Host "`n✔ All files installed successfully!" -ForegroundColor Green
    Write-Host "Please restart Steam to apply changes." -ForegroundColor Cyan

} catch {
    Write-Host "`n ERROR: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`nPress any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
