# Airbnb Price Prediction: Methodology and Insights

**A Data Science Case Study for Barcelona Listings**

*By Felix Marschall, Mika Scheid, Elias Müller, and Jan Dorn*

---

## Executive Summary

This document outlines the comprehensive methodology used to develop a machine learning model for predicting Airbnb listing prices in Barcelona. The analysis demonstrates a systematic approach to data science, from initial data exploration through feature engineering to model development, emphasizing the importance of domain knowledge and data-driven decision making.

---

## 1. Project Foundation and Data Strategy

### Problem Definition
The challenge of pricing Airbnb listings represents a classic regression problem with real-world business implications. Hosts must balance competitive pricing with revenue optimization, often lacking the data-driven insights needed for informed decision-making. Our objective was to build a robust, interpretable model that could accurately predict prices based on property characteristics.

### Data Source and Scope
We utilized the comprehensive Inside Airbnb dataset, which provides detailed listing information across multiple cities. For this analysis, we focused exclusively on Barcelona, leveraging the listings.csv.gz file containing 79 initial features across approximately 19,000 properties.

### Strategic Data Decisions

Two critical hypotheses shaped our data strategy, both validated through preliminary analysis:

**Hypothesis 1: Reviews Provide No Independent Predictive Value**
Our analysis revealed that review scores are inherently influenced by price expectations. Higher-priced properties face stricter evaluation criteria, while budget options may benefit from lower expectations. This price-dependent bias makes reviews unsuitable as independent predictive features.

**Hypothesis 2: Seasonal Price Variation is Negligible**
Through SQL analysis of calendar data, we discovered that over 99% of Barcelona listings maintain constant pricing throughout the year. Only 16 out of 19,420 listings showed any price variation, indicating that seasonal demand fluctuations are not reflected in pricing strategies. This finding justified our focus solely on the listings dataset.

---

## 2. Data Understanding and Exploration

### Dataset Characteristics
The initial exploration revealed a rich but complex dataset with significant heterogeneity:

- **Scale**: 19,422 listings with 79 features
- **Data Quality**: Varying levels of completeness across features
- **Feature Types**: Mix of numerical, categorical, and text data
- **Memory Footprint**: 82.7 MB requiring careful processing

### Target Variable Analysis
Price distribution analysis revealed crucial insights:

- **High Right Skew**: Most listings priced under $200, with long tail extending to $10,000+
- **Market Segments**: Clear clustering around budget ($50-100), mid-range ($100-200), and premium ($200+) tiers
- **Outlier Patterns**: Extreme values likely representing data errors or unique properties

### Key Relationship Discovery
Exploratory analysis identified several strong predictive patterns:

- **Room Type Hierarchy**: Entire homes command premium pricing over private rooms, which exceed shared accommodation rates
- **Capacity-Price Linearity**: Strong positive correlation between guest capacity and pricing
- **Property Type Premiums**: Hotels, serviced apartments, and unique properties (boats, etc.) show distinct pricing patterns
- **Location Effects**: Neighborhood significantly impacts pricing, with coastal and central areas commanding premiums

---

## 3. Data Preparation: A Three-Phase Approach

Our data preparation strategy employed a sophisticated three-phase approach designed to maximize information extraction while maintaining data integrity.

### Phase 1: Feature Consolidation (79 → 17 Features)

**Selection Criteria**:
We applied domain knowledge to identify features directly relevant to price determination:

- **Location Features** (3): Geographic coordinates and neighborhood classification
- **Property Features** (6): Size, type, and accommodation characteristics  
- **Host Features** (4): Credibility and responsiveness indicators
- **Booking Features** (3): Availability and stay requirements
- **Amenity Features** (1): Comprehensive amenities list for later processing

