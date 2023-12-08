$Data = Get-Content (Join-Path $PSScriptRoot -ChildPath "PuzzleInput.txt")
$Solution = 0

foreach ($line in $Data) {
    [string]$NumbersOnlyLine = $line -replace '[^\d]',''
    [string]$OutputValue = $NumbersOnlyLine[0] + $NumbersOnlyLine[-1]
    $Solution += $OutputValue
}

return $Solution
