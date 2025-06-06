dataset = read.csv('C:/Users/k18at/Downloads/taxi_trip_pricing.csv')
dataset
dataset <- dataset[c("Trip_Distance_km", "Trip_Duration_Minutes")]
dataset <- na.omit(dataset)

library(e1071)
regressor = svm(formula = Trip_Distance_km ~ .,
                data = dataset,
                type = 'eps-regression',
                kernel = 'radial')

x_grid <- seq(min(dataset$Trip_Distance_km), max(dataset$Trip_Distance_km), 0.1)

new_data <- data.frame(
  Trip_Distance_km = x_grid,        # varying
  Trip_Duration_Minutes = 20        # fixed
)

predicted_values <- predict(regressor, newdata = new_data)

ggplot() +
  geom_point(aes(x = dataset$Trip_Distance_km, y = dataset$Trip_Distance_km),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predicted_values),
            colour = 'blue') +
  ggtitle('SVR: Predicted Distance vs Actual Distance') +
  xlab('Trip_Distance_km') +
  ylab('Predicted Trip_Distance_km')

