##  After that you need sign out and sign in.
#~\ArtHome\Scripts\Boxstarter_FermaDeployment\15-capslock_to_ctrl.reg

function New-SymbolicLink {
    param(
        [string]$Path,
        [string]$Target
    )
    try
    {
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

# Git
New-SymbolicLink -Path "$env:HOMEPATH\.gitconfig" -Target "$env:HOMEPATH\ArtHome\.gitconfig"

# Powershell
New-Item -Type "Directory" ~\Documents\Powershell\ -Force
New-SymbolicLink `
    -Path $PROFILE.CurrentUserAllHosts `
    -Target "C:/Users/musli/ArtHome/.config/powershell/profile.ps1" 
New-SymbolicLink -Path $PROFILE.AllUsersAllHosts -Target $PROFILE.CurrentUserAllHosts

# WindowsTerminal
New-SymbolicLink -Path "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" `
    -Target "$env:HOMEPATH\ArtHome\.config\_Windows\WindowsTerminal\settings.json"

# Alacritty
New-SymbolicLink -Path "$env:APPDATA\alacritty" -Target "$env:HOMEPATH\ArtHome\.config\alacritty\"

# Vim
New-SymbolicLink -Path "~\ArtHome\_vimrc" -Target "C:/Users/musli/ArtHome/.vimrc"`

# MS Visual Studio Code
New-Item -Type "Directory" -Path "$env:APPDATA\Code\User\" -Force
New-SymbolicLink -Path "$env:APPDATA\Code\User\settings.json" -Target "C:/Users/musli/ArtHome/.config/Code/User/settings.json"

# XMBC (trackball mouse utility)
New-Item -Type "Directory" -Path "$env:APPDATA\Highresolution Enterprises\XMouseButtonControl\" -Force
New-SymbolicLink `
    -Path "$env:APPDATA/Highresolution Enterprises/XMouseButtonControl/musli''s XMBC Profile.xmbcp" `
    -Target 'C:/Users/musli/ArtHome/.config/musli''s XMBC Profile.xmbcp'

# Startup directory
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

