$configFiles = Get-ChildItem -Path \\OFFICE-NAS\InfoSys\Internal\Scripts\Powershell\NewUserScript* -Include *.ps1 -Exclude *Filtered.ps1 -Recurse -Force
foreach ($file in $configFiles)
{
$name=$file.Name
$pos = $name.IndexOf(".")
$leftPart = $name.Substring(0, $pos)
$NewFile = $leftPart + "Filtered.ps1"
$fqpn = "\\OFFICE-NAS\InfoSys\Internal\Scripts\Powershell\NewUserScript\Github\" + $NewFile
Copy-Item $file -Destination $fqpn
$NewFile = Get-ChildItem -Path $fqpn
    (Get-Content $NewFile.PSPath) |
    Foreach-Object { $_ -replace "Project1", "Project1" } |    
    Foreach-Object { $_ -replace "Project2", "Project2" } |    
    Foreach-Object { $_ -replace "Project3", "Project3" } |    
    Foreach-Object { $_ -replace "Project4", "Project4" } |    
    Set-Content $NewFile.PSPath
}

