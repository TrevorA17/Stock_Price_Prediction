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


