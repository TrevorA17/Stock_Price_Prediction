# Load dataset
stock_data <- read.csv("data/stock.csv", colClasses = c(
  Date = "Date",
  High = "numeric",
  Low = "numeric",
  Open = "numeric",
  Close = "numeric",
  Volume = "numeric",
  Adj_Close = "numeric"
))

# Display the structure of the dataset
str(stock_data)

# View the first few rows of the dataset
head(stock_data)

# Open the dataset in a viewer window
View(stock_data)

# Set seed for reproducibility
set.seed(123)

# Determine the number of rows for training and testing sets
total_rows <- nrow(stock_data)
train_rows <- round(0.8 * total_rows)  # 80% for training
test_rows <- total_rows - train_rows   # Remaining 20% for testing

# Randomly shuffle the indices of rows
indices <- sample(total_rows)

# Split the indices into training and testing indices
train_indices <- indices[1:train_rows]
test_indices <- indices[(train_rows + 1):total_rows]

# Split the dataset into training and testing sets
train_data <- stock_data[train_indices, ]
test_data <- stock_data[test_indices, ]

# Check the dimensions of training and testing sets
cat("Training data dimensions:", dim(train_data), "\n")
cat("Testing data dimensions:", dim(test_data))

# Load necessary libraries
library(forecast)

# Convert 'Date' column to Date format
stock_data$Date <- as.Date(stock_data$Date, format = "%d-%m-%y")

# Sort the data by Date
stock_data <- stock_data[order(stock_data$Date), ]

# Create a time series object
ts_data <- ts(stock_data$Close, frequency = 365)

# Split data into training and testing sets
split_index <- floor(0.8 * length(ts_data))
train_data <- ts_data[1:split_index]
test_data <- ts_data[(split_index + 1):length(ts_data)]

# Fit an ARIMA model
model <- auto.arima(train_data)

# Make predictions on the test data
forecast_values <- forecast(model, h = length(test_data))

# Evaluate the model
accuracy(forecast_values, test_data)

# Load necessary libraries
library(forecast)

# Convert 'Date' column to Date format
stock_data$Date <- as.Date(stock_data$Date, format = "%d-%m-%y")

# Sort the data by Date
stock_data <- stock_data[order(stock_data$Date), ]

# Create a time series object
ts_data <- ts(stock_data$Close, frequency = 365)

# Define the number of folds for time series cross-validation
num_folds <- 5

# Perform time series cross-validation
cv_results <- tsCV(ts_data, forecastfunction = auto.arima, h = 1, initial = floor(length(ts_data) * 0.8))

# Display cross-validation results
print(cv_results)

