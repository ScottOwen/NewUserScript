#region Info on this script
<#
Creator: Scott Owen
12/14/2017
sowen@Project4.ca

Requirements
-Account created with default settings in AD
-Folder created in \\office-nas\userhome$\

This script is used for the following, in order
log in as your admin to connect to dc1
Get the username
Create a folder
add rights for admins and user to the folder
sets as home directory, mapping it to the h:\ drive
sends welcome email

Notes
dont worry about any of the errors before the prompt for the username
#>
#endregion

#region headers, login to admin
<#
https://www.mowasay.com/2017/04/connecting-to-a-remote-domain-controller-using-powershell/
#>
Set-ExecutionPolicy Unrestricted
$session = New-PSSession -ComputerName "dc1" -Credential (Get-Credential)
Invoke-Command $session -Scriptblock { Import-Module ActiveDirectory }
Import-PSSession -Session $session -module ActiveDirectory
#endregion

#region read in username
<#
read-host allows input after the text and places in variable 
#>
$user = Read-Host -Prompt 'What is the username of the new user'
#endregion


$ScriptToRun = "\\office-nas\infosys\Internal\Scripts\Powershell\NewUserScript\CreateFolder.ps1"
&$ScriptToRun -user $user

$ScriptToRun = "\\office-nas\infosys\Internal\Scripts\Powershell\NewUserScript\ADGeneralTab.ps1"
&$ScriptToRun -user $user

$ScriptToRun = "\\office-nas\infosys\Internal\Scripts\Powershell\NewUserScript\ADProfileTab.ps1"
&$ScriptToRun -user $user

$ScriptToRun = "\\office-nas\infosys\Internal\Scripts\Powershell\NewUserScript\MemberOf.ps1"
&$ScriptToRun -user $user

#region Sends welcome email with all info needed to setup accounts
<#
Calls on the welcome email script created by @jlake, sends the email address created above as a parameter 
#>
$ScriptToRun = "c:\Welcome_Email.ps1"
&$ScriptToRun -username $user

#endregion

#Read-Host -Prompt "End"
