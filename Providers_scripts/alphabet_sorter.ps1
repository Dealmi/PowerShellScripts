#This script sorts words in alphabet order from specific file and puts them into 26 text files named A.txt, B.txt, and so on up to Z.txt.
param (
    [Parameter(Mandatory)]
    [string]
    $inputFile
)
$text=$(get-content $inputFile) -split("\W") | Sort-Object
$counter=0
while ($counter -lt $text.Length) {
        if ($text[$counter] -notmatch '[a-z][A-Z]') { 
            $counter++
            Continue 
        }
        $firstLetter=$($text[$counter].Substring(0,1)).ToLower()
        Add-Content -Value $text[$counter] -Path $($firstLetter+".txt")
        $counter++
}
