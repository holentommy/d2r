function Get-HeraldSpawnChance {
    param (
        [double]$x,  # zone-completion in percent (0.0 til 1.0)
        [double]$a = 0.5,  # zone_chance_asymptote
        [double]$k = 0.05, # zone_chance_vertial_shift
        [double]$m = 10.0, # zone_chance_slope
        [double]$x0 = 0.5  # zone_chance_midpoint
    )

    # equation: y = (a / (1 + e^(-m * (x - x0)))) + k
    $exponent = -$m * ($x - $x0)
    $y = ($a / (1 + [Math]::Exp($exponent))) + $k
    
    return [Math]::Min($y, 1.0)
}

# --- Simululation of a zone clear ---
Write-Host "--- Chance of Herald based on zone completion ---" -ForegroundColor Cyan
Write-Host "Completion | Chance"
Write-Host "----------------"

# Testing chance from 0% to 100% clear
for ($i = 0; $i -le 10; $i++) {
    $completion = $i * 0.1
    $chance = Get-HeraldSpawnChance -x $completion
    $percentStr = "{0:P0}" -f $completion
    $chanceStr = "{0:P2}" -f $chance
    
    Write-Host "$percentStr    | $chanceStr"
}
