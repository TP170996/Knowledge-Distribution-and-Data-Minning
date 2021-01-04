###############################################
#Name:Tejashree Prabhu
#CWID: 10450404
#Problem: final question 2
###############################################

rm(list=ls())
library(neuralnet)


dataSet<-read.csv("C:/Users/prabh/Desktop/Stevens/fall_2020/kdd/final/AdmissionB.csv",na.strings = '?')




### remove all the records with missing value

?na.omit()
dataSet2<-data.frame(lapply(na.omit(dataSet),as.numeric))



index <- seq (1,nrow(dataSet2),by=4)
test<- dataSet2[index,]
training<-dataSet2[-index,]

#install.packages("neuralnet")
library("neuralnet")
?neuralnet()
class(training$ADMIT)
net_dataSet2<- neuralnet( ADMIT~. ,training[-1], hidden=6, threshold=0.01)

#Plot the neural network
plot(net_dataSet2)

## test should have only the input colum
ann <-compute(net_dataSet2 , test[,-2])
ann$net.result 
min(ann$net.result)
max(ann$net.result)
ann_cat<-ifelse(ann$net.result <0.5,0,1)
length(ann_cat)

table(Actual=test$ADMIT,predition=ann_cat)

wrong<- (test$ADMIT!=ann_cat)
error_rate<-sum(wrong)/length(wrong)
error_rate
accuracy<-1-error_rate
accuracy


