class Dice {
#Properties
[int]$Max
[int]$Min    

#Constructor (has the same name as a class)
#These are default values
Dice() {
    $this.Max=6
    $this.Min=1
}

#More constructor stuff
#To use this, one has to use -ArgumentList @(x,y) parameter
Dice([int]$Min, [int]$Max) {
    $this.Max=$Max
    $this.Min=$Min
}

#method
[int]Roll(){
    return Get-Random -Minimum $this.Min -Maximum $this.Max
}
}
