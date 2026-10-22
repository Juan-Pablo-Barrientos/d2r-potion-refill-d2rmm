# Builds dist\PotionRefill-D2RMM.zip. The DLL and INSTALL.txt sit at the top of
# the zip, next to the PotionRefill mod folder, because each part is installed
# in a different place. By default the DLL comes from the plugin's latest
# GitHub release.
param(
	[string]$Dll
)
$ErrorActionPreference = "Stop"

$root = $PSScriptRoot
$dist = Join-Path $root "dist"
Remove-Item -Recurse -Force $dist -ErrorAction SilentlyContinue
$stage = Join-Path $dist "stage"
New-Item -ItemType Directory -Force "$stage\PotionRefill" | Out-Null

if (-not $Dll) {
	$Dll = Join-Path $dist "d2rl-potion-refill.dll"
	Invoke-WebRequest -UseBasicParsing -OutFile $Dll `
		"https://github.com/Juan-Pablo-Barrientos/d2r-potion-refill/releases/latest/download/d2rl-potion-refill.dll"
}

Copy-Item "$root\PotionRefill\*" "$stage\PotionRefill"
Copy-Item $Dll $stage
Copy-Item "$root\INSTALL.txt" $stage
Compress-Archive -Path "$stage\*" -DestinationPath "$dist\PotionRefill-D2RMM.zip"
Remove-Item -Recurse -Force $stage
Write-Host "Built $dist\PotionRefill-D2RMM.zip"
