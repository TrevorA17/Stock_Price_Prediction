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

# Range for numeric variables
range_values <- sapply(stock_data[, c("High", "Low", "Open", "Close", "Volume", "Adj_Close")], function(x) c(min(x), max(x)))
cat("Range values:\n")
print(range_values)

# Interquartile range (IQR) for numeric variables
iqr_values <- sapply(stock_data[, c("High", "Low", "Open", "Close", "Volume", "Adj_Close")], IQR)
cat("\nInterquartile range (IQR) values:\n")
print(iqr_values)

# Standard deviation for numeric variables
sd_values <- sapply(stock_data[, c("High", "Low", "Open", "Close", "Volume", "Adj_Close")], sd)
cat("\nStandard deviation values:\n")
print(sd_values)

# Variance for numeric variables
variance_values <- sapply(stock_data[, c("High", "Low", "Open", "Close", "Volume", "Adj_Close")], var)
cat("\nVariance values:\n")
print(variance_values)

# Correlation matrix for numeric variables
correlation_matrix <- cor(stock_data[, c("High", "Low", "Open", "Close", "Volume", "Adj_Close")])
cat("Correlation matrix:\n")
print(correlation_matrix)

# Pairwise scatterplots for numeric variables
pairs(stock_data[, c("High", "Low", "Open", "Close", "Volume", "Adj_Close")])

# Load necessary library
library(ggplot2)

# Univariate histogram for 'Close' price
ggplot(stock_data, aes(x = Close)) +
  geom_histogram(binwidth = 50, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Close Price", x = "Close Price", y = "Frequency")

# Univariate boxplot for 'Volume'
ggplot(stock_data, aes(y = Volume)) +
  geom_boxplot(fill = "lightgreen", color = "black") +
  labs(title = "Boxplot of Volume", y = "Volume")

# Univariate density plot for 'High' price
ggplot(stock_data, aes(x = High)) +
  geom_density(fill = "orange", color = "black") +
  labs(title = "Density Plot of High Price", x = "High Price", y = "Density")

# Load necessary library
library(ggplot2)

# Multivariate scatter plot matrix
scatterplot_matrix <- ggplot(stock_data, aes(x = High, y = Low)) +
  geom_point(color = "blue") +
  labs(title = "Scatter Plot Matrix of High vs. Low Prices")

# Display the scatter plot matrix
print(scatterplot_matrix)

# Scatter plot with size encoding for 'Volume' and color encoding for 'High' prices
scatterplot <- ggplot(stock_data, aes(x = High, y = Low, size = Volume, color = High)) +
  geom_point(alpha = 0.7) +
  scale_size_continuous(name = "Volume") +
  scale_color_gradient(low = "green", high = "red", name = "High Price") +
  labs(title = "Scatter Plot of High vs. Low Prices with Volume Encoding")

# Display the scatter plot
print(scatterplot)

# Scatter plot with color encoding for 'Open' and 'Close' prices
scatterplot <- ggplot(stock_data, aes(x = Open, y = Close, color = abs(Close - Open))) +
  geom_point() +
  scale_color_gradient(low = "blue", high = "red", name = "Price Difference") +
  labs(title = "Scatter Plot of Open vs. Close Prices")

# Display the scatter plot
print(scatterplot)



