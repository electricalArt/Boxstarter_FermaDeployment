Write-BoxstarterMessage `
    -message ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>START" `

Update-ExecutionPolicy `
    -policy "Unrestricted" `

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

Install-WindowsUpdate `
    -AcceptEula

Set-BoxstarterTaskbarOptions -UnLock 
Set-BoxstarterTaskbarOptions -Dock "Top"
Set-BoxstarterTaskbarOptions -MultiMonitorOn 
Set-BoxstarterTaskbarOptions -DisableSearchBox 

Disable-GameBarTips
Disable-BingSearch

# Use `winget` as standard package manager
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
