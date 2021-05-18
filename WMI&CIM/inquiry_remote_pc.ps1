<# This script gets from selected remote computer the following data:

CPU model and max clock speed
Amount of RAM (total, free)
OS disk free space
OS version
Installed hot fixes
List of stopped services #>

#Specifications
$pcSpecification=@{
    CPU_Name = (Get-CimInstance CIM_Processor).name
    MAX_Clock_Speed = (Get-CimInstance CIM_Processor).MaxClockSpeed
    RAM_total_Gb = (Get-CimInstance Win32_PhysicalMemoryArray).MaxCapacity/1024/1024
    RAM_free = ( (Get-CimInstance Win32_OperatingSystem).FreePhysicalMemory)
    System_Disk_free_space = (((Get-CimInstance CIM_StorageVolume) | Where-Object -Property caption -match "C:" | Select-Object -Property FreeSpace).FreeSpace)
    OS_Version = ((Get-CimInstance Win32_OperatingSystem).Version)
    }
#Hot fixes
    $hotFixes=(Get-CimInstance Win32_QuickFixEngineering).HotFixID
#Stopped Services
    $stoppedServices=Get-CimInstance CIM_Service | Where-Object -Property State -eq "Stopped" | Select-Object -Property Name


