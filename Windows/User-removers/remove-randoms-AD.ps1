#create a localbackup admin
$PASSWORD= ConvertTo-SecureString -AsPlainText -Force -String Evilcorpfirstpass1234

New-AdUser -Name "Bongus" -Accountpassword $PASSWORD -Enabled $true

#Remove all unknown users
$users = Get-ADUser -Filter '*' | Select -Exp Name
$userstocheck = @('Scorebot', 'whiteteam', 'Administrator', 'TeresaWright', 'OrsonWelles', 'JosephCotton', 'HumphreyBogart', 'EdwardRobinson', 'BurtLancaster', 'IngridBerman', 'KatharineHepburn', 'KatharineHepburn', 'BingCrosby', 'MyrnaLoy', 'GaryCooper', 'JudyGarland', 'JudyGarland', 'VanJohnson', 'WilliamBendix')


#Change password of users we are keeping
Foreach($keepuser in $userstocheck){
		Set-LocalUser -Name $keepuser -Password $PASSWORD
}

#Delete not needed users
Foreach($user in $users){
	$curuser = $user
	if(($userstocheck -contains $curuser) -eq $false){
		Disable-ADAccount -Identity $curuser
	}
}
