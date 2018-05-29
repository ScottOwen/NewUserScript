#region 100 add user to groups
<#
https://community.spiceworks.com/how_to/50409-add-ad-user-to-groups-with-powershell
#>
#region 1 add user to default groups
param($user="")
Add-ADGroupMember -Identity "headoffice" -Member $user
Add-ADGroupMember -Identity "VPN Access" -Member $user
Add-ADGroupMember -Identity "Wireless Users" -Member $user
Add-ADGroupMember -Identity "Voicemail" -Member $user
Add-ADGroupMember -Identity "LastPassGroup" -Member $user
Add-ADGroupMember -Identity "Roaming User Profiles Users and Computers" -Member $user
#endregion 1

#region 2
$ProgramSpecific = read-host "Which program will the user mainly be involved with
1 Project4
2 Project2
3 Project1
4 Project3"
#endregion 2


#region 3 add to role specific groups

#region 4 Role Specific Prompt
$RoleSpecific = read-host "Which department is this user apart of
1 Accounting
2 Developer
3 QA
4 BA
"
#endregion 4

#region 4 Accounting 
if ($RoleSpecific = "1")
{
Add-ADGroupMember -Identity "Accounting Team" -Member $user
Add-ADGroupMember -Identity "Ops Accounting" -Member $user

if ($ProgramSpecific = 1)#1 Project4
{
#Add-ADGroupMember -Identity "" -Member $user
}
if ($ProgramSpecific = 2)#2 Project2
{
#Add-ADGroupMember -Identity "" -Member $user
}
if ($ProgramSpecific = 3)#3 Project1
{
#Add-ADGroupMember -Identity "" -Member $user
}
if ($ProgramSpecific = 4)#4 Project3
{
#Add-ADGroupMember -Identity "" -Member $user
}

}
#endregion 4 Accounting

#region 4 Developer


if ($RoleSpecific = "2")
{

Add-ADGroupMember -Identity "auth" -Member $user
Add-ADGroupMember -Identity "Development" -Member $user
if ($ProgramSpecific = 1)#1 Project4
{
#Add-ADGroupMember -Identity "" -Member $user
}
if ($ProgramSpecific = 2)#2 Project2
{
Add-ADGroupMember -Identity "Dev Dev Project2" -Member $user
}
if ($ProgramSpecific = 3)#3 Project1
{
Add-ADGroupMember -Identity "Dev Dev Project1" -Member $user
}
if ($ProgramSpecific = 4)#4 Project3
{
Add-ADGroupMember -Identity "Dev Dev Project3" -Member $user
}

}

#endregion 4

#region 4 QA
if ($RoleSpecific = "3")
{


#Add-ADGroupMember -Identity "" -Member $user
if ($ProgramSpecific = 1)#1 Project4
{
#Add-ADGroupMember -Identity "" -Member $user
}
if ($ProgramSpecific = 2)#2 Project2
{
Add-ADGroupMember -Identity "Dev QA Project2" -Member $user
}
if ($ProgramSpecific = 3)#3 Project1
{
Add-ADGroupMember -Identity "Dev QA Project1" -Member $user
}
if ($ProgramSpecific = 4)#4 Project3
{
Add-ADGroupMember -Identity "Dev QA Project3" -Member $user
}

}

#endregion 4

#region 4 BA
if ($RoleSpecific = "4")
{


#Add-ADGroupMember -Identity "" -Member $user
if ($ProgramSpecific = 1)#1 Project4
{
#Add-ADGroupMember -Identity "" -Member $user
}
if ($ProgramSpecific = 2)#2 Project2
{
Add-ADGroupMember -Identity "Dev BA Project2" -Member $user
}
if ($ProgramSpecific = 3)#3 Project1
{
Add-ADGroupMember -Identity "Dev BA Project1" -Member $user
}
if ($ProgramSpecific = 4)#4 Project3
{
Add-ADGroupMember -Identity "Dev BA Project3" -Member $user
}

}

#endregion 4 BA

#region 44 new role copy and paste this to create a region 4
#region 4 NAME
<#
if ($RoleSpecific = "4")
{


Add-ADGroupMember -Identity "" -Member $user
if ($ProgramSpecific = 1)#1 Project4
{
Add-ADGroupMember -Identity "" -Member $user
}
if ($ProgramSpecific = 2)#2 Project2
{
Add-ADGroupMember -Identity "" -Member $user
}
if ($ProgramSpecific = 3)#3 Project1
{
Add-ADGroupMember -Identity "" -Member $user
}
if ($ProgramSpecific = 4)#4 Project3
{
Add-ADGroupMember -Identity "" -Member $user
}

}

#>
#endregion 4
#endregion 44

#endregion 3

#endregion 100
