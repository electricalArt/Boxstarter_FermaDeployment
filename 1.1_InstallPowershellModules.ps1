function InstallPowershellModules()
{
    Install-Module -Name PSTree -Confirm
    Install-Module -Name MagicPacket -Confirm

    # Not available anymore 
    #Install-Module -Name Recycle -Confirm
}

try
{
    InstallPowershellModules
}
catch 
{
    Write-Error $_
}

