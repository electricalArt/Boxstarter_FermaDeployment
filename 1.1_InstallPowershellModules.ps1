function InstallPowershellModules()
{
    Install-Module -Name PSTree -Confirm
    Install-Module -Name MagicPacket -Confirm
    Install-Module -Name Recycle -Confirm
}

try
{
    InstallPowershellModules
}
catch 
{
    Write-Error $_
}

