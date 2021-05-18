#This script gets 10 longest words chart and puts them in a separate file
param (
    [Parameter(Mandatory)]
    [string]
    $inputText
)
$textAr=$inputText.Split()
#Creating a chart file with 10 longest words
Write-Output $textAr | Sort-Object -Descending -Property length -top 10 | add-content -Path chart.txt 
[datetime]$trt

