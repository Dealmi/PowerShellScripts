$hashTable = @{a = 12; g = 4; h = 1; t = 7; d = 8}
$OrderedDictionary = [ordered]@{}
foreach ($Item in ($hashTable.GetEnumerator() | Sort-Object -Property Value )) {
    $OrderedDictionary[$Item.Key] = $Item.Value
}
$OrderedDictionary