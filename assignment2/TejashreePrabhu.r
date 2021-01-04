#KDD assignment 2
#Tejashree Prabhu

# clearing object environment
rm(list=ls())

# get working directory
getwd()

# set working directory
setwd('~/R')

# Load Breast cancer data file CSV
cancerData <- read.csv('C:/Users/prabh/Desktop/Stevens/fall_2020/kdd/assignment2/breast-cancer-wisconsin.data.csv',na.string="?")


# View Breast cancer data file 
View(cancerData)

# Summarizing each column
summary(cancerData)

#Identifying missing values
cancerData[(cancerData == "?")] <- NA
summary(cancerData$F6)
summary(cancerData)

#Replacing the missing values with the "mean" of the column.
for(i in 1:ncol(cancerData)){
  cancerData[is.na(cancerData[,i]), i] <- mean(cancerData[,i], na.rm = TRUE)
}


#Displaying the frequency table of "Class" vs. F6
attach(cancerData)
myTable<- table(F6,Class)
myTable

#Displaying the scatter plot of F1 to F6, one pair at a time
plot(cancerData[,2:7])

#Show histogram box plot for columns F7 to F9
par(mfrow=c(2,2))
hist(cancerData$F7)
hist(cancerData$F8)
hist(cancerData$F9)
boxplot(cancerData[8:10])

# Delete all the objects from your R- environment. Reload the "breast-cancer-wisconsin.data.csv" from canvas into R. .

rm(list = ls())

cancerData<-read.csv("C:/Users/prabh/Desktop/Stevens/fall_2020/kdd/assignment2/breast-cancer-wisconsin.data.csv",header = TRUE,na.strings=c("?"))

cancerData
#Remove any row with a missing value in any of the columns
cs <- na.omit(cancerData)
cs

summary(cs)
