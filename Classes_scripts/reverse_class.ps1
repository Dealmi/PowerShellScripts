class Backwards{
    #parameters
    [string]$reversed
        
    #method Reverse
    [string]Reverse([char[]]$inc){
         for ($index=$inc.Length;$index -ne -1; $index-=1) {
            $this.reversed+=$inc[$index]
         }
         return $this.reversed
    }
}