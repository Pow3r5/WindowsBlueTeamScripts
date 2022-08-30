#Remove all unknown users
$users = Get-LocalUser
$userstocheck = "Administrator", "Bailey", "blueteam", "Bongus"
Foreach($user in $users){
	$curuser = $user.Name
	Foreach($stay in $userstocheck){
		if($curuser -ne $stay){
			$stay
			Disable-Localuser -Name $curuser
		}
	}
}


Restart-Computer -Force