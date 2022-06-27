library(randomForest)
library(caret)

data <- read.csv("~/Desktop/Project/driver-analysis/Data/data_without_missing2.csv", header = TRUE)
# Percentage of safe and average drivers
table(data$Driver.Type) / nrow(data)

# split the data into train and test sets (60/40)
split <- sample(2, nrow(data), replace = TRUE, prob = c(0.6, 0.4))
train <- data[split == 1, ]
test <- data[split == 2, ]

colNames <- names(train)
# Exclude the target variable
colNames <- colNames[!colNames %in% c("Driver.Type")]

# add + sign between exploratory variables, 
# i.e, the variables considered to build the forest
colNames1 <- paste(colNames, collapse = "+")

# Add the excluded target variable and convert it to a formula object
rfFormula <- as.formula(paste("Driver.Type", colNames1, sep = " ~ "))

# Random forest needs a formila to build the decision trees
# Call the randomForest function using the above formula
rfModel <- randomForest(rfFormula, na.omit(train), ntree = 500, importance = TRUE)
# plot error rate across decision trees
plot(rfModel)
# Variable Importance Plot
# Top 5 variables are selected and plotted based on the model accuracy
# and gini value
varImpPlot(rfModel, sort = TRUE, main = "Variable Importance", n.var = 5)

# Variable Importance Table
# displays all the variables in decreasing order of gini
varImp <- data.frame(importance(rfModel, type = 2))
varImp$Variables <- row.names(varImp)
varImp[order(varImp$MeanDecreaseGini, decreasing = TRUE), ]

# predicting values using the model
test$predicted.response <- predict(rfModel, test)

confusionMatrix(data = test$predicted.response, reference = test$Driver.Type)
