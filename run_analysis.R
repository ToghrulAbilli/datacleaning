rm(list=ls())
setwd("C:/Users/tabilli/Desktop/Projects/Rproject/EDA/edaproject")

url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(url,"dataset.zip")
unzip("dataset.zip")

X_train<-read.table("UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
X_test<-read.table("UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
Subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
Subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
features<-read.table("UCI HAR Dataset/features.txt")
activities<-read.table("UCI HAR Dataset/activity_labels.txt")

names(features)<-make.names(c("n","functions"))
names(activities)<-make.names(c("code","activity"))
names(X_train)<-make.names(features$functions)
names(X_test)<-make.names(features$functions)
names(y_test)<-make.names("code")
names(y_train)<-make.names("code")
names(Subject_train)<-make.names("subject")
names(Subject_test)<-make.names("subject")


X<-rbind(X_train,X_test)
Y<-rbind(y_train,y_test)

Subject<-rbind(Subject_train,Subject_test)

fulldt<-cbind(Subject, Y,X)

cleandata<- select(fulldt,subject,code,contains("mean"),contains("std"))

#-----------------------------
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","features"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)
TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))
