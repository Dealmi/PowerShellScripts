#This script makes association with running services and process in Windows. It puts results in hash table.


#Initializing our hash
$hashServices=$null
$hashServices=@{}
#Collecting all service's names
$services=@((Get-CimInstance -ClassName Win32_Service).Name)
foreach ($serviceName in $services){
     #If the service is stopped, we skip it
     if ((Get-CimInstance -ClassName Win32_Service |  Where-Object {$_.name -eq $serviceName }).State -eq 'Stopped') {continue}
     
     $hashServices.Add($serviceName,$((Get-CimInstance -ClassName Win32_Service | 
          Where-Object {$_.name -eq $serviceName } | 
               ForEach-Object {get-process -id $_.processid}).ProcessName)) 
}
