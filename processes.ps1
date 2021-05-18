#This script gets the data, including memory in Mb and Running hours of an entered name or a part-name of a process 
$process=Read-Host "Enter the name of a process"
$MemorySize= @{label="Mem(Mb)";expression={$_.PagedMemorySize/1024/1024}}
$timeNow=Get-Date
$RunningHours=@{label="Running(Hr)";expression={$($timeNow - $_.StartTime).Days * 24 + $($timeNow - $_.StartTime).Hours}}
Get-Process -Name "*$process*" | Select-Object -Property Name,Id,CPU, $MemorySize, $RunningHours | Format-Table
