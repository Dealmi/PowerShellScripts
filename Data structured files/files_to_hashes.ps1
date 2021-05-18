# This script creates hash-tables based on data that stored in CSV/XML/JSON/YAML files
param([Parameter(Mandatory=1)][string]$file)
#$file='.\process.xml'

#Use modules for xml and yaml
#Install-Module powershell-yaml 
Import-Module powershell-yaml
#Figuring out an extension of a file
$extension=$($file.Split('.'))[-1]
$hashTable=@{}
#function which creates a hash out of csv and json
function CsvJsonHash {
    param ($data)
    for ($n=0;$n -le $data.GetUpperBound(0);$n++ ){
        $hash=@{'Name' = $data[$n].Name ; 'Id' = $data[$n].Id ; 'StartTime' = $data[$n].StartTime ; 'PagedMemorySize' = $data[$n].PagedMemorySize }
        $hashTable+=@{$data[$n].Id = $hash}    
    }
    return $hashTable
}
#function which creates a hash out of xml
function xmlHash {
    param ($data)
    for ($n=0; $n -lt $data.Objects.Object.Length; $n++){
        for($m=0; $m -lt $data.Objects.Object[$n].Property.Length; $m++){
            $hash+=@{$data.Objects.object[$n].Property[$m].Name = $data.Objects.object[$n].Property[$m].'#text'}
        }
        $hashTable+=@{$data.Objects.Object[$n].ChildNodes[1].'#text' = $hash}
        $hash=@{}
    }
    return $hashTable
}

#making a hash-table based on extension

switch ($extension) {
    'csv' { $hashTable=CsvJsonHash -data $(Get-Content $file | ConvertFrom-Csv) }
    'json' {$hashTable=CsvJsonHash -data $(Get-Content $file | ConvertFrom-Json)}
    'xml' { $hashTable=xmlHash -data $([xml]$(Get-Content $file)) }
    'yaml' {$hashTable=$(ConvertFrom-Yaml -Yaml $($( Get-Content $file ) -join "`n" )) }
    
    Default { #extension is unsupported
        Write-Error "Wrong type of file. Only xml, csv, yaml or json are accepted"
        break
    }
}
Write-Output "*****Result******"
$hashTable.keys | ForEach-Object{
    Write-Output 'Key is' $_ 'and Value is'$hashTable.$_
}

 
