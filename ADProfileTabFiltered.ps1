#region Info on this script
<#
Creator: Scott Owen
12/14/2017
scott@owen.on.ca
#>
#endregion

<#

#region set as home directory
<#
https://stackoverflow.com/questions/21030086/using-powershell-set-the-ad-home-directory-for-a-user-given-the-display-name
#>
Set-ADUser -Identity $user -HomeDirectory \\office-nas\UserHome$\$user -HomeDrive h;
#endregion



#region Modify profile path for roaming profile
<#
https://blogs.technet.microsoft.com/heyscriptingguy/2013/08/14/use-powershell-to-change-sign-in-script-and-profile-path/
#>
$profile = "\\OFFICE-NAS\User Profiles$\" + $user
set-ADUser -Identity $user -ProfilePath $profile

#endregion
