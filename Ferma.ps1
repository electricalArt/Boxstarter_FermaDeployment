<#
Write-BoxstarterMessage `
    -message ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>START" `

Update-ExecutionPolicy `
    -policy "Unrestricted" `

<#
choco install winget
$wingetPath = "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_1.23.1911.0_x64__8wekyb3d8bbwe\"
[System.Environment]::SetEnvironmentVariable("Path", $env:Path + $wingetPath, [System.EnvironmentVariableTarget]::Machine)
#>
if (Get-Command "wringet" -ErrorAction "SilentlyContinue")
{
    $progressPreference = 'silentlyContinue'
    Write-Information "Downloading WinGet and its dependencies..."
    Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
    Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile Microsoft.VCLibs.x64.14.00.Desktop.appx
    Invoke-WebRequest -Uri https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x64.appx -OutFile Microsoft.UI.Xaml.2.8.x64.appx
    Add-AppxPackage Microsoft.VCLibs.x64.14.00.Desktop.appx
    Add-AppxPackage Microsoft.UI.Xaml.2.8.x64.appx
    Add-AppxPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
}
<#
choco install `
    vim `
    microsoft-windows-terminal `
    powershell-corePowerShell `
    gsudo `
    git `
    winrar `
    VisualStudioCode `
    qbittorrent `
    msiafterburner `
    discord `
#>

function InstallPackagesWithWinget()
{
    # Use choco as default package manager (it has abitliy to specify packages installation directory
    winget install --accept-package-agreements --accept-source-agreements --id Gerardog.Gsudo
    winget install --accept-package-agreements --accept-source-agreements --id Vim.Vim 
    winget install --accept-package-agreements --accept-source-agreements --id Alacritty.Alacritty
    winget install --accept-package-agreements --accept-source-agreements --id Microsoft.WindowsTerminal
    winget install --accept-package-agreements --accept-source-agreements --id Microsoft.Powershell
    winget install --accept-package-agreements --accept-source-agreements --id Git.Git
    winget install --accept-package-agreements --accept-source-agreements --id RARLab.WinRAR
    winget install --accept-package-agreements --accept-source-agreements --id AnydeskSoftwareGmbH.AnyDesk
    winget install --accept-package-agreements --accept-source-agreements --id Microsoft.VisualStudioCode
    winget install --accept-package-agreements --accept-source-agreements --id qBittorrent.qBittorrent
    winget install --accept-package-agreements --accept-source-agreements --id Guru3D.Afterburner
    winget install --accept-package-agreements --accept-source-agreements --id Discord.Discord
    winget install --accept-package-agreements --accept-source-agreements --id Yandex.Music
    winget install --accept-package-agreements --accept-source-agreements --id Brave.Brave
    winget install --accept-package-agreements --accept-source-agreements --id VideoLAN.VLC
    winget install --accept-package-agreements --accept-source-agreements --id Python.Python.3.12
    winget install --accept-package-agreements --accept-source-agreements --id Microsoft.DotNet.SDK.8
    winget install --accept-package-agreements --accept-source-agreements --id AutoHotkey.AutoHotkey
    winget install --accept-package-agreements --accept-source-agreements --id Microsoft.VisualStudio.2022.Community
    winget install --accept-package-agreements --accept-source-agreements --id Microsoft.PowerToys
    #winget install --accept-package-agreements --accept-source-agreements --id ****
    	#### Apps that are not available
        #	AIMP.AIMP `
        #	Foxit.FoxitReader `
        #	Parsec.Parsec `
}
#InstallPackagesWithWinget

function InstallPowershellModules()
{
    Install-Module -Name PSTree
    Install-Module -Name MagicPacket
    Install-Module -Name Recycle
}
#>

function ChangeEnvironmentVariables()
{
    $pathVariable = [Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::User)
    # Should be tested
    if ($pathVariable.Contains("vim") -eq $false)
    {
        [Environment]::SetEnvironmentVariable("Path", ($pathVariable + ";C:\Program Files\Vim\vim91\"), [System.EnvironmentVariableTarget]::User)
        Write-BoxstarterMessage "`Path` variable is changed"
    }
}

ChangeEnvironmentVariables

<#
Set-WindowsExplorerOptions `
    -EnableShowHiddenFilesFoldersDrives `
    -EnableShowProtectedOSFiles `
    -EnableShowFileExtensions `
    -EnableShowFullPathInTitleBar `
    -DisableOpenFileExplorerToQuickAccess `
    -DisableShowRecentFilesInQuickAccess `
    -DisableShowFrequentFoldersInQuickAccess `
    -EnableShowRibbon `
    -EnableSnapAssist `

Set-BoxstarterTaskbarOptions -UnLock 
Set-BoxstarterTaskbarOptions -Dock "Top"
Set-BoxstarterTaskbarOptions -MultiMonitorOn 
Set-BoxstarterTaskbarOptions -DisableSearchBox 

Disable-GameBarTips
Disable-BingSearch

Install-WindowsUpdate `
    -AcceptEula
    
Disable-GameBarTips
Disable-BingSearch

#>