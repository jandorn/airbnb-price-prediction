# Airbnb Price Prediction Barcelona

**A Data Science Case Study for Barcelona Listings**

*By Felix Marschall, Mika Scheid, Elias Müller, and Jan Dorn*

## Abstract

This project develops a machine learning model to predict Airbnb listing prices in Barcelona using a comprehensive dataset from Inside Airbnb. Through rigorous feature engineering and model optimization, we achieved strong predictive performance that can support hosts in making informed pricing decisions.

**Methodology:**
- **Data Strategy**: Hypothesis-driven approach excluding reviews and calendar data based on analysis showing minimal predictive value
- **Feature Engineering**: Three-phase expansion-reduction paradigm (79 → 17 → ~70 → 53 features) with careful data leakage prevention
- **Modeling**: Comparison of **Linear Regression**, **Random Forest**, and **XGBoost** with hyperparameter optimization
- **Evaluation**: Rigorous cross-validation and comprehensive error analysis on unseen test data

**Key Findings:**
- **Champion Model**: Random Forest achieved **R² = 0.6183** (61.8% variance explained) with **RMSE = $93.27**
- **Top Price Drivers**: Guest capacity (14.8%), bathroom count (11.7%), bedrooms (11.0%)
- **Business Insights**: Property capacity and amenities are paramount; entire homes command significant premiums
- **Practical Impact**: Model enables data-driven pricing decisions with median absolute error of $42.27

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

| Model | Stage | R² Score | RMSE ($) | MAE ($) |
|-------|--------|----------|----------|---------|
| Random Forest | Baseline CV | 0.6023 ± 0.0557 | 94.75 ± 11.03 | 43.66 ± 1.52 |
| | Optimized CV | 0.6414 ± 0.0445 | 90.10 ± 10.50 | 41.50 ± 1.20 |
| | **Test** | **0.6183** | **93.27** | **42.27** |
| XGBoost | Baseline CV | 0.6023 ± 0.0445 | 94.86 ± 10.04 | 44.46 ± 1.49 |
| | Optimized CV | 0.6389 ± 0.0448 | 90.38 ± 10.28 | 42.26 ± 1.22 |
| | Test | 0.6147 | 93.70 | 43.39 |
| Linear Regression | Baseline CV | 0.4704 ± 0.0503 | 109.53 ± 11.43 | 58.83 ± 2.29 |
| | ElasticNet CV | 0.4708 ± 0.0502 | 109.49 ± 11.47 | 58.58 ± 2.29 |
| | Test | 0.4277 | 114.20 | 60.33 |

**Model Performance by Price Segment:**
- Budget (<$50): R² = -13.26, MAE = $20.41, n = 716
- Mid-range ($50-100): R² = -7.62, MAE = $24.97, n = 1,415
- Premium ($100-200): R² = -1.72, MAE = $31.23, n = 1,875
- Luxury ($200+): R² = 0.33, MAE = $101.86, n = 1,021

## Documentation

- **Comprehensive Report**: See [`docs/explanation.md`](docs/explanation.md) for detailed methodology, results, and business insights
- **Analysis Notebook**: [`price_prediction_barcelona.ipynb`](price_prediction_barcelona.ipynb) contains the complete implementation

---

*This project demonstrates end-to-end data science methodology from problem definition to business-ready solution, emphasizing rigorous feature engineering, model validation, and practical applicability.* 