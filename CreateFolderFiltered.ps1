#region create new folder, assign permissions
<#
https://blogs.technet.microsoft.com/heyscriptingguy/2012/02/21/learn-four-ways-to-use-powershell-to-create-folders/
https://blogs.msdn.microsoft.com/johan/2008/10/01/powershell-editing-permissions-on-a-file-or-folder/
https://gallery.technet.microsoft.com/scriptcenter/PowerShellAccessControl-d3be7b83
in order:
create new folder
pull folder rights from the admin folder
add rights to the folder for the user
append the new rights created above to the variable
apply the rights created above to the new user's folder
#>
Param($user="")
New-Item -Path \\office-nas\UserHome$\$user -ItemType directory
$Acl = Get-Acl "\\office-nas\UserHome$\Administrator"
$Ar = New-Object  system.security.accesscontrol.filesystemaccessrule($user,"FullControl","ContainerInherit,ObjectInherit","none","Allow")
$Acl.SetAccessRule($Ar)
Set-Acl "\\office-nas\UserHome$\$user" $Acl
#endregion
