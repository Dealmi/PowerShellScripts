class ToUpper{
    #parameters
    [char[]]$string
    [string]$upper
    #method SetString
    [void]SetString([string]$incoming){
        $this.string=$incoming
    }

    #method PrintString
    [string]PrintString(){
         foreach ($item in $this.string) {
            $this.upper+=[char]::ToUpper($item)
         }
         return $this.upper
    }
}