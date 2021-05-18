#initial strings. It should only contain letters from a to z.
#Script makes a new string, which contains 1 entry of each letter , sorted in ascended alpha order.

$str1 = "xyaabbbccccdefww"
$str2 = "xxxxyyyyabklmopq"
[char[]]$alphabet='a'..'z'
$combinedString=$str1+$str2

foreach ($letter in $alphabet) {
    if ($combinedString.Contains($letter)){
        $outputString+=$letter
    }
}
Write-Host $outputString
