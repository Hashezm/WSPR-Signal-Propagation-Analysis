
wspr <- read.csv('/public/bmort/R/wspr.csv')
head(wspr, 5)

sum(is.na(wspr))

colSums(is.na(wspr))

mean(wspr$snr, na.rm = TRUE)

rows_with_na <- apply(is.na(wspr), 1, any)
which(rows_with_na)

wspr[100016,'snr'] = mean(wspr$snr, na.rm = TRUE)

wspr[100016,'snr']

summary(wspr)

sapply(wspr, function(x) if(is.numeric(x)) c(Range = diff(range(x, na.rm = TRUE))) else 'NOT APPLICABLE')

hist(wspr$id, breaks=sqrt(length(wspr$id))/2)

has_outliers <- function(x) {
  if(is.numeric(x)) {
    Q1 <- quantile(x, 0.25, na.rm = TRUE)
    Q3 <- quantile(x, 0.75, na.rm = TRUE)
    IQR <- Q3 - Q1
    lower_bound <- Q1 - 1.5 * IQR
    upper_bound <- Q3 + 1.5 * IQR
    return(any(x < lower_bound | x > upper_bound))
  } else {
    return(NA) # Non-numeric columns cannot have numeric outliers, so we'll return NA here
  }
}

sapply(wspr, has_outliers)

length(unique(wspr$band))

length(unique(wspr$rx_sign))

length(unique(wspr$tx_sign))

distance_subset <- wspr[wspr$power < 30, 'distance']
mean(distance_subset)

band_subset <- (wspr[wspr$band == 14, 'rx_sign'])

length(band_subset)

#unique(band_subset)

length(unique(band_subset))

tab <- tabulate(match(band_subset, unique(band_subset)))
tab

most_freq <- max(tab)
most_freq

mode_values <- unique(band_subset)[tab == most_freq]
mode_values

library(caret)

training_size <- floor(0.80 * nrow(wspr))
training_indices <- sample(seq_len(nrow(wspr)), size = training_size)
training_set <- wspr[training_indices, ]

testing_set <- wspr[-training_indices, ]


model_formula <- snr ~ distance + frequency + power

#Training the Model
linear_model <- lm(model_formula, data = training_set) # Use your training dataset here

#Summary of the Model
summary(linear_model)


predictions <- predict(linear_model, newdata = testing_set)

actual_snr <- testing_set$snr

mse <- mean((actual_snr - predictions)^2)

rmse <- sqrt(mse)

print(paste("MSE:", mse))
print(paste("RMSE:", rmse))


new_data <- data.frame(distance = 2000, frequency = 14030000, power = 31)

predict(linear_model, newdata = new_data)


