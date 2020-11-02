# Data Preprocessing

# Importing the dataset
dataset = read.csv('Data.csv')

# Missing data
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)
dataset$Salary = ifelse(is.na(dataset$Salary),
                        ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                        dataset$Salary)

# Encoding categorical data
dataset$Country = factor(dataset$Country,
                         levels = c('America', 'France', 'India','Sri Lanka'),
                         labels = c(1, 2, 3, 4))

dataset$Item.Purchased = factor(dataset$Item.Purchased,
                           levels = c('No', 'Yes'),
                           labels = c(0, 1))

#Splitting the dataset into Training set and Test Set
install.packages('caTools')
library(caTools)
split=sample.split(dataset$Item.Purchased, SplitRatio = 0.8)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)

#Feature Scaling
training_set[,2:3]=scale(training_set[,2:3])
test_set[,2:3]=scale(test_set[,2:3])
