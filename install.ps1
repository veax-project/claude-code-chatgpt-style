<#
.SYNOPSIS
    Installs the ChatGPT-style CLAUDE.md for Claude Code.
.DESCRIPTION
    Backs up any existing ~/.claude/CLAUDE.md before writing, so nothing is lost.
.PARAMETER Variant
    default | no-emoji | concise | chat-only | fr | tr | az
.PARAMETER Append
    Append to your existing CLAUDE.md instead of replacing it.
.EXAMPLE
    .\install.ps1
    .\install.ps1 -Variant concise
    .\install.ps1 -Append
#>
param(
    [ValidateSet('default','no-emoji','concise','chat-only','fr','tr','az')]
    [string]$Variant = 'default',
    [switch]$Append
)

$ErrorActionPreference = 'Stop'

$paths = @{
    'default'   = 'CLAUDE.md'
    'fr'        = 'CLAUDE.fr.md'
    'tr'        = 'CLAUDE.tr.md'
    'az'        = 'CLAUDE.az.md'
    'no-emoji'  = 'variants/no-emoji.md'
    'concise'   = 'variants/concise.md'
    'chat-only' = 'variants/chat-only.md'
}

$base   = 'https://raw.githubusercontent.com/veax-project/claude-code-chatgpt-style/main/'
$source = $base + $paths[$Variant]
$dir    = Join-Path $env:USERPROFILE '.claude'
$target = Join-Path $dir 'CLAUDE.md'

Write-Host ""
Write-Host "  Claude Code - ChatGPT-style responses" -ForegroundColor White
Write-Host "  variant: $Variant" -ForegroundColor DarkGray
Write-Host ""

if (-not (Test-Path $dir)) {
    New-Item -ItemType Directory -Path $dir -Force | Out-Null
    Write-Host "  [ok] created $dir" -ForegroundColor DarkGray
}

Write-Host "  ... downloading" -ForegroundColor DarkGray
try {
    $content = (Invoke-WebRequest -Uri $source -UseBasicParsing).Content
} catch {
    Write-Host "  [!!] download failed: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "       is the repository public yet?" -ForegroundColor DarkGray
    exit 1
}

if (Test-Path $target) {
    $stamp  = Get-Date -Format 'yyyyMMdd-HHmmss'
    $backup = "$target.backup-$stamp"
    Copy-Item $target $backup
    Write-Host "  [ok] existing file backed up" -ForegroundColor Green
    Write-Host "       $backup" -ForegroundColor DarkGray
}

if ($Append -and (Test-Path $target)) {
    Add-Content -Path $target -Value "`r`n`r`n$content" -Encoding utf8
    Write-Host "  [ok] appended to your existing CLAUDE.md" -ForegroundColor Green
} else {
    Set-Content -Path $target -Value $content -Encoding utf8
    Write-Host "  [ok] installed to $target" -ForegroundColor Green
}

Write-Host ""
Write-Host "  NEXT: run /clear or open a new session." -ForegroundColor Yellow
Write-Host "  CLAUDE.md is only read when a session starts." -ForegroundColor DarkGray
Write-Host ""
