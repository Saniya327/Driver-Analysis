library(cluster)
library(fpc)
library(ggplot2)

data <- read.csv("~/Desktop/Project/driver-analysis/Data/data_without_missing.csv", header = TRUE)

set.seed(20)	# to reproduce the results
data <- na.omit(data)	# to ignore the NA values
dataCluster <- kmeans(data, 3, nstart = 20)

dataCluster
# dataCluster$centers

# Cluster Plot against 1st 2 principal components
clusplot(data, dataCluster$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)

# Centroid Plot against 1st 2 discriminant functions
plotcluster(data, dataCluster$cluster, xlab = "Time since journey start (s)", ylab = "Engine RPM (rpm)")

ggplot(data=data, aes(x=Engine.RPM.rpm., y=Speed..OBD..km.h., color=dataCluster$cluster )) + geom_point()
