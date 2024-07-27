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

# Use choco as default package manager (it has abitliy to specify packages installation directory
function InstallPackagesWithWinget()
{
    winget install --accept-package-agreements --accept-source-agreements --id `
    	Vim.Vim `
    	Alacritty.Alacritty `
    	Microsoft.WindowsTerminal `
    	Microsoft.Powershell `
    	Gerardog.Gsudo `
    	Git.Git `
    	RARLab.WinRAR `
    	AnydeskSoftwareGmbH.AnyDesk `
    	Microsoft.VisualStudioCode `
    	qBittorrent.qBittorrent `
    	Guru3D.Afterburner `
    	Discord.Discord `
    	Yandex.Music `
    	Brave.Brave `
    	VideoLAN.VLC `
        Python.Python.3.12 `
        Microsoft.DotNet.SDK.8 `
        AutoHotkey.AutoHotkey `
    	#### Apps that are not available
        #	AIMP.AIMP `  
        #	Foxit.FoxitReader `
        #	Parsec.Parsec `
}

InstallPackagesWithWinget


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
