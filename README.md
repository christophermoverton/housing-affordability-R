# Housing Affordability in U.S. Metropolitan Areas (2000–2025)

## Overview

This project analyzes housing affordability across U.S. metropolitan areas from 2000 to 2025 by integrating home price data, mortgage rates, inflation, and median household income into a unified metro–month panel. The goal is to distinguish between **short-run affordability shocks** driven by financing conditions and **long-run structural pressures** driven by the divergence between home prices and household income.

The analysis combines exploratory data analysis, regression-based elasticity estimation, and counterfactual simulation to quantify the relative importance of mortgage rates, prices, and income in shaping housing affordability over time.

---

## Data Sources

- **Zillow Home Value Index (ZHVI)**  
  Monthly median home values by metropolitan area.

- **Federal Reserve Economic Data (FRED)**  
  - 30-year fixed mortgage rate  
  - Consumer Price Index (CPI)

- **U.S. Census Bureau (ACS)**  
  - Median household income (ACS 5-year estimates)

Raw data are ingested from public APIs and source files, then transformed into analysis-ready datasets.

---

## Project Structure

```text
.
├── 01_transformed_raw_to_process.Rmd     # Data ingestion & transformation
├── 02_analysis_eda_modeling.qmd          # EDA, modeling, counterfactuals
├── R/                                   # Helper functions
├── data/
│   ├── raw/                             # Raw source data (not tracked)
│   └── processed/                       # Cleaned, analysis-ready data
├── renv.lock                            # Reproducible R environment
├── housing-affordability.Rproj
└── README.md
````

---

## Methodology

1. **Feature Engineering**

   * Inflation-adjusted home prices
   * Mortgage payment proxy
   * Housing affordability index
   * Growth rates and log-transformed variables

2. **Exploratory Data Analysis**

   * National and regional affordability trends
   * Distributional shifts over time
   * Price growth vs income growth comparisons

3. **Modeling**

   * Log-linear regression models estimating affordability elasticities
   * Metro fixed-effects specifications
   * Short-run vs long-run dynamics

4. **Counterfactual Analysis**

   * Simulated affordability under constant mortgage rates (e.g., 3%)
   * Quantification of rate-driven affordability losses post-2021

---

## Key Findings

* Mortgage interest rates dominate **short-run affordability changes**, explaining much of the post-2021 collapse.
* Long-run affordability erosion is driven by **persistent home price growth outpacing income growth**.
* Affordability declines are **broad-based across metropolitan areas**, not confined to traditionally high-cost markets.

---

## Setup and Reproducibility

This project is fully reproducible using **`renv`** for package management and **`.Renviron`** for secure handling of API keys.

### 1. R Environment (`renv`)

The project uses `renv` to lock package versions.

To restore the environment:

```r
install.packages("renv")
renv::restore()
```

This will install the exact package versions recorded in `renv.lock`.

> The `renv/library/` directory is intentionally excluded from version control.

---

### 2. API Keys (`.Renviron`)

Some data sources require API keys (e.g., FRED, Census).

These are stored locally in a `.Renviron` file, which is **not tracked by Git**.

Create a file named `.Renviron` in the project root (or your home directory) with the following contents:

```text
FRED_API_KEY=your_fred_api_key_here
CENSUS_API_KEY=your_census_api_key_here
```

Restart R after creating or modifying `.Renviron`.

A template file (`.Renviron.example`) is provided for reference.

---

### 3. Data Availability

* `data/raw/` contains original source data and is **not tracked**
* `data/processed/` contains cleaned datasets used for analysis and **is tracked**

All results can be reproduced by running the notebooks in order.

---

## How to Run the Analysis

1. Restore the R environment with `renv::restore()`
2. Add API keys to `.Renviron`
3. Run:

   * `01_transformed_raw_to_process.Rmd`
   * `02_analysis_eda_modeling.qmd`

---

## Limitations

* Income data are sourced from ACS 5-year estimates and interpolated to monthly frequency.
* Regression results are descriptive and should not be interpreted as fully causal.
* Affordability is mechanically constructed from prices, income, and interest rates.

---

## License

This project is for educational and analytical purposes. Data sources retain their original licenses.


