#This script converts dash delimited words into camelCasing
#and underscore delimited words into PascalCasing.

#examples:  "the-stealth-warrior" > "theStealthWarrior"
#           "The_Stealth_Warrior" > "TheStealthWarrior"
Remove-Variable * -Scope 0
#$inputstring = "the-stealth-warrior"
$inputstring = "the_Stealth_Warrior"
if ($inputstring.Contains('-')) { 
#let's convert into camelCasing
    [string[]]$phrase=$inputstring.Split('-')
    $outputString+=$phrase[0]
    for ($counter=1; $counter -lt $phrase.Length; $counter++){
        $outputString+=$phrase[$counter].Substring(0,1).ToUpper()+$phrase[$counter].Substring(1)
    }
}
else {
#let's convert into PascalCasing
[string[]]$phrase=$inputstring.Split('_')
        for ($counter=0; $counter -lt $phrase.Length; $counter++){
        $outputString+=$phrase[$counter].Substring(0,1).ToUpper()+$phrase[$counter].Substring(1)
    }
}
Write-Host $outputString
