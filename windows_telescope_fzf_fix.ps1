<#
    .SYNOPSIS
    Setup an MSYS2 environment including the minimum tools needed for building neovim on Windows.

    .DESCRIPTION
    The script will download the latest nightly release of the MSYS2 installer
    and install all the packges required for building neovim on Windows.

    Requies administrative privilages because the MSYS2 installation must go into `C:\msys64`.

    .EXAMPLE
    .\bootstrap_msys2.ps1

    .LINK
    https://www.msys2.org/

    .LINK
    https://github.com/neovim/neovim/wiki/Building-Neovim#building-on-windows

    .NOTES
    Based on AppVeyor's installer: https://github.com/appveyor/build-images/blob/master/scripts/Windows/install_msys64.ps1
#>

$ErrorActionPreference = "Stop" # exit when command fails

#Requires -RunAsAdministrator
#Requires -Version 5.1

if (Test-Path C:\msys64) {
    Write-Host "Removing old MSYS2 installation..." -ForegroundColor Magenta
    Remove-Item C:\msys64 -Recurse -Force
}

Import-Module BitsTransfer

$url = "https://github.com/msys2/msys2-installer/releases/download/nightly-x86_64/msys2-base-x86_64-latest.sfx.exe"
$msys_installer = "$env:TEMP\msys2-installer.exe"

Write-Host "Installing MSYS2..." -ForegroundColor Cyan
Start-BitsTransfer -Source $url -Destination $msys_installer

# Extract to C:\msys64
& $msys_installer in --confirm-command --accept-messages --root C:/msys64
Remove-Item $msys_installer

function bash($command) {
    Write-Host $command -NoNewline
    C:\msys64\usr\bin\bash.exe --login -c $command
    Write-Host " - OK" -ForegroundColor Green
}

[Environment]::SetEnvironmentVariable("MSYS2_PATH_TYPE", "inherit", "Machine")

# install latest pacman
#bash 'pacman -Sy --noconfirm pacman pacman-mirrors'

# Avoid pacman "warning" which causes non-zero return code. https://github.com/open62541/open62541/issues/2068
bash "mkdir -p /var/cache/pacman/pkg"

# update core packages
bash "pacman -Syuu --noconfirm --noprogressbar && ps -ef | grep 'dirmngr' | grep -v grep | awk '{print `$2}' | xargs -r kill -9 && ps -ef | grep 'gpg-agent' | grep -v grep | awk '{print `$2}' | xargs -r kill -9"
bash "pacman -Syuu --noconfirm --noprogressbar && ps -ef | grep 'gpg-agent' | grep -v grep | awk '{print `$2}' | xargs -r kill -9"

# install packages
bash 'pacman --sync --noconfirm msys2-devel'
bash 'pacman --sync --noconfirm base-devel'
bash 'pacman --sync --noconfirm mingw-w64-x86_64-{gcc,libtool,cmake,make,perl,python2,pkg-config,ninja,diffutils} gperf'

Write-Host "MSYS2 installed" -ForegroundColor Green
