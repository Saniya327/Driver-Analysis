train <- read.csv("~/Desktop/Project/driver-analysis/Data/Combined.csv", header = TRUE)

# select the required columns for driver analysis
actual_train <- train[ , c(25, 50, 49, 47, 40, 55, 53, 44, 10, 39, 15, 58, 20, 31, 32, 16, 48, 43, 45)]

write.csv(actual_train, "~/Desktop/Project/driver-analysis/Data/actual_train.csv")
