Write-BoxstarterMessage `
    -message ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>START" `

Update-ExecutionPolicy `
    -policy "Unrestricted" `

<#
choco install winget
$wingetPath = "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_1.23.1911.0_x64__8wekyb3d8bbwe\"
[System.Environment]::SetEnvironmentVariable("Path", $env:Path + $wingetPath, [System.EnvironmentVariableTarget]::Machine)
#>
$winget_release = "https://github.com/microsoft/winget-cli/releases/download/v1.0.11451/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle"
Invoke-WebRequest -Uri $winget_release -OutFile ~/Downloads/Microsoft.DesktopAppInstaller.appxbundle -UseBasicParsing
Add-AppxPackage -Path ~/Downloads/Microsoft.DesktopAppInstaller.appxbundle
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
winget install --silent `
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
