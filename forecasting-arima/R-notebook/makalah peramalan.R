library(readxl)
library(forecast)
library(tseries)
library(ggplot2)

# Load data
data <- read_excel("D:/College/last sem/Magang 2025/Data Produksi Benih.xlsx")

ts_data <- ts(
  data$Produksi_Benih,
  start = c(2023, 1),
  frequency = 12
)

summary(ts_data)
autoplot(ts_data) +
  ggtitle("Data Produksi Induk Asli") +
  xlab("Waktu") + ylab("Produksi")

train <- window(ts_data, end = c(2024,12))
test  <- window(ts_data, start = c(2025,1))

length(train)  # harus 24
length(test)   # harus 12

autoplot(train) + ggtitle("Training Data (2023–2024)")
autoplot(test)  + ggtitle("Testing Data (2025)")

lambda <- BoxCox.lambda(train)
lambda   # CATAT ANGKANYA

train_bc <- BoxCox(train, lambda)
test_bc  <- BoxCox(test,  lambda)

autoplot(train_bc) +
  ggtitle("Box-Cox Training Series") +
  xlab("Waktu") + ylab("Produksi (Box-Cox)")

adf.test(train)
train_d1 <- diff(train)

autoplot(train_d1) +
  ggtitle("Differenced Training Series")

adf.test(train_d1)
# Differencing orde 1
ts_diff1 <- diff(ts_data, differences = 1)

# Plot
plot(
  ts_diff1,
  type = "l",
  col = "dodgerblue3",
  lwd = 1.5,
  main = "Plot Differencing Orde 1 Produksi Induk Udang",
  xlab = "Periode Waktu (Bulan)",
  ylab = "Perubahan Produksi Induk (Ekor)"
)
grid()

# Pastikan data sudah differencing
ts_diff1 <- diff(ts_data, differences = 1)

# Bikin 2 panel (atas = ACF, bawah = PACF)
par(mfrow = c(2, 1), mar = c(4, 4, 3, 2))

# Plot ACF
acf(
  ts_diff1,
  main = "ACF Setelah Differencing Orde 1",
  xlab = "Lag",
  ylab = "ACF",
  col = "dodgerblue3",
  lwd = 2
)

# Plot PACF
pacf(
  ts_diff1,
  main = "PACF Setelah Differencing Orde 1",
  xlab = "Lag",
  ylab = "PACF",
  col = "dodgerblue3",
  lwd = 2
)

# Balikin layout normal
par(mfrow = c(1, 1))


Acf(train_d1, main = "ACF Training")
Pacf(train_d1, main = "PACF Training")

fit_010 <- Arima(train, order = c(0,1,0))
fit_110 <- Arima(train, order = c(1,1,0))
fit_011 <- Arima(train, order = c(0,1,1))
fit_111 <- Arima(train, order = c(1,1,1))

AIC(fit_010, fit_110, fit_011, fit_111)

summary(fit_010)
summary(fit_110)
summary(fit_011)
summary(fit_111)

fit_best <- fit_011

checkresiduals(fit_best)

res <- residuals(fit_best)

# White noise
Box.test(res, lag = 12, type = "Ljung-Box")

# Normalitas
res_std <- (res - mean(res)) / sd(res)
ks.test(res_std, "pnorm")

fc_test <- forecast(fit_best, h = length(test))
accuracy(fc_test, test)

# =========================
# 7. FORECAST FINAL (PAKAI MODEL TERBAIK)
# =========================

best_fit <- fit_011   # ARIMA(0,1,1)

fc <- forecast(best_fit, h = 12)   # 12 periode ke depan

# Plot ramalan
autoplot(fc) +
  ggtitle("Peramalan Produksi Induk Udang (ARIMA(0,1,1))") +
  xlab("Waktu") + ylab("Produksi Induk")

# =========================
# 8. TABEL RAMALAN
# =========================

forecast_table <- data.frame(
  Periode = time(fc$mean),
  Forecast = round(fc$mean, 0),
  Lower_95 = round(fc$lower[,2], 0),
  Upper_95 = round(fc$upper[,2], 0)
)

forecast_table

fit_final <- Arima(ts_data, order=c(0,1,1))
fc_final <- forecast(fit_final, h = 6)
autoplot(fc_final) +
  ggtitle("Peramalan Produksi Induk Udang (ARIMA(0,1,1))") +
  xlab("Waktu") + ylab("Produksi Induk")
forecast_table_final <- data.frame(
  Periode = time(fc_final$mean),
  Forecast = round(fc_final$mean, 0),
  Lower_95 = round(fc_final$lower[,2], 0),
  Upper_95 = round(fc_final$upper[,2], 0)
)

forecast_table_final

fit <- Arima(
  train,
  order = c(0,1,1)   # model terpilih
)

summary(fit)

fc_2025 <- forecast(
  fit,
  h = length(test),   # = 12
  level = 95
)


autoplot(fc_2025) +
  autolayer(test, series = "Data Aktual 2025", color = "red") +
  ggtitle("Peramalan Produksi Benih Udang Tahun 2025 (ARIMA(0,1,1))") +
  xlab("Waktu") +
  ylab("Produksi Benih")

