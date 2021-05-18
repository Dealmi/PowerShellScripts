#This script creates a function that will get any array from the pipeline. 
function Get-ValueFromPipe {
        process {
            Write-host "Value from pipe: " $_ -ForegroundColor Yellow
        }
}