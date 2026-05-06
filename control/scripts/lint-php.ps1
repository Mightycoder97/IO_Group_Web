param(
    [string]$PhpPath = ""
)

$ErrorActionPreference = "Stop"

if ([string]::IsNullOrWhiteSpace($PhpPath)) {
    $command = Get-Command php -ErrorAction SilentlyContinue
    if ($command) {
        $PhpPath = $command.Source
    }
}

if ([string]::IsNullOrWhiteSpace($PhpPath)) {
    $wingetPhp = Join-Path $env:LOCALAPPDATA "Microsoft\WinGet\Packages\PHP.PHP.8.4_Microsoft.Winget.Source_8wekyb3d8bbwe\php.exe"
    if (Test-Path $wingetPhp) {
        $PhpPath = $wingetPhp
    }
}

if ([string]::IsNullOrWhiteSpace($PhpPath) -or -not (Test-Path $PhpPath)) {
    throw "PHP executable not found. Install PHP or pass -PhpPath C:\path\to\php.exe"
}

$root = Resolve-Path (Join-Path $PSScriptRoot "..")
$files = Get-ChildItem -Path $root -Recurse -File -Include *.php |
    Where-Object { $_.FullName -notmatch "\\vendor\\" }

$errors = @()
foreach ($file in $files) {
    $output = & $PhpPath -l $file.FullName 2>&1
    if ($LASTEXITCODE -ne 0) {
        $errors += [PSCustomObject]@{
            File = $file.FullName
            Output = ($output -join "`n")
        }
    }
}

if ($errors.Count -gt 0) {
    $errors | Format-List
    exit 1
}

Write-Host "PHP lint OK: $($files.Count) files"
