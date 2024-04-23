# Load the ARIMA model
loaded_arima_model <- readRDS("./models/saved_arima_model.rds")

#* @apiTitle Stock Price Prediction Model API
#* @apiDescription Used to predict stock prices.

#* @param Date Date of the stock price (YYYY-MM-DD)
#* @param High Highest price of the day
#* @param Low Lowest price of the day
#* @param Open Opening price of the day
#* @param Close Closing price of the day
#* @param Volume Volume of stocks traded
#* @param AdjClose Adjusted closing price of the day

#* @get /stock_prediction
predict_stock_price <- function(Date, High, Low, Open, Close, Volume, AdjClose) {
  
  # Create a data frame using the arguments
  to_be_predicted <- data.frame(
    Date = as.Date(Date),
    High = as.numeric(High),
    Low = as.numeric(Low),
    Open = as.numeric(Open),
    Close = as.numeric(Close),
    Volume = as.numeric(Volume),
    AdjClose = as.numeric(AdjClose)
  )
  
  # Use the loaded model to make predictions
  prediction <- predict(loaded_arima_model, newdata = to_be_predicted)
  
  # Return the prediction
  return(prediction)
}