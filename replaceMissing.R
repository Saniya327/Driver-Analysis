train <- read.csv("~/Desktop/Project/driver-analysis/Data/actual_train.csv", header = TRUE)

# replace only those for which it makes sense
for(i in 1:ncol(train)){
	if(!(i == 14 || i == 15 || i == 16))
		train[is.na(train[, i]), i] <- mean(train[, i], na.rm = TRUE)
}

write.csv(train, "~/Desktop/Project/driver-analysis/Data/data_without_missing.csv")
