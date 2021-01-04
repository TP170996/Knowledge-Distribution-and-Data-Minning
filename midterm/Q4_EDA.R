###############################################
#Name:Tejashree Prabhu
#CWID: 10450404
#Problem: Question 4 Exploratory Data Analysis

###############################################
install.packages("dplyr")
install.packages("plyr")
library(plyr)
library(dplyr)
rm(list=ls())
Adult<-read.csv("C:/Users/prabh/Desktop/Stevens/fall_2020/kdd/midterm/adult_income_EDA_midterm.csv",na.strings = ' ?')#Change the path accordingly.
View(Adult)
#Find maximum, minimum, median, mean and the standard deviation of the numeric features
num_cols <- select_if(Adult, is.numeric) 
summary(num_cols)
colwise(sd)(num_cols)
f=function(x){
  x[is.na(x)] =median(x, na.rm=TRUE) #convert the item with NA to median value from the column
  x #display the column
}
#Replace the missing values with median
num_cols=data.frame(apply(num_cols,2,f))
#Develop a box plot for the numeric variables 
boxplot(num_cols)

