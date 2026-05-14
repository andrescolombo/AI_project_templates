# Run this from the root of any new project to link AI template files
# Requires PowerShell Core (pwsh) on Linux/macOS
#
# Usage:
#   Windows:       & "D:\Desarrollo\.ai-templates\setup-ai-templates.ps1"
#   Linux/macOS:   pwsh ~/Desarrollo/.ai-templates/setup-ai-templates.ps1
#
# Override templates location with env var: $env:AI_TEMPLATES_DIR

param(
    [string]$Path = (Get-Location),
    [switch]$Copy # Set this flag to copy instead of symlink
)

$files = @(
    "AGENTS.md",
    "CLAUDE.md",
    "CURSORRULES",
    "GEMINI.md",
    "HANDOVER.md",
    "HANDOVER_TASK.md",
    "CONVERSATION_INSIGHTS.md"
)

# Resolve templates directory
if ($env:AI_TEMPLATES_DIR) {
    $baseDir = $env:AI_TEMPLATES_DIR
} elseif ($IsWindows -or $env:OS -eq "Windows_NT") {
    $baseDir = "D:\Desarrollo\.ai-templates"
} else {
    $baseDir = "$HOME/Desarrollo/.ai-templates"
}

$templates = $baseDir

# Elevation check for Windows (required for SymbolicLinks if not copying)
if (-not $Copy) {
    $isWin = $IsWindows -or $env:OS -eq "Windows_NT"
    if ($isWin -and -not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Write-Host "Requesting administrator privileges to create symbolic links..." -ForegroundColor Cyan
        $argList = "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" -Path `"$Path`""
        try {
            Start-Process powershell.exe -ArgumentList $argList -Verb RunAs -Wait
            exit
        } catch {
            Write-Warning "Elevation failed or was cancelled. Script might fail to create symbolic links."
        }
    }
}

if (-not (Test-Path $templates)) {
    Write-Error "Templates directory not found: $templates"
    Write-Host "Set `$env:AI_TEMPLATES_DIR to point to your .ai-templates clone." -ForegroundColor Yellow
    exit 1
}

$target = $Path
Write-Host "Initializing AI templates in: $target" -ForegroundColor Green
Write-Host "Using templates from: $templates" -ForegroundColor Gray
Write-Host "----------------------------------------------------"

foreach ($file in $files) {
    $src = Join-Path $templates $file
    $dst = Join-Path $target $file

    if (-not (Test-Path $src)) {
        Write-Host "[-] Skipped (not in templates folder): $file" -ForegroundColor Yellow
        continue
    }

    if (Test-Path $dst) {
        Write-Host "[!] Skipped (already exists in target): $file" -ForegroundColor Gray
        continue
    }

    try {
        if ($Copy) {
            Copy-Item -Path $src -Destination $dst -Force -ErrorAction Stop
            Write-Host "[+] Copied: $file" -ForegroundColor Green
        } else {
            New-Item -ItemType SymbolicLink -Path $dst -Target $src -Force -ErrorAction Stop | Out-Null
            Write-Host "[+] Linked: $file" -ForegroundColor Green
        }
    } catch {
        Write-Error "Failed to process $file. Error: $($_.Exception.Message)"
    }
}

Write-Host "----------------------------------------------------"
Write-Host "Done. AI templates ready in $target" -ForegroundColor Green

