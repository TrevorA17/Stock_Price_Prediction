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

# Check for missing values in the dataset
missing_values <- colSums(is.na(stock_data))

# Display the number of missing values for each variable
print(missing_values)

# Check if any missing values exist in the dataset
if (sum(missing_values) > 0) {
  print("Missing values are present in the dataset.")
} else {
  print("No missing values found in the dataset.")
}

# Standardization of numeric variables (mean = 0, standard deviation = 1)
numeric_vars <- c("High", "Low", "Open", "Close", "Volume", "Adj_Close")
stock_data_standardized <- scale(stock_data[, numeric_vars])

# Check the summary statistics of standardized variables
summary(stock_data_standardized)

# Min-max scaling of 'Volume' variable to range [0, 1]
min_volume <- min(stock_data$Volume)
max_volume <- max(stock_data$Volume)
stock_data$Volume_scaled <- (stock_data$Volume - min_volume) / (max_volume - min_volume)

# Check the summary statistics of scaled 'Volume' variable
summary(stock_data$Volume_scaled)



