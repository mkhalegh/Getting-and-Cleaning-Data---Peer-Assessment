## 1.Merge the training and the test sets to create one data set.

## Loading and preprocessing the data

## Since the data is stored in .zip format, we first need to unzip the file while downloading. 
if(!file.exists("UCI HAR Dataset")) {
        temp <- tempfile()
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp, method="curl")
        file <- unzip(temp)
        unlink(temp)
}

## We first take a look at the files in the directory that the zip file is unzipped.
files<-list.files("UCI HAR Dataset", recursive=TRUE)

## Reading files into variables
Test  <- read.table(file.path("UCI HAR Dataset", "test" , "X_test.txt" ),header = FALSE)
Train <- read.table(file.path("UCI HAR Dataset", "train", "X_train.txt"),header = FALSE)
LabelTest  <- read.table(file.path("UCI HAR Dataset", "test" , "y_test.txt" ),header = FALSE)
LabelTrain <- read.table(file.path("UCI HAR Dataset", "train", "y_train.txt"),header = FALSE)
SubjTest  <- read.table(file.path("UCI HAR Dataset", "test" , "subject_test.txt"),header = FALSE)
SubjTrain <- read.table(file.path("UCI HAR Dataset", "train", "subject_train.txt"),header = FALSE)

## merging test and train sets for each of activity data, activity label, and subject who performed them.
library(dplyr)
Activity<-rbind(Train, Test)
## giving proper names to the columns using the features.txt file 
FeatNames <- read.table(file.path("UCI HAR Dataset", "features.txt"),head=FALSE)
names(Activity)<- FeatNames$V2

Label<-rbind(LabelTrain,LabelTest)
Label<-rename(Label, activitynum=V1)

Subject<-rbind(SubjTrain,SubjTest)
Subject<-rename(Subject, subject=V1)

## binding each of the merged test and data sets to have a meta data.
tempData<-cbind(Subject, Label)
Data<-cbind(tempData,Activity)

## 2.Extract only the measurements on the mean and standard deviation for each measurement.
SubData<-Data[,grep("mean\\(\\)|std\\(\\)",names(Data),value=TRUE)]
tData<-cbind(tempData,SubData)

## 3. Uses descriptive activity names to name the activities in the data set

## getting the descriptive activity names from activity_labels.txt file
activityLabels <- read.table(file.path("UCI HAR Dataset", "activity_labels.txt"),header = FALSE)
temp<-activityLabels$V2
temp<-as.character(temp)
## mutate() changes the name of variable to the given new label
tData<-mutate(tData,activitynum=temp[as.integer(Label$activitynum)])

## 4.Appropriately label the data set with descriptive variable names. 
names(tData)<-gsub("std()", "SD", names(tData))
names(tData)<-gsub("mean()", "MEAN", names(tData))
names(tData)<-gsub("^t", "time", names(tData))
names(tData)<-gsub("^f", "frequency", names(tData))
names(tData)<-gsub("Acc", "Accelerometer", names(tData))
names(tData)<-gsub("Gyro", "Gyroscope", names(tData))
names(tData)<-gsub("Mag", "Magnitude", names(tData))
names(tData)<-gsub("BodyBody", "Body", names(tData))

## 5. From the data set in step 4, create a second, independent tidy data set with the average of each 
## variable for each activity and each subject.

library(plyr)
Data2<-aggregate(. ~subject + activitynum, tData, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
new_colNames<-paste("ave", colnames(Data2), sep=".")
setnames(Data2, old = colnames(Data2[3:ncol(Data2)]), new = new_colNames[3:length(new_colNames)])
write.table(Data2, file = "TidyData.txt",row.name=FALSE)

