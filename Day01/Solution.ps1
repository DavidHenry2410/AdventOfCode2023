$Data = Get-Content (Join-Path $PSScriptRoot -ChildPath "PuzzleData.txt")
$Solution = 0

$puzzleToSolve = 1

$NumberLookup = @{
    "0" = '0'
    "1" = '1'
    "2" = '2'
    "3" = '3'
    "4" = '4'
    "5" = '5'
    "6" = '6'
    "7" = '7'
    "8" = '8'
    "9" = '9'
}

if ($puzzleToSolve -eq 2) {
    $NumberLookup += @{
        'one' = '1'
        'two' = '2'
        'three' = '3'
        'four' = '4'
        'five' = '5'
        'six' = '6'
        'seven' = '7'
        'eight' = '8'
        'nine' = '9'
    }
}


foreach ($line in $Data) {
    $Indexes = [System.collections.generic.list[PSCustomObject]]::new()

    foreach ($key in $NumberLookup.Keys) {
        $FirstIndex = $line.IndexOf($key)
        $LastIndex = $line.LastIndexOf($key)
        if ($FirstIndex -ne -1 -and $LastIndex -ne -1) {
            $Object = [PSCustomObject]@{
                KeyName = $key
                FirstIndex = $FirstIndex
                LastIndex = $LastIndex
            }
            $Indexes.Add($Object)
        }
    }
    
    [string]$FirstNumber = $NumberLookup[($Indexes | Sort-Object -Property FirstIndex)[0].KeyName]
    [string]$LastNumber = $NumberLookup[($Indexes | Sort-Object -Descending -Property LastIndex)[0].KeyName]
    $LineValue = ($FirstNumber + $LastNumber)
    $Solution += $LineValue
}

return $Solution
