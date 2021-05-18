#This script calculates a dog's age in human years: for the first two years, a dog year is equal to 10.5 human years. 
#After that, each dog year equals 4 human years.
param($dogsAge=10)

for ($age=0;$age -lt $dogsAge; $age++){
    if (($age -eq 0) -or($age -eq 1)){
        $humanAge+=10.5
        [float[]]$output+=$humanAge
    }
    else {
        $humanAge+=4
        [float[]]$output+=$humanAge
    }
}
Write-Host $output

