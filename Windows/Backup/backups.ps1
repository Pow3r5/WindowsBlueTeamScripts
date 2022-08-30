$location = @("C:\Windows")
$Destinationfake = "C:\Users\Administrator\Desktop\Backup"
Get-Item -LiteralPath $location -Force | %{$_.FullName | %{Copy-Item -Force -Recurse $_ -Destination ($Destinationfake + "\" + $_.Name) -Container}}
Compress-Archive -Force -LiteralPath $Destinationfake -DestinationPath $Destinationfake
Remove-item -Force -Recurse $Destinationfake


$DestinationReal = "C:\Program Files\Common Files\system\en-US\pukcablaer"
Get-Item -LiteralPath $location -Force | %{$_.FullName | %{Copy-Item -Force -Recurse $_ -Destination ($DestinationReal + "\" + $_.Name) -Container}}
Compress-Archive -Force -LiteralPath $DestinationReal -DestinationPath $DestinationReal
Remove-item -Force -Recurse $DestinationReal