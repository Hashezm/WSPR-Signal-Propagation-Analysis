# WSPR-Signal-Propagation-Analysis
A comprehensive analysis of weak signal propagation within the WSPR network, focusing on the impact of distance, frequency, and power on signal-to-noise ratios. The project includes data cleaning, statistical analysis, and linear regression modeling to predict signal reception quality and understand the factors influencing signal propagation.

# WSPR Signal Propagation Analysis

## Description
A comprehensive analysis of weak signal propagation within the WSPR network, focusing on the impact of distance, frequency, and power on signal-to-noise ratios. The project includes data cleaning, statistical analysis, and machine learning modeling to predict signal reception quality and understand the factors influencing signal propagation.

## Table of Contents
- [Description](#description)
- [Features](#features)
- [Data Description](#data-description)
- [Analysis and Results](#analysis-and-results)
- [Modeling](#modeling)
- [Conclusion](#conclusion)
- [Contributing](#contributing)



## Features
- **Data Cleaning**: Handling missing values and imputing numerical data.
- **Statistical Summary**: Summary statistics and outlier detection.
- **Unique Values Analysis**: Counting unique values in specific columns.
- **Distance Analysis**: Calculating average distance for signals with specified power.
- **Frequency Analysis**: Identifying the receiving station with the most transmissions in a specified band.
- **Data Partitioning**: Splitting the data into training and testing sets.
- **Linear Regression Modeling**: Predicting signal-to-noise ratio based on distance, frequency, and power.
- **Model Evaluation**: Assessing model accuracy and making predictions.

## Data Description
The data set consists of the following columns:
- `id`: Unique identifier for each reception report
- `time`: Date and time of signal received (YYYY-MM-DD HH:MM:SS format)
- `band`: Fixed designator for frequency band (values: -1, 0, 1, 3, …, 1296)
- `rx_sign`: Call sign of station receiving signal
- `rx_lat`: Latitude of receiving station
- `rx_lon`: Longitude of receiving station
- `rx_loc`: Grid square of receiving station
- `tx_sign`: Call sign of transmitting station
- `tx_lat`: Latitude of transmitting station
- `tx_lon`: Longitude of transmitting station
- `tx_loc`: Grid square of transmitting station
- `distance`: Distance between receiving and transmitting stations (km)
- `azimuth`: Compass direction of signal received from transmitting station
- `rx_azimuth`: Compass direction of signal transmitted to receiving station
- `frequency`: Receive frequency (Hz)
- `power`: Transmission power (dBm)
- `snr`: Signal-to-noise ratio of received signal (dB) in 2.5 kHz bandwidth
- `drift`: Reported frequency drift
- `version`: Receiver software version
- `code`: Encoding type of signal

## Analysis and Results
### Data Cleaning
Performed data imputation on numerical columns to handle missing values.

### Summary Statistics
Generated summary statistics for all numerical columns to understand data distribution and detect outliers.

### Unique Values Analysis
Counted unique values in `band`, `rx_sign`, and `tx_sign` columns.

### Distance Analysis
Calculated average distance between transmitting and receiving stations for signals with power less than 30 dBm.

### Frequency Analysis
Identified the receiving station with the most transmissions on the 14 MHz band.

## Modeling
### Data Partitioning
Randomly partitioned the data into training (80%) and testing (20%) sets using the `createDataPartition()` function from the `caret` package.

### Linear Regression Model
Generated a linear regression model to predict the signal-to-noise ratio based on distance, frequency, and power.

### Model Evaluation
Evaluated the accuracy of the model using the testing data set and appropriate accuracy metrics. Discussed the performance and potential improvements.

## Conclusion
Summarized the findings from the analysis and modeling. Provided insights into the factors affecting WSPR signal propagation and the effectiveness of the predictive model.

## Contributing
Contributions are welcome! Please submit a pull request or open an issue to discuss your ideas.

