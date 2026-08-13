# To start open the following link (type it to powershell as it is)(maybe need
# to call twice, second one after reboot, 22.12dec.2024):
# * _OR
#   ```powershell
#   START https://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/elektrikArt/Boxstarter_FermaDeployment/master/1_Ferma.ps1
#   ```
# * _OR
#   ```powershell
#   winget install chocolatey.chocolatey
#   choco install --yes git
#   cd ~/Downloads/
#   git clone https://github.com/electricalArt/Boxstarter_FermaDeployment.git
#   cd ./Boxstarter_FermaDeploymentt
#   Set-ExecutionPolicy RemoteSigned
#   .\1_Ferma.ps1
#   ```

Write-BoxstarterMessage `
    -Message ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>START"


function InstallNewWinget()
{
    # The winget has critical problems, see XMind

    Write-BoxstarterMessage `
        -Message ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>InstallNewWinget()"

    # Doesn't work properly
    <#
    choco install winget
    $wingetPath = "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_1.23.1911.0_x64__8wekyb3d8bbwe\"
    [System.Environment]::SetEnvironmentVariable("Path", $env:Path + $wingetPath, [System.EnvironmentVariableTarget]::Machine)
    #>

    # Doesn't work properly
    <#
    Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile winget.msixbundle
    Add-AppPackage -ForceApplicationShutdown .\winget.msixbundle
    Remove-Item .\winget.msixbundle
    #>

    if (!(Get-Command "winget" -ErrorAction "SilentlyContinue"))
    {
        $progressPreference = 'silentlyContinue'
        Write-BoxstarterMessage `
            -Message ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Downloading WinGet and its dependencies... (~215 mb, it may take minutes)"
        Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
        Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile Microsoft.VCLibs.x64.14.00.Desktop.appx
        Invoke-WebRequest -Uri https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x64.appx -OutFile Microsoft.UI.Xaml.2.8.x64.appx
        Add-AppxPackage Microsoft.VCLibs.x64.14.00.Desktop.appx
        Add-AppxPackage Microsoft.UI.Xaml.2.8.x64.appx
        Add-AppxPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
    }

    Write-BoxstarterMessage `
        -Message ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Luck!"
}

