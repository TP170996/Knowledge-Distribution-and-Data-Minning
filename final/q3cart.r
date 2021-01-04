###############################################
#Name: Tejashree Prabhu
#CWID: 10450404
#purpose: final exam question 3
###############################################
rm(list=ls())
#loading 
dataSet <-  read.csv('C:/Users/prabh/Desktop/Stevens/fall_2020/kdd/final/Admission_catB.csv',
                na.strings = "?",
                colClasses=c("Applicant"="character",
                             "ADMIT"="factor","RANK"="factor","GPA"="factor",
                             "GRE"="factor"))







#install.packages("rpart")
#install.packages("rpart.plot")     # Enhanced tree plots
#install.packages("rattle")         # Fancy tree plot
#install.packages("RColorBrewer")   # colors needed for rattle
library(rpart)
library(rpart.plot)  			# Enhanced tree plots
library(rattle)           # Fancy tree plot
library(RColorBrewer)     # colors needed for rattle

#dsn2<-data.frame(lapply(dsn[,-1],as.factor))


index <- seq (1,nrow(dataSet),by=4)
test<- dataSet[index,]
training<-dataSet[-index,]

?rpart()
#Grow the tree 


CART_class<-rpart( ADMIT~.,data=training[,-1])
rpart.plot(CART_class)
CART_predict2<-predict(CART_class,test, type="class")
df<-as.data.frame(cbind(test,CART_predict2))
table(Actual=test[,"ADMIT"],CART=CART_predict2)

CART_wrong<-sum(test[,"ADMIT"]!=CART_predict2)

error_rate=CART_wrong/length(test$ADMIT)
error_rate

accuracy<-1-error_rate
accuracy

library(rpart.plot)
prp(CART_class)


# much fancier graph
fancyRpartPlot(CART_class)


dev.off()






