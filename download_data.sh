#!/bin/bash

# create directories
mkdir -p data/{amsterdam,barcelona,berlin,budapest,copenhagen,istanbul,lisbon,london,oslo,paris,prague,rome,stockholm}

# download data
wget -O data/amsterdam/listings.csv.gz "https://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2025-03-02/data/listings.csv.gz"
wget -O data/barcelona/listings.csv.gz "https://data.insideairbnb.com/spain/catalonia/barcelona/2025-03-05/data/listings.csv.gz"
wget -O data/berlin/listings.csv.gz "https://data.insideairbnb.com/germany/be/berlin/2024-12-21/data/listings.csv.gz"
wget -O data/budapest/listings.csv.gz "https://data.insideairbnb.com/hungary/k%C3%B6z%C3%A9p-magyarorsz%C3%A1g/budapest/2025-02-18/data/listings.csv.gz"
wget -O data/copenhagen/listings.csv.gz "https://data.insideairbnb.com/denmark/hovedstaden/copenhagen/2024-12-30/data/listings.csv.gz"
wget -O data/istanbul/listings.csv.gz "https://data.insideairbnb.com/turkey/marmara/istanbul/2024-12-30/data/listings.csv.gz"
wget -O data/lisbon/listings.csv.gz "https://data.insideairbnb.com/portugal/lisbon/lisbon/2025-03-08/data/listings.csv.gz"
wget -O data/london/listings.csv.gz "https://data.insideairbnb.com/united-kingdom/england/london/2024-12-11/data/listings.csv.gz"
wget -O data/oslo/listings.csv.gz "https://data.insideairbnb.com/norway/oslo/oslo/2024-12-30/data/listings.csv.gz"
wget -O data/paris/listings.csv.gz "https://data.insideairbnb.com/france/ile-de-france/paris/2024-12-06/data/listings.csv.gz"
wget -O data/prague/listings.csv.gz "https://data.insideairbnb.com/czech-republic/prague/prague/2025-03-16/data/listings.csv.gz"
wget -O data/rome/listings.csv.gz "https://data.insideairbnb.com/italy/lazio/rome/2025-03-05/data/listings.csv.gz"
wget -O data/stockholm/listings.csv.gz "https://data.insideairbnb.com/sweden/stockholms-l%C3%A4n/stockholm/2024-12-30/data/listings.csv.gz"

echo "Download completed!"