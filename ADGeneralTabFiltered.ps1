#region Info on this script
<#
Creator: Scott Owen
12/14/2017
scott@owen.on.ca
#>
#endregion

#region modify email address in the account
<#
https://community.spiceworks.com/topic/491222-powershell-get-all-users-in-an-adgroup-with-the-displayname
remove fqdn in the email and replace with @Project4.ca
#>
param($user="")
$un2 = $user + "@Project4.ca"
Set-ADUser -Identity $user -EmailAddress $un2
#endregion
