$Data = Get-Content (Join-Path $PSScriptRoot -ChildPath "PuzzleData.txt")
$Solution = 0

$CubesAvailable = @{
    red = 12
    green = 13
    blue = 14 
}

$ValidGames = [System.Collections.Generic.List[int]]::new()

:gameLoop foreach ($line in $Data) {
    $GameNumber = [int]::Parse((($line -split ":")[0] -split " ")[-1])
    $GameData = ($line -split ":")[1]

    $RoundData = ($GameData -split ";").Trim()

    foreach ($round in $RoundData) {
        $cubeData = ($round -split ",").Trim()
        foreach ($cube in $CubeData) {
            $cubeCount,$color = ($cube -split " ")
            if ([int]$cubeCount -gt $CubesAvailable[$color]) {
                continue gameLoop
            }
        }
    }

    $ValidGames.Add($GameNumber)
    $Solution += $GameNumber
}

return $Solution





