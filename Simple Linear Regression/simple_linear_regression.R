# Simple Linear Regression in R
# Importing the dataset
dataset = read.csv('marks_data.csv')

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Hours, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)
# Fitting Simple Linear Regression to the Training set
regressor = lm(formula = Grade ~ Hours,data = training_set)

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

# Visualising the Training set results
library(ggplot2)
ggplot() + geom_point(aes(x = training_set$Hours, y = training_set$Grade),colour = 'red') + geom_line(aes(x = training_set$Hours, y = predict(regressor, newdata = training_set)),colour = 'blue') + ggtitle('Marks vs Hours (Training set)') + xlab('Hours') + ylab('Marks')

# Visualising the Test set results
library(ggplot2)
ggplot() + geom_point(aes(x = test_set$Hours, y = test_set$Grade), colour = 'red') +
  geom_line(aes(x = training_set$Hours, y = predict(regressor, newdata = training_set)),colour = 'blue') +
  ggtitle('Marks vs Hours (Test set)') +
  xlab('Hours') +
  ylab('Marks')