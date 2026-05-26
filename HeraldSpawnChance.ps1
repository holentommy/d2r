function Get-HeraldSpawnChance {
    param (
        [double]$x,  # Sone-gjennomføring i prosent (0.0 til 1.0)
        [double]$a = 0.5,  # Asymptote (maks sjanse fra kurven)
        [double]$k = 0.05, # Vertikalt skift (base sjanse)
        [double]$m = 10.0, # Helning (hvor bratt sjansen øker)
        [double]$x0 = 0.5  # Midtpunkt (når sjansen øker mest)
    )

    # Formelen fra bildet: y = (a / (1 + e^(-m * (x - x0)))) + k
    $exponent = -$m * ($x - $x0)
    $y = ($a / (1 + [Math]::Exp($exponent))) + $k
    
    return [Math]::Min($y, 1.0) # Kan ikke overstige 100%
}

# --- Simulering av en "Clear" ---
Write-Host "--- Sjanse for Herald basert på Zone Completion ---" -ForegroundColor Cyan
Write-Host "Prosent | Sjanse"
Write-Host "----------------"

# Tester sjansen fra 0% til 100% gjennomføring
for ($i = 0; $i -le 10; $i++) {
    $completion = $i * 0.1
    $chance = Get-HeraldSpawnChance -x $completion
    $percentStr = "{0:P0}" -f $completion
    $chanceStr = "{0:P2}" -f $chance
    
    Write-Host "$percentStr    | $chanceStr"
}
