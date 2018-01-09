###########################################
#created by Cor
#Modified and revamped by Edward Harris Gomez
#copyright Techhemel.be
###########################################

Write-host "Adding users to Active Directory"  "`n"

Write-host "All copyrights EHG" "`n"

Write-host "Scripts starts now!" "`n"


#New-ADOrganizationalUnit -Name "Gebruikers"

$Users = Import-Csv -Path "./usersSecurity-local.csv" 
ForEach ($User in $Users)
{
	 
    $Name = $user.'Name'          
    $SAM = $User.'SamAccountName'            
    $UPN = $User.'UserPrincipalName'            
    $tel = $User.'telephoneNumber'            
    $Password = "intec-123"     
    $department = $user.'department'
    $uac = $user.'userAccountControl'
    $objClass = $user.'ObjectClass'
    
	New-ADUser -Name "$Name" -SamAccountName $SAM -UserPrincipalName $UPN -department $department -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) -Enabled $true -ChangePasswordAtLogon $true –PasswordNeverExpires $true            
    
   
}

"n"
write-host "Script is done"