# The function is deprecated. Now you use Choco for everything. Winget has
# critical problem, see XMind
function _InstallPackagesWithWinget()
{
        Write-BoxstarterMessage `
        -Message ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>InstallPackagesWithWinget()"

    # Environment
    #winget install --accept-package-agreements --accept-source-agreements --id Gerardog.Gsudo
    #   # Now sudo is built in Windows 11
    winget install --accept-package-agreements --accept-source-agreements --id Microsoft.PowerToys
    winget install --accept-package-agreements --accept-source-agreements --id Vim.Vim 
    winget install --accept-package-agreements --accept-source-agreements --id Alacritty.Alacritty
    winget install --accept-package-agreements --accept-source-agreements --id Highresolution.X-MouseButtonControl
    winget install --accept-package-agreements --accept-source-agreements --id Mozilla.Firefox
    #winget install --accept-package-agreements --accept-source-agreements --id Microsoft.WindowsTerminal
    #winget install --accept-package-agreements --accept-source-agreements --id Microsoft.Powershell    
        # Already installed in the dedicated function
    winget install --accept-package-agreements --accept-source-agreements --id Git.Git
    winget install --accept-package-agreements --accept-source-agreements --id RARLab.WinRAR
    #winget install --accept-package-agreements --accept-source-agreements --id AnydeskSoftwareGmbH.AnyDesk
    winget install --accept-package-agreements --accept-source-agreements --id Microsoft.VisualStudioCode
    winget install --accept-package-agreements --accept-source-agreements --id qBittorrent.qBittorrent
    winget install --accept-package-agreements --accept-source-agreements --id Guru3D.Afterburner
    #winget install --accept-package-agreements --accept-source-agreements --id Brave.Brave
    winget install --accept-package-agreements --accept-source-agreements --id VideoLAN.VLC
    winget install --accept-package-agreements --accept-source-agreements --id Python.Python.3.12
   # winget install --accept-package-agreements --accept-source-agreements --id AutoHotkey.AutoHotkey
    winget install --accept-package-agreements --accept-source-agreements --id Microsoft.PowerToys
    winget install --accept-package-agreements --accept-source-agreements --id Google.GoogleDrive
    winget install --accept-package-agreements --accept-source-agreements --id Kitware.CMake
    winget install --accept-package-agreements --accept-source-agreements --id Ninja-build.Ninja
    winget install --accept-package-agreements --accept-source-agreements --id Balena.Etcher
    winget install --accept-package-agreements --accept-source-agreements --id WiresharkFoundation.Wireshark
        # Needed for Wireshark
        winget install --accept-package-agreements --accept-source-agreements --id Insecure.Npcap
    #winget install --accept-package-agreements --accept-source-agreements --id Oracle.JDK.23
    #   # Why should you install exactly version 23?
    winget install --accept-package-agreements --accept-source-agreements --id Oracle.JavaRuntimeEnvironment
    winget install --accept-package-agreements --accept-source-agreements --id Microsoft.PowetToys
    #winget install --accept-package-agreements --accept-source-agreements --id ****
    	#### Apps that are not available
        #	AIMP.AIMP `
        #	Foxit.FoxitReader `
        #	Parsec.Parsec `
        #   Discord.Discord
    winget install --accept-package-agreements --accept-source-agreements --id Insecure.Nmap

    # Entertaiment
    winget install --accept-package-agreements --accept-source-agreements --id Valve.Steam
    #winget install --accept-package-agreements --accept-source-agreements --id Yandex.Music
}
function InstallPackagesWithChoco()
{
    # Environment
    choco install --confirm --id alacritty
    choco install --confirm --id vim
    choco install --confirm --id pwsh
    choco install --confirm --id googledrive
    choco install --confirm --id exiftool
    choco install --confirm --id vmwareworkstation
    choco install --confirm --id openssh
    choco install --confirm --id openssl
    choco install --confirm --id systeminformer
    choco install --confirm --id powertoys
    choco install --confirm --id firefox
    choco install --confirm --id brave
    choco install --confirm --id googlechrome
    choco install --confirm --id git
    choco install --confirm --id winrar
    choco install --confirm --id qbittorrent
    choco install --confirm --id python39
        # Need for some program (e. g. IDA Pro 7.7)
    choco install --confirm --id python312
    choco install --confirm --id autohotkey
    choco install --confirm --id googledrive
    choco install --confirm --id etcher # Balena Etcher
    choco install --confirm --id wireshark
        # ****Probably for WireShark you need to install npcap 
    choco install --confirm --id nmap
    choco install --confirm --id mitmproxy
    choco install --confirm --id keymapper

    # Production stuff
    choco install --confirm --id cheat x64dbg.portable
    choco install --confirm --id cheat cheatengine
    choco install --confirm --id dotnet-10.0-sdk
    choco install --confirm --id microsoft-openjdk-21
    choco install --confirm --id golang
    choco install --confirm --id opencl-intel-cpu-runtime
    choco install --confirm --id hashcat
    choco install --confirm --id hxd
    choco install --confirm --id vscodium
    
    # Entertaiment
    choco install --confirm --id vlc
    choco install --confirm --id discord
    choco install --confirm --id make
    choco install --confirm --id cmake
    choco install --confirm --id ninja
    #choco install --confirm --id ****


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
    ChangePathVariable -NewEntity "C:\Program Files\XMind"
    ChangePathVariable -NewEntity "C:\Users\musli\AppData\Local\Programs\vcpkg\"
    ChangePathVariable -NewEntity "C:\Users\musli\AppData\Local\Programs\IDA Pro 7.7.220118 (Windows) (x86,x64,ARM64)\"
}
function InstallPowershellModules()
{
    # To skip confirmation (****didn't tested)
    Install-PackageProvider NuGet -Force
    Set-PSRepository PSGallery -InstallationPolicy Trusted

    Install-Module -Name PSTree -Confirm
    Install-Module -Name MagicPacket -Confirm

    # Not available anymore
    #Install-Module -Name Recycle -Confirm
}
function InstallHiddify()
{
    if (Test-Path -Path "C:\Program Files\Hiddify\Hiddify.exe") {
        Write-Output "[InstallHiddify] It is already installed. Skip."
        return
    }
    Invoke-WebRequest https://github.com/hiddify/hiddify-app/releases/download/v2.0.5/Hiddify-Windows-Setup-x64.exe `
        -OutFile $env:TMP/Hiddify-Windows-Setup-x64.exe
    . "$env:TMP/Hiddify-Windows-Setup-x64.exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
}
function InstallXmind()
{
    if (Test-Path -Path "~\AppData\Local\Programs\Xmind\Xmind.exe") {
        Write-Output "[InstallXmind] It is already installed. Skip."
        return
    }
     
    Invoke-WebRequest https://dl3.xmind.app/Xmind-for-Windows-x64bit-24.10.01101-202410202317.exe `
        -OutFile Xmind-for-Windows-x64bit-24.10.01101-202410202317.exe
    ./Xmind-for-Windows-x64bit-24.10.01101-202410202317.exe

    # Block Outbound, Xmind
    New-NetFirewallRule -DisplayName "Block Outbound, Xmind" `
        -Direction Outbound `
        -Program (Resolve-Path "~\AppData\Local\Programs\Xmind\Xmind.exe")  `
        -Action Block
}
function InstallMicrosoftOffice()
{
    if (Test-Path -Path "C:\Program Files (x86)\Microsoft Office\root\Office16\WINWORD.EXE") {
        Write-Output "[InstallMicrosoftOffice] It is already installed. Skip."
        return
    }
    choco install --confirm --id microsoft-office-deployment
        # Microsoft Office 2016 Pro Plus (not activated)

    # Activation
    Invoke-RestMethod https://get.activated.win | Invoke-Expression 
        # After launching script, select option [2] Ohook -> [3] Download Office
}
function InstallPackagesWithPython()
{
    python312 -m pip install --break-system-packages frida-tools==14.8.1 frida==17.9.6
    python312 -m pip install --break-system-packages scapy
}

try {
    # ****It seems that if you run the script using Boxstarter URL, choco is
    #   installed by it

    InstallNewWinget
    #_InstallPackagesWithWinget
    InstallPackagesWithChoco
    InstallPackagesWithPython
    ChangeEnvironmentVariables
    InstallPowershellModules
    InstallHiddify
    InstallXmind
    InstallMicrosoftOffice
 
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

    Update-ExecutionPolicy `
        -Policy "Unrestricted" `
    
    Set-BoxstarterTaskbarOptions -UnLock 
    Set-BoxstarterTaskbarOptions -Dock "Top"
    Set-BoxstarterTaskbarOptions -MultiMonitorOn 
    Set-BoxstarterTaskbarOptions -DisableSearchBox 

    Disable-GameBarTips
    Disable-BingSearch
    Install-WindowsUpdate `
        -AcceptEula

    Write-Output "[Boxstarter_FermaDeploment] Finished."
}
catch 
{
    Write-Error $_
}

