###############################################
#Name: Tejashree Prabhu
#CWID: 10450404
###############################################
rm(list=ls())
library(C50)
dataSet<-read.csv("C:/Users/prabh/Desktop/Stevens/fall_2020/kdd/final/Admission_catB.csv",na.strings = '?')#Change the path accordingly.
View(dataSet)
table(dataSet$ADMIT)
#To factor the data set
dataSet$ADMIT <- factor(dataSet$ADMIT, levels = c(0,1),labels = c("Not admitted", "admitted"))
# To split the data set into test and testing 
index<-sort(sample(nrow(dataSet ),round(.25*nrow( dataSet))))
training<- dataSet[-index,]
test<- dataSet[index,]

index <- seq (1,nrow(dataSet),by=4)
test<- dataSet[index,]
training<-dataSet[-index,]

#Implement C 5.0
model<-C5.0(ADMIT~.,training[,-1])
summary(model)
plot(model)
#Prediction using test 
prediction<-predict(model,test[,-1],type="class") 
#Forming the confusin matrix
conf_matrix<-table(test[,2],prediction)
conf_matrix
str(prediction)
#Showing the error rate 
wrong<-sum(test[,2]!=prediction)
error_rate<-wrong/length(test[,2])
error_rate

