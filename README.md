# Airbnb Price Prediction Barcelona

**A Data Science Case Study for Barcelona Listings**

*By Felix Marschall, Mika Scheid, Elias Müller, and Jan Dorn*

## Abstract

This project develops a machine learning model to predict Airbnb listing prices in Barcelona using a comprehensive dataset from Inside Airbnb. Through rigorous feature engineering and model optimization, we achieved strong predictive performance that can support hosts in making informed pricing decisions.

**Methodology:**
- **Data Strategy**: Hypothesis-driven approach excluding reviews and calendar data based on analysis showing minimal predictive value
- **Feature Engineering**: Three-phase expansion-reduction paradigm (79 → 17 → ~70 → 53 features) with careful data leakage prevention
- **Modeling**: Comparison of Linear Regression, Random Forest, and XGBoost with hyperparameter optimization
- **Evaluation**: Rigorous cross-validation and comprehensive error analysis on unseen test data

**Key Findings:**
- **Champion Model**: Random Forest achieved **R² = 0.7142** (71.4% variance explained) with **RMSE = $87.14**
- **Top Price Drivers**: Guest capacity (21.6%), geographic location (24%), room type, and neighborhood premiums
- **Business Insights**: Location and capacity are paramount; entire homes command significant premiums; amenities count matters more than specific features
- **Practical Impact**: Model enables data-driven pricing decisions with median absolute error of only $21.11

## Quick Start

1. **Clone and setup**:
```bash
git clone https://github.com/jandorn/airbnb-price-prediction.git
cd airbnb-price-prediction
```

2. **Download data**:
```bash
./download_data.sh
```

3. **Run analysis**:
Open `price_prediction_barcelona.ipynb` in Jupyter and execute all cells.

## Project Structure

```
├── price_prediction_barcelona.ipynb    # Main analysis notebook
├── docs/explanation.md                 # Comprehensive methodology report
├── download_data.sh                    # Data download script
└── data/listings.csv.gz                # Barcelona Airbnb data
```

## Results Summary

| Model | R² Score | RMSE ($) | MAE ($) |
|-------|----------|----------|---------|
| **Random Forest (Optimized)** | **0.7142** | **87.14** | **37.31** |
| XGBoost (Optimized) | 0.7059 | 88.46 | 39.18 |
| Linear Regression | 0.4373 | 110.10 | 57.23 |

**Model Performance by Price Segment:**
- Budget (<$50): Challenging (MAPE: 64.1%)
- Mid-range ($50-100): Moderate (MAPE: 33.4%)
- Premium ($100-200): Good (MAPE: 22.5%)
- Luxury ($200+): Best (MAPE: 23.1%)

## Documentation

- **Comprehensive Report**: See [`docs/explanation.md`](docs/explanation.md) for detailed methodology, results, and business insights
- **Analysis Notebook**: [`price_prediction_barcelona.ipynb`](price_prediction_barcelona.ipynb) contains the complete implementation

---

*This project demonstrates end-to-end data science methodology from problem definition to business-ready solution, emphasizing rigorous feature engineering, model validation, and practical applicability.* 