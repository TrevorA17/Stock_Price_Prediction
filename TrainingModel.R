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
