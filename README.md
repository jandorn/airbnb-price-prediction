# Airbnb Price Prediction

This project analyzes Airbnb listings from various European cities and develops a model to predict rental prices. The analysis is based on data from Inside Airbnb and includes data processing, exploratory data analysis, and machine learning.

## Setup Instructions

1. Clone the repository:
```bash
git clone https://github.com/jandorn/airbnb-price-prediction.git
cd airbnb-price-prediction
```

2. Create and activate virtual environment:
```bash
python -m venv .venv
source .venv/bin/activate  # For Unix/MacOS
# or
.venv\Scripts\activate  # For Windows
```

3. Download the data:
```bash
chmod +x download_data.sh
./download_data.sh
```

This downloads Airbnb listings data for the following cities:
- Amsterdam
- Barcelona
- Berlin
- Budapest
- Copenhagen
- Istanbul
- Lisbon
- London
- Oslo
- Paris
- Prague
- Rome
- Stockholm

The data is stored in the `data/` directory, with each city having its own subdirectory.

In your IDE, select your .venv as kernel and run the notebook.

## Project Structure

- `download_data.sh`: Script for downloading the data
- `price_prediction.ipynb`: Jupyter notebook containing the main analysis
- `data/`: Directory for downloaded data 