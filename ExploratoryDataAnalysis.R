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

# Summary statistics for numeric variables
summary(stock_data[, c("High", "Low", "Open", "Close", "Volume", "Adj_Close")])

# Mean for numeric variables
mean_values <- sapply(stock_data[, c("High", "Low", "Open", "Close", "Volume", "Adj_Close")], mean)
cat("Mean values:\n")
print(mean_values)

# Median for numeric variables
median_values <- sapply(stock_data[, c("High", "Low", "Open", "Close", "Volume", "Adj_Close")], median)
cat("\nMedian values:\n")
print(median_values)
