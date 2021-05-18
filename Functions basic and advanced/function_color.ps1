#This script creates a function that will get a string and one of several switch parameters 
# and return the text from string with the color passed with switch parameter.
function Write-ColoredMessage{
    param (
       [Parameter(Mandatory=1)][string]$Text,
       [switch]$Red,
       [switch]$Yellow,
       [switch]$Green,
       [switch]$Blue,
       [switch]$Cyan,
       [switch]$Magenta
    )
    if ($Red) {
        Write-Host $Text -ForegroundColor red
    }
    elseif ($Yellow) {
        Write-Host $Text -ForegroundColor yellow
    }
    elseif ($Green) {
        Write-Host $Text -ForegroundColor Green
    }
    elseif ($Blue) {
        Write-Host $Text -ForegroundColor Blue
    }
    elseif ($Cyan) {
        Write-Host $Text -ForegroundColor Cyan
    }
    elseif ($Magenta) {
        Write-Host $Text -ForegroundColor Magenta
    }
    else {Write-Host $Text}
}