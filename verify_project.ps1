# PowerShell script to verify project structure
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "System Monitor Tool - Project Verification" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check source files
Write-Host "Checking source files..." -ForegroundColor Yellow
$sourceFiles = @(
    "src\main.cpp",
    "src\system_monitor.cpp",
    "src\system_info.cpp",
    "src\process_info.cpp",
    "src\ui.cpp"
)

$allSourceExists = $true
foreach ($file in $sourceFiles) {
    if (Test-Path $file) {
        Write-Host "  [OK] $file" -ForegroundColor Green
    } else {
        Write-Host "  [MISSING] $file" -ForegroundColor Red
        $allSourceExists = $false
    }
}

# Check header files
Write-Host ""
Write-Host "Checking header files..." -ForegroundColor Yellow
$headerFiles = @(
    "include\system_monitor.h",
    "include\system_info.h",
    "include\process_info.h",
    "include\ui.h"
)

$allHeadersExist = $true
foreach ($file in $headerFiles) {
    if (Test-Path $file) {
        Write-Host "  [OK] $file" -ForegroundColor Green
    } else {
        Write-Host "  [MISSING] $file" -ForegroundColor Red
        $allHeadersExist = $false
    }
}

# Check configuration files
Write-Host ""
Write-Host "Checking configuration files..." -ForegroundColor Yellow
$configFiles = @(
    "CMakeLists.txt",
    ".gitignore",
    "README.md"
)

foreach ($file in $configFiles) {
    if (Test-Path $file) {
        Write-Host "  [OK] $file" -ForegroundColor Green
    } else {
        Write-Host "  [MISSING] $file" -ForegroundColor Red
    }
}

# Summary
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
if ($allSourceExists -and $allHeadersExist) {
    Write-Host "✓ Project structure is complete!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Yellow
    Write-Host "1. Install WSL Ubuntu: wsl --install -d Ubuntu" -ForegroundColor White
    Write-Host "2. Open WSL and navigate to: /mnt/c/Users/DELL/wipro" -ForegroundColor White
    Write-Host "3. Build: mkdir build && cd build && cmake .. && make" -ForegroundColor White
    Write-Host "4. Run: ./system_monitor" -ForegroundColor White
} else {
    Write-Host "✗ Some files are missing!" -ForegroundColor Red
}
Write-Host "========================================" -ForegroundColor Cyan

