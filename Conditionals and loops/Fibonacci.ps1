#This script writes the Fibonacci series between 0 to N.
param($n=50)
[int[]]$array=0..$n #This is a given array
[int[]]$fibonacciNumbers=@(1,1) #1st two numbers are always 1 and 1 and for f.formulae to work we should have 3 members
$fibonacciCounter=2 #..so we start counting our f. numbers from 2 
#now we check every digit in the given array against the fibonacci formulae
for ($counter=0; $counter -lt $array.Length; $counter++){
    if ($array[$counter] -eq ($fibonacciNumbers[$fibonacciCounter-1]+$fibonacciNumbers[$fibonacciCounter-2])){
        $fibonacciNumbers+=$array[$counter]
        $fibonacciCounter++
    }
}
Write-Host $fibonacciNumbers

