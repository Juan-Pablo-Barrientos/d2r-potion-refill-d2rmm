# Builds dist\PotionRefill-D2RMM.zip: the PotionRefill mod folder plus the
# plugin DLL. By default the DLL comes from the plugin's latest GitHub release.
param(
	[string]$Dll
)
$ErrorActionPreference = "Stop"

$root = $PSScriptRoot
$dist = Join-Path $root "dist"
Remove-Item -Recurse -Force $dist -ErrorAction SilentlyContinue
$stage = Join-Path $dist "stage\PotionRefill"
New-Item -ItemType Directory -Force $stage | Out-Null

if (-not $Dll) {
	$Dll = Join-Path $dist "d2rl-potion-refill.dll"
	Invoke-WebRequest -UseBasicParsing -OutFile $Dll `
		"https://github.com/Juan-Pablo-Barrientos/d2r-potion-refill/releases/latest/download/d2rl-potion-refill.dll"
}

Copy-Item "$root\PotionRefill\*" $stage
Copy-Item $Dll $stage
Compress-Archive -Path $stage -DestinationPath "$dist\PotionRefill-D2RMM.zip"
Remove-Item -Recurse -Force (Join-Path $dist "stage")
Write-Host "Built $dist\PotionRefill-D2RMM.zip"
