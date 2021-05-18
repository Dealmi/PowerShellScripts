#This script finds the occurrences of 10 most common words in a given text.

param([Parameter(Mandatory=$true)][string]$inputText)
#$inputText='The simplest technique for analyzing the objects that a command returns is to pipe the output of that command to the Get-Member cmdlet. The Get-Member cmdlet shows you the formal name of the object type and a complete listing of its members. The number of elements that are returned can sometimes be overwhelming. For example, a process object can have over 100 members.'

$theText=$inputText.ToLower().Split()
$wordList=Write-Output $theText | Sort-Object | Get-Unique
$wordHash=$null
$wordHash=@{}
foreach ($word in $wordList) {
    $wordCounter=0
    for ($n=0;$n -lt $theText.Length; $n++){
        if($theText[$n] -eq $word){ $wordCounter++}
    }
    $wordHash.add($word,$wordCounter)
}
$wordHash.GetEnumerator() | Sort-Object -Property Value -Descending | Select-Object -First 10
