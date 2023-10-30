#create a localbackup admin
$PASSWORD= ConvertTo-SecureString -AsPlainText -Force -String Evilcorpfirstpass1234

New-LocalUser -Name "Bongus" -Password $PASSWORD
Add-LocalGroupMember -Group "Administrators" -Member "Bongus"

#Remove all unknown users
$users = Get-LocalUser
$userstocheck = @('cia', 'fbi', 'Administrator', 'nsa', 'secretservice', 'irs', 'airforce', 'military', 'hacksawridge', 'ForestGump', 'navy', 'marines', 'spaceforce')


#Change password of users we are keeping
Foreach($keepuser in $userstocheck){
		Set-LocalUser -Name $keepuser -Password $PASSWORD
}

#Delete not needed users
Foreach($user in $users){
	$curuser = $user.Name
	if(($userstocheck -contains $curuser) -eq $false){
		Disable-LocalUser -Name $curuser
	}
}
