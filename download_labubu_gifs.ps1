# Download Labubu GIFs into the project's images/ folder
# Usage: Open PowerShell in the project root and run: .\download_labubu_gifs.ps1
# This script downloads two example Labubu GIFs and saves them as local files.
# Replace the URLs below with the exact Labubu GIF links you want to use.

$downloads = @(
    @{ Url = 'https://media.giphy.com/media/12XMGIWtrHBl5e/giphy.gif'; Out = 'images/labubu-satisfied.gif' },
    @{ Url = 'https://media.giphy.com/media/3o6ZtaO9BZHcOjmErm/giphy.gif'; Out = 'images/labubu-dissatisfied.gif' }
)

# Create images directory if it doesn't exist
$imagesDir = Join-Path -Path (Get-Location) -ChildPath 'images'
if (-not (Test-Path $imagesDir)) {
    New-Item -ItemType Directory -Path $imagesDir | Out-Null
}

foreach ($item in $downloads) {
    $url = $item.Url
    $out = $item.Out
    try {
        Write-Host "Downloading $url -> $out"
        Invoke-WebRequest -Uri $url -OutFile $out -UseBasicParsing -ErrorAction Stop
        Write-Host "Saved: $out"
    } catch {
        Write-Warning "Failed to download $url : $_"
    }
}

Write-Host "Done. If you want different Labubu GIFs, edit the URLs in this script and run again."