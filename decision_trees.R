# MIT License
# 
# Copyright (c) 2019 Shane Zabel 
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# 
###############################################################################

#Uncomment line below if rpart is not installed
#install.packages("rpart", dependencies=TRUE)

#Install rpart
library(rpart)

#Set output plot flag. TRUE saves plots to files. FALSE does not.
#Plots are sent to R Graphics in either case
plotflag<-TRUE

###############################################################################
# Start with data_sets1
###############################################################################

#Load training data
trainingdata=read.csv(trdata)
#Load the test data
testdata=read.csv(tedata)

#Create a model using the rpart function
K  <- rpart(trainingdata$Class ~ ., data = trainingdata, method = 'class', parms=list(split='information'),minsplit=2, minbucket=1)

#Print a summary of the model to the console
printcp(K)

#Print the decision tree to the consoles
print(K)

#Create a nice decision tree plot and print to R Graphics
par(mar=c(0.5,0.5,2,0.5))
plot(K)
title("Decision Tree - Data Sets 1")
text(K,use.n=TRUE,cex=0.8)

#Save plot to file if flagged
if(plotflag==TRUE){
	jpeg('DTree_Set1.jpg')
	par(mar=c(0.5,0.5,2,0.5))
	plot(K)
	title("Decision Tree - Data Sets 1")
	text(K,use.n=TRUE,cex=0.8)
	dev.off()
}

#Create a complexity paramater plot and print to R Grahics
par(mar=c(5,5,10,5))
plotcp(K)
title("Complexity Paramater - Decision Tree - Data Sets 1")

#Save plot to file if flagged
if(plotflag==TRUE){
	jpeg('CP_DTree_Set1.jpg')
	par(mar=c(5,5,10,5))
	plotcp(K)
	title("Complexity Paramater - Decision Tree - Data Sets 1")
	dev.off()
}

#Create a pruned tree
#K1 <- prune(K,K$cptable[which.min(K$cptable[,"xerror"]),"CP"])
K1 <- prune(K,0.013846)

#Print a summary of the model to the console
printcp(K1)

#Print the decision tree to the consoles
print(K1)

#Create a nice decision tree plot and print to R Graphics
par(mar=c(0.5,0.5,2,0.5))
plot(K1)
title("Pruned Decision Tree - Data Sets 1")
text(K1,use.n=TRUE,cex=0.8)

#Save plot to file if flagged
if(plotflag==TRUE){
	jpeg('DTree_Pruned_Set1.jpg')
	par(mar=c(0.5,0.5,2,0.5))
	plot(K1)
	title("Pruned Decision Tree - Data Sets 1")
	text(K1,use.n=TRUE,cex=0.8)
	dev.off()
}

#Create a complexity paramater plot and print to R Grahics
par(mar=c(5,5,10,5))
plotcp(K1)
title("Complexity Paramater - Pruned Decision Tree - Data Sets 1")

#Save plot to file if flagged
if(plotflag==TRUE){
	jpeg('CP_Pruned_DTree_Set1.jpg')
	par(mar=c(5,5,10,5))
	plotcp(K1)
	title("Complexity Paramater - Pruned Decision Tree - Data Sets 1")
	dev.off()
}

#Find the prediction on the test data
out <- predict(K1,newdata=testdata,type="vector")

#Calculate the accuracy
result<-testdata$Class-(out-1)
counter<-0
for(i in 1:dim(testdata)[1]){
	counter<-counter+abs(result[i])
}
accuracy<-(1-counter/dim(testdata)[1])

#Print out the accuracy
accuracy

###############################################################################
# Next use data_sets2
###############################################################################

#Load training data
trainingdata2=read.csv(trdata2)
#Load the test data
testdata2=read.csv(tedata2)

#Create a model using the rpart function
K2  <- rpart(trainingdata2$Class ~ ., data = trainingdata2, method = 'class', parms=list(split='information'),minsplit=2, minbucket=1)

#Print a summary of the model to the console
printcp(K2)

#Print the decision tree to the consoles
print(K2)

#Create a nice decision tree plot
par(mar=c(0.5,0.5,2,0.5))
plot(K2)
title("Decision Tree - Data Sets 2")
text(K2,use.n=TRUE,cex=0.8)

#Save plot to file if flagged
if(plotflag==TRUE){
	jpeg('DTree_Set2.jpg')
	par(mar=c(0.5,0.5,2,0.5))
	plot(K2)
	title("Decision Tree - Data Sets 2")
	text(K2,use.n=TRUE,cex=0.8)
	dev.off()
}

#Create a complexity paramater plot and print to R Grahics
par(mar=c(5,5,10,5))
plotcp(K2)
title("Complexity Paramater - Decision Tree - Data Sets 2")

#Save plot to file if flagged
if(plotflag==TRUE){
	jpeg('CP_DTree_Set2.jpg')
	par(mar=c(5,5,10,5))
	plotcp(K2)
	title("Complexity Paramater - Decision Tree - Data Sets 2")
	dev.off()
}

#Create a pruned tree
#K3 <- prune(K2,K2$cptable[which.min(K2$cptable[,"xerror"]),"CP"])
K3 <- prune(K2,0.013846)

#Create a nice decision tree plot
par(mar=c(0.5,0.5,2,0.5))
plot(K3)
title("Pruned Decision Tree - Data Sets 2")
text(K3,use.n=TRUE,cex=0.8)

#Save plot to file if flagged
if(plotflag==TRUE){
	jpeg('DTree_Pruned_Set2.jpg')
	par(mar=c(0.5,0.5,2,0.5))
	plot(K3)
	title("Pruned Decision Tree - Data Sets 2")
	text(K3,use.n=TRUE,cex=0.8)
	dev.off()
}

#Create a complexity paramater plot and print to R Grahics
par(mar=c(5,5,10,5))
plotcp(K3)
title("Complexity Paramater - Pruned Decision Tree - Data Sets 2")

#Save plot to file if flagged
if(plotflag==TRUE){
	jpeg('CP_Pruned_DTree_Set2.jpg')
	par(mar=c(5,5,10,5))
	plotcp(K3)
	title("Complexity Paramater - Pruned Decision Tree - Data Sets 2")
	dev.off()
}

#Find the prediction on the test data
out2 <- predict(K3,newdata=testdata2,type="vector")

#Calculate the accuracy
result2<-testdata2$Class-(out2-1)
counter2<-0
for(i in 1:dim(testdata2)[1]){
	counter2<-counter2+abs(result2[i])
}
accuracy2<-(1-counter2/dim(testdata2)[1])

#Print out the accuracy
accuracy2
