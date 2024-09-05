# To start open the following link:
#   START https://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/elektrikArt/Boxstarter_FermaDeployment/master/1_Ferma.ps1
#

Write-BoxstarterMessage `
    -Message ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>START" `

Update-ExecutionPolicy `
    -Policy "Unrestricted" `


function InstallNewWinget()
{
    <#
    choco install winget
    $wingetPath = "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_1.23.1911.0_x64__8wekyb3d8bbwe\"
    [System.Environment]::SetEnvironmentVariable("Path", $env:Path + $wingetPath, [System.EnvironmentVariableTarget]::Machine)
    #>

    <#
    Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile winget.msixbundle
    Add-AppPackage -ForceApplicationShutdown .\winget.msixbundle
    Remove-Item .\winget.msixbundle
    #>

    if (!(Get-Command "winget" -ErrorAction "SilentlyContinue"))
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
}
function InstallPackagesWithWinget()
{
    # Environment
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
    winget install --accept-package-agreements --accept-source-agreements --id Valve.Steam
    winget install --accept-package-agreements --accept-source-agreements --id Discord.Discord
    winget install --accept-package-agreements --accept-source-agreements --id Yandex.Music
    winget install --accept-package-agreements --accept-source-agreements --id Brave.Brave
    winget install --accept-package-agreements --accept-source-agreements --id VideoLAN.VLC
    winget install --accept-package-agreements --accept-source-agreements --id Python.Python.3.12
    winget install --accept-package-agreements --accept-source-agreements --id AutoHotkey.AutoHotkey
    winget install --accept-package-agreements --accept-source-agreements --id Microsoft.PowerToys
    winget install --accept-package-agreements --accept-source-agreements --id Highresolution.X-MouseButtonControl
    winget install --accept-package-agreements --accept-source-agreements --id Google.GoogleDrive
    winget install --accept-package-agreements --accept-source-agreements --id Mozilla.Firefox
    #winget install --accept-package-agreements --accept-source-agreements --id ****
    	#### Apps that are not available
        #	AIMP.AIMP `
        #	Foxit.FoxitReader `
        #	Parsec.Parsec `
}
function InstallPackagesWithChoco()
{
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
    choco install --confirm --id cheat x64dbg.portable
    choco install --confirm --id cheat cheatengine
    #choco install --confirm --id ****
}
function InstallPowershellModules()
{
    Install-Module -Name PSTree
    Install-Module -Name MagicPacket
    Install-Module -Name Recycle
}
function ChangePathVariable()
{
    param(
        [string]$NewEntity
    )
    $pathVariable = [Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::User)
    if ($pathVariable.Contains($NewEntity) -eq $false)
    {
        [Environment]::SetEnvironmentVariable("Path", ($pathVariable + ";" + $NewEntity), [System.EnvironmentVariableTarget]::User)
        Write-BoxstarterMessage "`Path` variable is changed"
    }
}
function ChangeEnvironmentVariables()
{
    ChangePathVariable -NewEntity "C:\Program Files\Vim\vim91\"
    ChangePathVariable -NewEntity "C:\Users\musli\AppData\Local\Programs\XMind_Pro_2023_23.05__x64__Ml_ru__Portable\XMind_Pro_2023_23.05__x64__Ml_ru__Portable"
}


try
{
    InstallNewWinget
    InstallPackagesWithWinget
    InstallPackagesWithChoco
    InstallPowershellModules
    ChangeEnvironmentVariables
    
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
}
catch 
{
    Write-Error $_
}

