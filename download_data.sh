#!/bin/bash

# create data directory
mkdir -p data

# download barcelona data only
wget -O data/listings.csv.gz "https://data.insideairbnb.com/spain/catalonia/barcelona/2025-03-05/data/listings.csv.gz"

echo "Download completed!"