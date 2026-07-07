# shrimp-production-forecasting
Time series forecasting of shrimp seed and broodstock production using ARIMA models in R and Minitab.
# 📈 Shrimp Production Forecasting using ARIMA

A time series forecasting project conducted during my internship at the Balai Produksi Induk Udang Unggul dan Kekerangan (BPIU2K), Ministry of Marine Affairs and Fisheries, Indonesia.

This project applies the Autoregressive Integrated Moving Average (ARIMA) method to forecast shrimp seed and broodstock production, providing data-driven insights to support production planning and resource allocation.

---

## Project Overview

Shrimp production is characterized by substantial fluctuations caused by biological, environmental, and operational factors. These fluctuations make production planning challenging and may affect resource allocation, inventory management, and operational efficiency.

This project develops forecasting models to estimate future shrimp seed and broodstock production using historical production data.

---

## Objectives

- Analyze historical shrimp production patterns.
- Identify appropriate ARIMA models for forecasting.
- Evaluate model performance using forecasting accuracy metrics.
- Generate production forecasts to support operational planning.

---

## Organization

Balai Produksi Induk Udang Unggul dan Kekerangan (BPIU2K)

Ministry of Marine Affairs and Fisheries, Indonesia

Internship Project

---

## Dataset

### Source

Internal production records from BPIU2K Karangasem.

### Period

January 2023 – December 2025

### Variables

- Shrimp Seed Production
- Shrimp Broodstock Production

---

## Methodology

The forecasting process followed the Box-Jenkins ARIMA framework:

1. Data Exploration
2. Stationarity Testing
3. Box-Cox Transformation
4. Augmented Dickey-Fuller (ADF) Test
5. First Differencing
6. ACF & PACF Analysis
7. ARIMA Model Identification
8. Parameter Estimation
9. Residual Diagnostics
10. Forecast Generation
11. Model Evaluation

---

## Stationarity Analysis

### Variance Stationarity

Box-Cox transformation was applied to assess variance stability.

Results indicated that the data were already stationary in variance.

### Mean Stationarity

The Augmented Dickey-Fuller (ADF) test showed that both production series were initially non-stationary.

After applying first differencing, the transformed series became stationary and suitable for ARIMA modeling.

---

## Candidate Models

Based on ACF and PACF patterns, the following candidate models were evaluated:

- ARIMA(0,1,1)
- ARIMA(1,1,0)
- ARIMA(1,1,1)

Model selection was performed using:

- Parameter significance tests
- Akaike Information Criterion (AIC)

---

## Selected Model

### Shrimp Seed Production

**ARIMA(0,1,1)**

AIC = 796.90

### Shrimp Broodstock Production

**ARIMA(0,1,1)**

AIC = 461.87

The ARIMA(0,1,1) model produced the lowest AIC value and statistically significant parameters, making it the preferred forecasting model for both datasets.

---

## Residual Diagnostics

The selected model was evaluated through residual analysis.

### White Noise Test

Residuals showed no significant autocorrelation.

### Normality Test

Kolmogorov-Smirnov tests indicated that residuals followed a normal distribution.

These results confirmed that the ARIMA model satisfied key assumptions and was suitable for forecasting.

---

## Forecast Evaluation

### Shrimp Broodstock Production

| Metric | Value |
|----------|----------|
| MAPE | 46.74% |
| RMSE | 4649.23 |
| MAE | 3511.11 |

### Shrimp Seed Production

| Metric | Value |
|----------|----------|
| RMSE | 6767.05 |
| MAE | 920.40 |

MAPE was not used for final evaluation of seed production due to zero or near-zero actual values.

---

## Forecast Results

The forecasting results demonstrated that the ARIMA(0,1,1) model successfully captured the overall movement of production data despite substantial fluctuations.

Forecast intervals remained consistent with historical production behavior and provided useful estimates for short-term production planning.

---

## Business Insights

### Operational Planning

Forecasts can be used to anticipate future production levels and support scheduling decisions.

### Resource Allocation

Production estimates help optimize labor, feed, facility utilization, and operational resources.

### Risk Management

Forecasting provides early indications of production declines or unexpected fluctuations.

### Decision Support

Data-driven forecasting improves planning accuracy compared to relying solely on historical averages.

---

## Technologies Used

- R
- Minitab
- ARIMA
- Box-Cox Transformation
- ADF Test
- ACF & PACF Analysis
- Time Series Forecasting

---

## Repository Contents

- R Scripts
- Forecast Visualizations
- ACF & PACF Plots
- Residual Diagnostic Results

---

## Key Takeaways

- Conducted end-to-end time series forecasting using the Box-Jenkins ARIMA methodology.
- Applied stationarity testing and residual diagnostics to ensure model validity.
- Identified ARIMA(0,1,1) as the best-performing model for both production series.
- Generated production forecasts to support operational and strategic decision-making.
- Translated statistical forecasting results into practical business recommendations.

---

## Author

**Putri Ayu Permata Dewi**

Business Statistics Graduate | Data Analyst | Forecasting | Machine Learning | Business Intelligence

📧 putriayupermatad@gmail.com

💼 linkedin.com/in/putriayupd
