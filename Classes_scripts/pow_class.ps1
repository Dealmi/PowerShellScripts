class Power{
    #parameters
    [Int]$base
    [int]$exponent
 
    #method Pow
    [int]Pow([int]$Base,[int]$Exponent){
        $this.base=$Base
        $this.exponent=$Exponent
        return [math]::Pow($this.base,$this.exponent) 
    }
}