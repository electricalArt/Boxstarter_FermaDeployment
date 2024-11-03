$VSConfigPath = "$env:TEMP\VSConfig.json"

@'
{
  "version": "1.0",
  "components": [
    "Microsoft.Component.MSBuild",
    "Microsoft.VisualStudio.Component.CoreEditor",
    "Microsoft.VisualStudio.Component.NuGet",
    "Microsoft.VisualStudio.Component.Roslyn.Compiler",
    "Microsoft.VisualStudio.Component.TextTemplating",
    "Microsoft.VisualStudio.Component.VC.ASAN",
    "Microsoft.VisualStudio.Component.VC.ATL.ARM64.Spectre",
    "Microsoft.VisualStudio.Component.VC.ATL.ARM64",
    "Microsoft.VisualStudio.Component.VC.ATL.Spectre",
    "Microsoft.VisualStudio.Component.VC.ATL",
    "Microsoft.VisualStudio.Component.VC.ATLMFC.Spectre",
    "Microsoft.VisualStudio.Component.VC.ATLMFC",
    "Microsoft.VisualStudio.Component.VC.CoreIde",
    "Microsoft.VisualStudio.Component.VC.MFC.ARM64.Spectre",
    "Microsoft.VisualStudio.Component.VC.MFC.ARM64",
    "Microsoft.VisualStudio.Component.VC.Redist.14.Latest",
    "Microsoft.VisualStudio.Component.VC.Runtimes.ARM64.Spectre",
    "Microsoft.VisualStudio.Component.VC.Runtimes.ARM64EC.Spectre",
    "Microsoft.VisualStudio.Component.VC.Runtimes.x86.x64.Spectre",
    "Microsoft.VisualStudio.Component.VC.Tools.ARM64",
    "Microsoft.VisualStudio.Component.VC.Tools.ARM64EC",
    "Microsoft.VisualStudio.Component.VC.Tools.x86.x64",
    "Microsoft.VisualStudio.Component.Windows10SDK",
    "Microsoft.VisualStudio.ComponentGroup.NativeDesktop.Core",
    "Microsoft.VisualStudio.Workload.CoreEditor",
    "Microsoft.VisualStudio.Workload.NativeDesktop"
  ]
}
'@ > $VSConfigPath

function InstallVisualStudio()
{
    winget install --accept-package-agreements --accept-source-agreements --id Microsoft.VisualStudio.2022.Community `
        --override "--passive --config $VSConfigPath"
    winget install --accept-package-agreements --accept-source-agreements --id Microsoft.DotNet.SDK.8
    winget install --source winget --exact --id Microsoft.WindowsSDK.10.0.26100
    winget install --source winget --exact --id Microsoft.WindowsWDK.10.0.26100
    
    # Extensions
    #   VsVim
    #   Windows Driver Kit
    #       Should not be used. WDK installed here does not install extension for Visual Studio.
    #       Install these kits as MSDN instructions say.

}
function InstallRelatedStuff()
{
    # vcpkg
}

InstallVisualStudio
InstallRelatedStuff
