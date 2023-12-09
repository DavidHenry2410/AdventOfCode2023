$Data = Get-Content (Join-Path $PSScriptRoot -ChildPath "PuzzleData.txt")
$Solution = 0

foreach ($line in $Data) {
    $GameData = ($line -split ":")[1]

    $CurrentCubeValues = @{
        red = 0
        green = 0
        blue = 0
    }

    $RoundData = ($GameData -split ";").Trim()

    foreach ($round in $RoundData) {
        $cubeData = ($round -split ",").Trim()
        foreach ($cube in $CubeData) {
            $cubeCount,$color = ($cube -split " ")
            if ([int]$cubeCount -gt $CurrentCubeValues[$color]) {
                $CurrentCubeValues[$color] = $cubeCount
            }
        }
    }


    $gameValue = 1
    foreach ($value in $CurrentCubeValues.Values) {
        $gameValue = $gameValue * $value
    }
    $Solution += $gameValue
}

return $Solution





