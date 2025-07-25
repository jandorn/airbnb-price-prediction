# create data directory
if (!(Test-Path -Path "data")) {
    New-Item -ItemType Directory -Path "data" | Out-Null
}

# download barcelona data only
Invoke-WebRequest -Uri "https://data.insideairbnb.com/spain/catalonia/barcelona/2025-03-05/data/listings.csv.gz" -OutFile "data/listings.csv.gz"

Write-Host "Download completed!" 