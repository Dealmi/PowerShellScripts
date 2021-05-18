#This script gets a list of processes (ex. All chrome process) and puts Name, Id, StartTime, PagedMemorySize in CSV/XML/JSON/YAML files 
$process=Read-Host "Enter the name of a process"
#$process='Discord'
#Use modules for xml and yaml
#Install-Module powershell-yaml 
Import-Module powershell-yaml

#Get a list of process Id's
$processes=[System.Diagnostics.Process]::GetProcesses() | Where-Object -Property Name -eq $process

#Write csv
Write-Output $processes | Select-Object -Property Name, Id, StartTime, PagedMemorySize  | ConvertTo-Csv | Set-Content .\process.csv
#Write json
Write-Output $processes | Select-Object -Property Name, Id, StartTime, PagedMemorySize  | ConvertTo-Json | Set-Content .\process.json
#Write xml
[xml]$(Write-Output $processes | Select-Object -Property Name, Id, StartTime, PagedMemorySize  | ConvertTo-XML -Depth 4).Save( $(Resolve-Path .\).Path + '\process.xml')
#Write yaml
$processes_hash=foreach ($proc in $processes) {
    @{$processes.IndexOf($proc) = @{Name = "$($proc.Name)" ; Id = $proc.Id 
      StartTime = $proc.StartTime; PagedMemorySize = $proc.PagedMemorySize}}
}
Write-Output $processes_hash | ConvertTo-Yaml | Set-Content .\process.yaml
