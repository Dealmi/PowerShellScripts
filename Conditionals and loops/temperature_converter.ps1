#This script converts temperatures to and from Celsius, Fahrenheit.
param($inputTemp)
[Int16]$temperature=$inputTemp -replace ('\D','')
($inputTemp.EndsWith('C')) ? (Write-Host $inputTemp 'is' ([int]($temperature*1.8+32)) 'in Fahrenheit') : (Write-Host $inputTemp 'is' ([int](($temperature-32)/1.8))'in Celsius')
