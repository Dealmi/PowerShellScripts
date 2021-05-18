#This script creates the multiplication table (from 1 to 10) of a number.
param([Parameter(Mandatory)][int]$number)
for ($step=1; $step -le 10; $step++){
    Write-Host $number x $step = ($number*$step)
}
