README
========================================================

## 1.Merge the training and the test sets to create one data set.
 
### Loading and preprocessing the data

Since the data is stored in .zip format, we first need to unzip the file while downloading. Then we can read the csv file.


```r
if(!file.exists("UCI HAR Dataset")) {
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp, method="curl")
file <- unzip(temp)
unlink(temp)
}
```


Now, the data is in a format that can be run. We first take a look at the files in the directory that the zip file is unzipped.


```r
files<-list.files("UCI HAR Dataset", recursive=TRUE)
```

### Reading files into variables

Using the `read.table()` function, I read all of the test and training files and store them into variables with proper names.


```r
Test  <- read.table(file.path("UCI HAR Dataset", "test" , "X_test.txt" ),header = FALSE)
Train <- read.table(file.path("UCI HAR Dataset", "train", "X_train.txt"),header = FALSE)
LabelTest  <- read.table(file.path("UCI HAR Dataset", "test" , "y_test.txt" ),header = FALSE)
LabelTrain <- read.table(file.path("UCI HAR Dataset", "train", "y_train.txt"),header = FALSE)
SubjTest  <- read.table(file.path("UCI HAR Dataset", "test" , "subject_test.txt"),header = FALSE)
SubjTrain <- read.table(file.path("UCI HAR Dataset", "train", "subject_train.txt"),header = FALSE)
```
Now, we would like to merge the data of each test and train variables, into a data frame. We do that using `rbind()` function. To give names to each column, the feature.txt file is used.
At the end, I used `cbind()` function, to join the test and train sets of all three main variables, activity features, activity label, and subject who performed the activity.

```r
library(dplyr)
FeatNames <- read.table(file.path("UCI HAR Dataset", "features.txt"),head=FALSE)

Activity<-rbind(Train, Test)
names(Activity)<- FeatNames$V2

Label<-rbind(LabelTrain,LabelTest)
Label<-rename(Label, activitynum=V1)

Subject<-rbind(SubjTrain,SubjTest)
Subject<-rename(Subject, subject=V1)

tempData<-cbind(Subject, Label)
Data<-cbind(tempData,Activity)
```
## 2.Extract only the measurements on the mean and standard deviation for each measurement. 

In order to do that, we need to identify the "mean()" and "std()" variables in our dataset. The names that contain these two variables will be selected and extracted. Then again, we `cbind` the subset of the data to the `Subject` and `Label` variables for future use.


```r
names(Data)
SubData<-Data[,grep("mean\\(\\)|std\\(\\)",names(Data),value=TRUE)]
tData<-cbind(tempData,SubData)
```

## 3. Uses descriptive activity names to name the activities in the data set
From the activity_labels.txt file, we have the list of activity labels. First, we read the file and store it in a new variable, `activityLabels`. Then, using `mutate()` function, I changed the activity number to label of the corresponding activity.


```r
activityLabels <- read.table(file.path("UCI HAR Dataset", "activity_labels.txt"),header = FALSE)
temp<-activityLabels$V2
temp<-as.character(temp)
tData<-mutate(tData,activitynum=temp[as.integer(Label$activitynum)])
```

## 4.Appropriately label the data set with descriptive variable names. 

Having a list of descriptive variables, and their coresponding abbreviations, I use the `gsub()` function that finds patterns of abreviations and replaces them by our appropriate substitute in the whole dataset.


```r
names(tData)<-gsub("std()", "SD", names(tData))
names(tData)<-gsub("mean()", "MEAN", names(tData))
names(tData)<-gsub("^t", "time", names(tData))
names(tData)<-gsub("^f", "frequency", names(tData))
names(tData)<-gsub("Acc", "Accelerometer", names(tData))
names(tData)<-gsub("Gyro", "Gyroscope", names(tData))
names(tData)<-gsub("Mag", "Magnitude", names(tData))
names(tData)<-gsub("BodyBody", "Body", names(tData))
```

## 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

First we aggregate the data over the mean of each variable for both `activitynum` and `subject`, and order the data for cleaning. Then using `paste()` function, I added a prefix pf ave. to all the variables, to make the column names more descriptive.

Finally, the `write.table()` function is used to export our new dataset as a text file. We choose the `row.names` to be FALSE as suggested.


```r
library(plyr)
Data2<-aggregate(. ~subject + activitynum, tData, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
new_colNames<-paste("ave", colnames(Data2), sep=".")
setnames(Data2, old = colnames(Data2[3:ncol(Data2)]), new = new_colNames[3:length(new_colNames)])
write.table(Data2, file = "TidyData.txt",row.name=FALSE)
```
