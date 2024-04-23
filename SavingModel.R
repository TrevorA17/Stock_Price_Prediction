# Saving the ARIMA model
saveRDS(model, "./models/saved_arima_model.rds")

new_data <- data.frame(
  Date = as.Date("2024-04-24"),  # Example value for Date
  High = 2094.120117,  # Example value for High
  Low = 2070.290039,  # Example value for Low
  Open = 2084.419922,  # Example value for Open
  Close = 2089.139893,  # Example value for Close
  Volume = 3884930000,  # Example value for Volume
  Adj_Close = 2089.139893  # Example value for Adj Close
)

# Use the loaded model to make predictions
loaded_model <- readRDS("./models/saved_arima_model.rds")
predictions_loaded_model <- forecast(loaded_model, h = 1)

# Print predictions
print(predictions_loaded_model)
