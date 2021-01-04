###############################################
#Name:Tejashree Prabhu
#CWID: 10450404
#Problem: Question 5 CART

###############################################
rm(list=ls())
library(rpart)
library(rpart.plot)  		
Adult<-read.csv("C:/Users/prabh/Desktop/Stevens/fall_2020/kdd/midterm/adult_income_Dtree_v2.csv",na.strings = ' ?')#Change the path accordingly.
View(Adult)
#a)Select every fourth record, starting with the first record, as the test dataset and the remaining records as the training dataset
index<-seq(1,nrow(Adult),by=4)
test<-Adult[index,]
training<-Adult[-index,]
#b)Perform CART analysis 
model<-rpart(Income~.,training)
rpart.plot(model)
#Prediction using test 
prediction<-predict(model,test,type="class")
#c)Score the test dataset
conf_matrix<-table(test$Income,prediction)
conf_matrix
str(prediction)
#d)Measure the error rate.  
wrong<-sum(test$Income!=prediction)
error_rate<-wrong/length(test$Income)
error_rate

