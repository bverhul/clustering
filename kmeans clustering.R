library("kernlab")
library("AppliedPredictiveModeling")
library("caret")
# read file 
data <- read.csv("e-commerce.arff", header=FALSE, comment.char = "@")
names(data) <- c('Revenu','Achats')

set.seed(11)
m2 <- kkmeans(as.matrix(data),centers=4,kernel='polydot',degre=2)
data[,3] <- m2@.Data
names(data) <- c('Revenu','Achats','NCluster')
# add the cluster number into the dataset
data[,3] <- factor(data[,3])

trellis.par.set(theme= col.whitebg(), warn=TRUE)
transparentTheme(trans = .4)
# plot clusters
plt <- featurePlot(as.matrix(data[1:2]),data[,3],"ellipse",xlab="Classes KMeans",auto.key = list(columns = 3))
print(plt)
# box plot
plt <- featurePlot(as.matrix(data[1:2]),data[,3],"box")
print(plt)