**Elimination Rationale**:
Removed features fell into several categories:
- **Administrative Data**: IDs, URLs, scraping metadata
- **Redundant Information**: Multiple representations of the same concept
- **Free Text**: Descriptions and overviews requiring specialized NLP approaches
- **Hypothesis-Based Exclusions**: Reviews and calendar data per our strategic decisions

### Phase 2: Feature Expansion (17 → ~70 Features)

This counterintuitive expansion phase transformed raw data into machine-learning-ready formats:

**Amenities Decomposition**:
The single amenities text field exploded into 18 features:
- 17 binary indicators for high-value amenities (WiFi, kitchen, parking, etc.)
- 1 total amenities count for overall luxury assessment

**Categorical Encoding Strategy**:
- **Neighborhoods**: One-hot encoding for top 15 + "Other" category (16 features)
- **Property Types**: One-hot encoding for top 10 + "Other" category (11 features)  
- **Ordinal Variables**: Label encoding for room types and response times

**Derived Feature Engineering**:
Created 8 meaningful ratios and efficiency metrics:
- Space efficiency: beds per bedroom, guests per bedroom
- Service ratios: bathrooms per guest
- Booking characteristics: stay flexibility indicators
- Availability patterns: availability ratios and high-availability flags

**Critical Data Leakage Prevention**:
Avoided creating any features using the target variable (price), such as price-per-person calculations, to prevent unrealistic model performance.

### Phase 3: Feature Reduction (~70 → ~53 Features)

The final optimization phase balanced information retention with model efficiency:

**Correlation-Based Reduction**:
Identified and removed features with correlation coefficients > 0.9, prioritizing interpretability when choosing between correlated pairs.

**Importance-Based Filtering**:
Used Random Forest feature importance to eliminate features contributing less than 0.001 to predictive power.

**Redundancy Elimination**:
Removed original categorical columns after encoding and cleaned up intermediate processing variables.

---

## 4. Feature Engineering Philosophy

### The Expansion-Reduction Paradigm

Our approach deliberately created more features than needed, then intelligently reduced them. This strategy offers several advantages:

**Benefits of Initial Expansion**:
- **Information Preservation**: Captures all potential predictive signals
- **Domain Knowledge Integration**: Transforms expert insights into quantifiable features
- **Model Compatibility**: Converts categorical and text data into numerical formats

**Benefits of Subsequent Reduction**:
- **Noise Elimination**: Removes features that add complexity without predictive value
- **Overfitting Prevention**: Reduces model complexity relative to sample size
- **Computational Efficiency**: Optimizes training and prediction speed
- **Interpretability Enhancement**: Focuses attention on truly important factors

### Feature Categories and Their Roles

**Location Features**: Capture the real estate principle of "location, location, location" through geographic coordinates and neighborhood classification.

**Property Features**: Quantify the physical characteristics that directly impact accommodation value and guest experience.

**Host Features**: Reflect service quality and reliability factors that influence guest satisfaction and pricing power.

**Amenity Features**: Transform qualitative convenience factors into quantifiable value propositions.

**Derived Features**: Extract hidden relationships and efficiency metrics not apparent in raw data.

---

## 5. Data Quality and Validation

### Missing Data Strategy
Rather than applying blanket imputation, we developed targeted strategies:

- **Structural Missingness**: Addressed systematically (e.g., bedrooms estimated from capacity)
- **Random Missingness**: Handled through domain-appropriate defaults
- **High-Missingness Features**: Removed when missingness exceeded 80%

### Outlier Management
Applied business logic to outlier detection:
- **Extreme Prices**: Capped at $2,000 to remove likely data errors
- **Zero/Negative Prices**: Removed as invalid entries
- **Capacity Outliers**: Validated against property type expectations

### Data Leakage Prevention
Implemented strict protocols to prevent target variable leakage:
- **Feature Independence**: Ensured all features represent information available before pricing decisions
- **Temporal Consistency**: Verified feature availability aligns with real-world pricing workflows
- **Cross-Validation**: Designed evaluation methodology to detect leakage symptoms
