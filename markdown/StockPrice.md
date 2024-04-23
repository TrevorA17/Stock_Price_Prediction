Stock Price Prediction
================
134780 Trevor Okinda
April 2024

- [Student Details](#student-details)
- [Setup Chunk](#setup-chunk)

# Student Details

|                       |                              |
|-----------------------|------------------------------|
| **Student ID Number** | 134780                       |
| **Student Name**      | Trevor Okinda                |
| **BBIT 4.2 Group**    | C                            |
| **Project Name**      | Stock Price Prediction Model |

# Setup Chunk

**Note:** the following KnitR options have been set as the global
defaults: <BR>
`knitr::opts_chunk$set(echo = TRUE, warning = FALSE, eval = TRUE, collapse = FALSE, tidy = TRUE)`.

More KnitR options are documented here
<https://bookdown.org/yihui/rmarkdown-cookbook/chunk-options.html> and
here <https://yihui.org/knitr/options/>.

``` r
# Load dataset
stock_data <- read.csv("stock.csv", colClasses = c(
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
```

    ## 'data.frame':    1825 obs. of  7 variables:
    ##  $ Date     : Date, format: "0023-11-15" "0024-11-15" ...
    ##  $ High     : num  2096 2094 2093 2093 2093 ...
    ##  $ Low      : num  2081 2070 2086 2086 2084 ...
    ##  $ Open     : num  2089 2084 2089 2089 2089 ...
    ##  $ Close    : num  2087 2089 2089 2089 2090 ...
    ##  $ Volume   : num  3.59e+09 3.88e+09 2.85e+09 2.85e+09 1.47e+09 ...
    ##  $ Adj_Close: num  2087 2089 2089 2089 2090 ...

``` r
# View the first few rows of the dataset
head(stock_data)
```

    ##         Date    High     Low    Open   Close     Volume Adj_Close
    ## 1 0023-11-15 2095.61 2081.39 2089.41 2086.59 3587980000   2086.59
    ## 2 0024-11-15 2094.12 2070.29 2084.42 2089.14 3884930000   2089.14
    ## 3 0025-11-15 2093.00 2086.30 2089.30 2088.87 2852940000   2088.87
    ## 4 0026-11-15 2093.00 2086.30 2089.30 2088.87 2852940000   2088.87
    ## 5 0027-11-15 2093.29 2084.13 2088.82 2090.11 1466840000   2090.11
    ## 6 0028-11-15 2093.29 2084.13 2088.82 2090.11 1466840000   2090.11

``` r
# Open the dataset in a viewer window
View(stock_data)
```

``` r
# Summary statistics for numeric variables
summary(stock_data[, c("High", "Low", "Open", "Close", "Volume", "Adj_Close")])
```

    ##       High           Low            Open          Close     
    ##  Min.   :1847   Min.   :1810   Min.   :1833   Min.   :1829  
    ##  1st Qu.:2348   1st Qu.:2322   1st Qu.:2342   1st Qu.:2329  
    ##  Median :2696   Median :2668   Median :2685   Median :2683  
    ##  Mean   :2661   Mean   :2633   Mean   :2648   Mean   :2648  
    ##  3rd Qu.:2931   3rd Qu.:2901   3rd Qu.:2914   3rd Qu.:2918  
    ##  Max.   :3646   Max.   :3600   Max.   :3612   Max.   :3627  
    ##      Volume            Adj_Close   
    ##  Min.   :1.297e+09   Min.   :1829  
    ##  1st Qu.:3.258e+09   1st Qu.:2329  
    ##  Median :3.610e+09   Median :2683  
    ##  Mean   :3.870e+09   Mean   :2648  
    ##  3rd Qu.:4.143e+09   3rd Qu.:2918  
    ##  Max.   :9.045e+09   Max.   :3627

``` r
# Mean for numeric variables
mean_values <- sapply(stock_data[, c("High", "Low", "Open", "Close", "Volume", "Adj_Close")], mean)
cat("Mean values:\n")
```

    ## Mean values:

``` r
print(mean_values)
```

    ##         High          Low         Open        Close       Volume    Adj_Close 
    ## 2.660719e+03 2.632818e+03 2.647705e+03 2.647856e+03 3.869627e+09 2.647856e+03

``` r
# Median for numeric variables
median_values <- sapply(stock_data[, c("High", "Low", "Open", "Close", "Volume", "Adj_Close")], median)
cat("\nMedian values:\n")
```

    ## 
    ## Median values:

``` r
print(median_values)
```

    ##        High         Low        Open       Close      Volume   Adj_Close 
    ## 2.69625e+03 2.66784e+03 2.68549e+03 2.68334e+03 3.60974e+09 2.68334e+03

``` r
# Range for numeric variables
range_values <- sapply(stock_data[, c("High", "Low", "Open", "Close", "Volume", "Adj_Close")], function(x) c(min(x), max(x)))
cat("Range values:\n")
```

    ## Range values:

``` r
print(range_values)
```

    ##         High     Low    Open   Close     Volume Adj_Close
    ## [1,] 1847.00 1810.10 1833.40 1829.08 1296540000   1829.08
    ## [2,] 3645.99 3600.16 3612.09 3626.91 9044690000   3626.91

``` r
# Interquartile range (IQR) for numeric variables
iqr_values <- sapply(stock_data[, c("High", "Low", "Open", "Close", "Volume", "Adj_Close")], IQR)
cat("\nInterquartile range (IQR) values:\n")
```

    ## 
    ## Interquartile range (IQR) values:

``` r
print(iqr_values)
```

    ##         High          Low         Open        Close       Volume    Adj_Close 
    ## 5.824399e+02 5.784600e+02 5.718801e+02 5.885701e+02 8.849000e+08 5.885701e+02

``` r
# Standard deviation for numeric variables
sd_values <- sapply(stock_data[, c("High", "Low", "Open", "Close", "Volume", "Adj_Close")], sd)
cat("\nStandard deviation values:\n")
```

    ## 
    ## Standard deviation values:

``` r
print(sd_values)
```

    ##         High          Low         Open        Close       Volume    Adj_Close 
    ## 4.096809e+02 4.043101e+02 4.071700e+02 4.073012e+02 1.087593e+09 4.073012e+02

``` r
# Variance for numeric variables
variance_values <- sapply(stock_data[, c("High", "Low", "Open", "Close", "Volume", "Adj_Close")], var)
cat("\nVariance values:\n")
```

    ## 
    ## Variance values:

``` r
print(variance_values)
```

    ##         High          Low         Open        Close       Volume    Adj_Close 
    ## 1.678384e+05 1.634666e+05 1.657874e+05 1.658942e+05 1.182858e+18 1.658942e+05

``` r
# Correlation matrix for numeric variables
correlation_matrix <- cor(stock_data[, c("High", "Low", "Open", "Close", "Volume", "Adj_Close")])
cat("Correlation matrix:\n")
```

    ## Correlation matrix:

``` r
print(correlation_matrix)
```

    ##                High       Low       Open      Close     Volume  Adj_Close
    ## High      1.0000000 0.9981539 0.99932811 0.99895826 0.08421190 0.99895826
    ## Low       0.9981539 1.0000000 0.99879394 0.99901990 0.04455660 0.99901990
    ## Open      0.9993281 0.9987939 1.00000000 0.99834414 0.06972893 0.99834414
    ## Close     0.9989583 0.9990199 0.99834414 1.00000000 0.06340085 1.00000000
    ## Volume    0.0842119 0.0445566 0.06972893 0.06340085 1.00000000 0.06340085
    ## Adj_Close 0.9989583 0.9990199 0.99834414 1.00000000 0.06340085 1.00000000

``` r
# Pairwise scatterplots for numeric variables
pairs(stock_data[, c("High", "Low", "Open", "Close", "Volume", "Adj_Close")])
```

![](StockPrice_files/figure-gfm/Measures%20of%20Relationship-1.png)<!-- -->

``` r
# Load necessary library
library(ggplot2)

# Univariate histogram for 'Close' price
ggplot(stock_data, aes(x = Close)) +
  geom_histogram(binwidth = 50, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Close Price", x = "Close Price", y = "Frequency")
```

![](StockPrice_files/figure-gfm/Basic%20Visualizations-1.png)<!-- -->

``` r
# Univariate boxplot for 'Volume'
ggplot(stock_data, aes(y = Volume)) +
  geom_boxplot(fill = "lightgreen", color = "black") +
  labs(title = "Boxplot of Volume", y = "Volume")
```

![](StockPrice_files/figure-gfm/Basic%20Visualizations-2.png)<!-- -->

``` r
# Univariate density plot for 'High' price
ggplot(stock_data, aes(x = High)) +
  geom_density(fill = "orange", color = "black") +
  labs(title = "Density Plot of High Price", x = "High Price", y = "Density")
```

![](StockPrice_files/figure-gfm/Basic%20Visualizations-3.png)<!-- -->

``` r
# Load necessary library
library(ggplot2)

# Multivariate scatter plot matrix
scatterplot_matrix <- ggplot(stock_data, aes(x = High, y = Low)) +
  geom_point(color = "blue") +
  labs(title = "Scatter Plot Matrix of High vs. Low Prices")

# Display the scatter plot matrix
print(scatterplot_matrix)
```

![](StockPrice_files/figure-gfm/Basic%20Visualizations-4.png)<!-- -->

``` r
# Scatter plot with size encoding for 'Volume' and color encoding for 'High' prices
scatterplot <- ggplot(stock_data, aes(x = High, y = Low, size = Volume, color = High)) +
  geom_point(alpha = 0.7) +
  scale_size_continuous(name = "Volume") +
  scale_color_gradient(low = "green", high = "red", name = "High Price") +
  labs(title = "Scatter Plot of High vs. Low Prices with Volume Encoding")

# Display the scatter plot
print(scatterplot)
```

![](StockPrice_files/figure-gfm/Basic%20Visualizations-5.png)<!-- -->

``` r
# Scatter plot with color encoding for 'Open' and 'Close' prices
scatterplot <- ggplot(stock_data, aes(x = Open, y = Close, color = abs(Close - Open))) +
  geom_point() +
  scale_color_gradient(low = "blue", high = "red", name = "Price Difference") +
  labs(title = "Scatter Plot of Open vs. Close Prices")

# Display the scatter plot
print(scatterplot)
```

![](StockPrice_files/figure-gfm/Basic%20Visualizations-6.png)<!-- -->

``` r
# Check for missing values in the dataset
missing_values <- colSums(is.na(stock_data))

# Display the number of missing values for each variable
print(missing_values)
```

    ##      Date      High       Low      Open     Close    Volume Adj_Close 
    ##         0         0         0         0         0         0         0

``` r
# Check if any missing values exist in the dataset
if (sum(missing_values) > 0) {
  print("Missing values are present in the dataset.")
} else {
  print("No missing values found in the dataset.")
}
```

    ## [1] "No missing values found in the dataset."
