###############################################
#Name:Tejashree Prabhu
#CWID: 10450404
#Problem: final question 1
###############################################

rm(list=ls())
dataSet<-read.csv("C:/Users/prabh/Desktop/Stevens/fall_2020/kdd/final/AdmissionB.csv",na.strings = '?')#Change the path accordingly.
View(dataSet)
summary(dataSet)
table(dataSet$ADMIT)
#To factor the data set
dataSet<-na.omit(dataSet)
dataSet<-dataSet[-1]
dataSet_dist<-dist(dataSet[,-1])
hclust_results<-hclust(dataSet_dist)
plot(hclust_results)
hclust_2<-cutree(hclust_results,2)
table(hclust_2,dataSet[,1])


rm(list=ls())
dataSet<-read.csv("C:/Users/prabh/Desktop/Stevens/fall_2020/kdd/final/AdmissionB.csv",na.strings = '?')#Change the path accordingly.
View(dataSet)
summary(dataSet)
table(dataSet$ADMIT)
#To factor the data set
dataSet<-na.omit(dataSet)
dataSet<-dataSet[-1]
kmeans_2<- kmeans(dataSet[,-1],2,nstart = 10)
kmeans_2$cluster
table(kmeans_2$cluster,dataSet[,1])
