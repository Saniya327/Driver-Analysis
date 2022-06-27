# read each csv file

file1 <- read.csv("~/Desktop/Project/driver-analysis/Data/Dzire.csv", header = TRUE)
file2 <- read.csv("~/Desktop/Project/driver-analysis/Data/Honda_City.csv", header = TRUE)
file3 <- read.csv("~/Desktop/Project/driver-analysis/Data/Nice_i10.csv", header = TRUE)
file4 <- read.csv("~/Desktop/Project/driver-analysis/Data/Polo.csv", header = TRUE)
file5 <- read.csv("~/Desktop/Project/driver-analysis/Data/Red_i10.csv", header = TRUE)
file6 <- read.csv("~/Desktop/Project/driver-analysis/Data/Swift.csv", header = TRUE)

# dim(file1)
# dim(file2)
# dim(file3)
# dim(file4)
# dim(file5)
# din(file6)

# temp <- head(file5, 300)
# combine the files 2 at a time
combinedData1 <- rbind(file1, file2)
combinedData2 <- rbind(combinedData1, file3)
combinedData3 <- rbind(combinedData2, file4)
combinedData4 <- rbind(combinedData3, file5)
combinedData5 <- rbind(combinedData4, file6)

# dim(combinedData5)

# create new csv with the combined data
write.csv(combinedData5, "~/Desktop/Project/driver-analysis/Data/Combined.csv")