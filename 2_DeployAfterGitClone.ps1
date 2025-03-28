##  After that you need sign out and sign in.
#~\ArtHome\Scripts\Boxstarter_FermaDeployment\15-capslock_to_ctrl.reg

function New-SymbolicLink {
    param(
        [string]$Path,
        [string]$Target
    )
    try
    {
        Remove-Item -Path $Path -Force -Recurse 2>$null
        New-Item -Path $Path -ItemType "SymbolicLink" -Target $Target -Force
    }
    catch
    {
        Write-Output ("Path: " + $Path)
        Write-Output ("Target: " + $Target)
        Write-Output $_
    }
}
$Startup = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\"


function SetupGit()
{
    New-SymbolicLink -Path "$env:HOMEPATH\.gitconfig" -Target "$env:HOMEPATH\ArtHome\.gitconfig"
}

function SetupPowershell()
{
    New-Item -Type "Directory" ~\Documents\Powershell\ -Force
    New-SymbolicLink `
        -Path $PROFILE.CurrentUserAllHosts `
        -Target "C:/Users/musli/ArtHome/.config/powershell/profile.ps1" 
    New-SymbolicLink -Path $PROFILE.AllUsersAllHosts -Target $PROFILE.CurrentUserAllHosts
}

function SetupWindowsTerminal()
{
    New-SymbolicLink -Path "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" `
        -Target "$env:HOMEPATH\ArtHome\.config\_Windows\WindowsTerminal\settings.json"
    
    # Alacritty
    New-SymbolicLink -Path "$env:APPDATA\alacritty" -Target "$env:HOMEPATH\ArtHome\.config\alacritty\"
}

# Vim
function SetupVim
{
    New-SymbolicLink -Path "$env:HOMEPATH\_vimrc" -Target "C:/Users/musli/ArtHome/.vimrc"`
}

function SetupMSVisualStudioCode()
{
    New-Item -Type "Directory" -Path "$env:APPDATA\Code\User\" -Force
    New-SymbolicLink -Path "$env:APPDATA\Code\User\settings.json" -Target "C:/Users/musli/ArtHome/.config/Code/User/settings.json"
    
    # XMouseButtonControl (trackball mouse utility)
    New-Item -Type "Directory" -Path "$env:APPDATA\Highresolution Enterprises\XMouseButtonControl\" -Force
    New-SymbolicLink `
        -Path "$env:APPDATA/Highresolution Enterprises/XMouseButtonControl/musli''s XMBC Profile.xmbcp" `
        -Target 'C:/Users/musli/ArtHome/.config/_Windows/musli''s XMBC Profile.xmbcp'
}

function SetupStartupDirectory()
{
    Remove-Item $env:TEMP\saved\ -Recurse -Force 2> $null
    Move-Item $Startup $env:TEMP\saved\ -Force 2> $null
    try
    {
        New-SymbolicLink -Path $Startup -Target "$env:HOMEPATH\ArtHome\.config\_Windows\Startup\"
    }
    catch
    {
        Write-Output $_
        Move-Item $env:TEMP\saved\ $Startup
    }
}

function SetupVisualStudio()
{
    # Settings
    New-Item -Type "Directory" -Path "$env:LOCALAPPDATA\Microsoft\VisualStudio\17.0_fde06190\Settings" -Force
    New-SymbolicLink `
        -Path "$env:LOCALAPPDATA\Microsoft\VisualStudio\17.0_fde06190\Settings\CurrentSettings.vssettings" `
        -Target "C:\Users\musli\ArtHome\.config\_Windows\VisualStudio\VisualStudio.vssettings"
    # Templates
    New-Item -Type "Directory" -Path "$env:HOMEPATH\OneDrive\Документы\Visual Studio 2022\" -Force
    New-SymbolicLink `
        -Path "C:\Users\musli\OneDrive\Документы\Visual Studio 2022\My Exported Templates\" `
        -Target "C:\Users\musli\ArtHome\.config\_Windows\VisualStudio\My Exported Templates\"
}

function SetupMiscellaneous()
{
    New-Item -Type "Directory" -Path "$env:HOMEPATH\ArtHome\Projects" -Force
}


SetupGit
SetupPowershell
SetupWindowsTerminal
SetupVim
SetupMSVisualStudioCode
SetupStartupDirectory
SetupVisualStudio
SetupMiscellaneous

# Manual configuration:
#   GoogleDrive
#       You don't need to create symlink manually. Git stores that symlink.
#   Yandex.Music
