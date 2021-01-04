###############################################
#Name:Tejashree Prabhu
#CWID: 10450404
#Problem: Question 5 Naive Bayes

###############################################
rm(list=ls())
library(e1071)
library(class)
Adult<-read.csv("C:/Users/prabh/Desktop/Stevens/fall_2020/kdd/midterm/adult_income_Bayes_V2.csv",na.strings = ' ?')#Change the path accordingly.
View(Adult)
#a)Remove any row with missing values
omit<-na.omit(Adult)
View(omit)
#b)Select every fourth record, starting with the first record, as the test dataset and the remaining records as the training dataset
index<-seq(1,nrow(omit),by=4)
test<-omit[index,]
training<-omit[-index,]
#c)Perform Naïve Bayes 
model<-naiveBayes(Income~.,training)
#Prediction using test 
prediction<-predict(model,test)
#d)Score the test dataset
conf_matrix<-table(prediction,test$Income)
conf_matrix
prop.table(table(prediction,test$Income))
#e)Measure the error rate
wrong_prediction<-sum(prediction!=test$Income)
wrong_prediction
wrong_prediction_rate<-wrong_prediction/length(prediction)
wrong_prediction_rate

