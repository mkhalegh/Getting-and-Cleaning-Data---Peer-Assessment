Code Book
========================
 
## Project Description
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

For this project, we should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
## Study design and data processing
he features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix ‘t’ to denote time) were captured at a constant rate of 50 Hz. and the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) – both using a low pass Butterworth filter.

The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

A Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the ‘f’ to indicate frequency domain signals).
 
### Collection of the raw data


A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
 
### Notes on the original (raw) data 
Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (`WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING`) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.

- Triaxial Angular velocity from the gyroscope. 

- A 561-feature vector with time and frequency domain variables. 

- Its activity label. 

- An identifier of the subject who carried out the experiment.

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws
 
## Creating the tidy datafile

### Guide to create the tidy data file

Following steps are required:

1. Downloading data and unzip.

2. Merging Train and Test sets for eahc of the subject, activity label, and the data.

3. Naming columns accordingly (the data set's columns get names from features.txt).


### Cleaning the data
Extracting only the columns that include mean and standard deviation and naming activity labels based on descriptive activity names given in `activity_labels.txt`. Next, we label the dataset with descriptive variable names (the abreviations are described).List of the abreviations that are tackled are given here:

1. leading t or f is based on time or frequency measurements.

2. Body = related to body movement.

3. Gravity = acceleration of gravity

4. Acc = accelerometer measurement

5. Gyro = gyroscopic measurements

6. Jerk = sudden movement acceleration

7. Mag = magnitude of movement

8. mean and SD are calculated for each subject for each activity for each mean and SD measurements.

At the end, we create a second, independent tidy data set with the average of each variable for each activity and each subject. To distinguish the averaged values from the original data, I add an ave. prefix to all the column names as a **final touch** of cleaning.


 

## Description of the variables in the TidyData.txt file
The tidy data set that we created includes the following variables:


```
## 'data.frame':	180 obs. of  68 variables:
##  $ subject                                           : int  1 1 1 1 1 1 2 2 2 2 ...
##  $ activitynum                                       : Factor w/ 6 levels "LAYING","SITTING",..: 1 2 3 4 5 6 1 2 3 4 ...
##  $ ave.timeBodyAccelerometer.MEAN...X                : num  0.222 0.261 0.279 0.277 0.289 ...
##  $ ave.timeBodyAccelerometer.MEAN...Y                : num  -0.04051 -0.00131 -0.01614 -0.01738 -0.00992 ...
##  $ ave.timeBodyAccelerometer.MEAN...Z                : num  -0.113 -0.105 -0.111 -0.111 -0.108 ...
##  $ ave.timeBodyAccelerometer.SD...X                  : num  -0.928 -0.977 -0.996 -0.284 0.03 ...
##  $ ave.timeBodyAccelerometer.SD...Y                  : num  -0.8368 -0.9226 -0.9732 0.1145 -0.0319 ...
##  $ ave.timeBodyAccelerometer.SD...Z                  : num  -0.826 -0.94 -0.98 -0.26 -0.23 ...
##  $ ave.timeGravityAccelerometer.MEAN...X             : num  -0.249 0.832 0.943 0.935 0.932 ...
##  $ ave.timeGravityAccelerometer.MEAN...Y             : num  0.706 0.204 -0.273 -0.282 -0.267 ...
##  $ ave.timeGravityAccelerometer.MEAN...Z             : num  0.4458 0.332 0.0135 -0.0681 -0.0621 ...
##  $ ave.timeGravityAccelerometer.SD...X               : num  -0.897 -0.968 -0.994 -0.977 -0.951 ...
##  $ ave.timeGravityAccelerometer.SD...Y               : num  -0.908 -0.936 -0.981 -0.971 -0.937 ...
##  $ ave.timeGravityAccelerometer.SD...Z               : num  -0.852 -0.949 -0.976 -0.948 -0.896 ...
##  $ ave.timeBodyAccelerometerJerk.MEAN...X            : num  0.0811 0.0775 0.0754 0.074 0.0542 ...
##  $ ave.timeBodyAccelerometerJerk.MEAN...Y            : num  0.003838 -0.000619 0.007976 0.028272 0.02965 ...
##  $ ave.timeBodyAccelerometerJerk.MEAN...Z            : num  0.01083 -0.00337 -0.00369 -0.00417 -0.01097 ...
##  $ ave.timeBodyAccelerometerJerk.SD...X              : num  -0.9585 -0.9864 -0.9946 -0.1136 -0.0123 ...
##  $ ave.timeBodyAccelerometerJerk.SD...Y              : num  -0.924 -0.981 -0.986 0.067 -0.102 ...
##  $ ave.timeBodyAccelerometerJerk.SD...Z              : num  -0.955 -0.988 -0.992 -0.503 -0.346 ...
##  $ ave.timeBodyGyroscope.MEAN...X                    : num  -0.0166 -0.0454 -0.024 -0.0418 -0.0351 ...
##  $ ave.timeBodyGyroscope.MEAN...Y                    : num  -0.0645 -0.0919 -0.0594 -0.0695 -0.0909 ...
##  $ ave.timeBodyGyroscope.MEAN...Z                    : num  0.1487 0.0629 0.0748 0.0849 0.0901 ...
##  $ ave.timeBodyGyroscope.SD...X                      : num  -0.874 -0.977 -0.987 -0.474 -0.458 ...
##  $ ave.timeBodyGyroscope.SD...Y                      : num  -0.9511 -0.9665 -0.9877 -0.0546 -0.1263 ...
##  $ ave.timeBodyGyroscope.SD...Z                      : num  -0.908 -0.941 -0.981 -0.344 -0.125 ...
##  $ ave.timeBodyGyroscopeJerk.MEAN...X                : num  -0.1073 -0.0937 -0.0996 -0.09 -0.074 ...
##  $ ave.timeBodyGyroscopeJerk.MEAN...Y                : num  -0.0415 -0.0402 -0.0441 -0.0398 -0.044 ...
##  $ ave.timeBodyGyroscopeJerk.MEAN...Z                : num  -0.0741 -0.0467 -0.049 -0.0461 -0.027 ...
##  $ ave.timeBodyGyroscopeJerk.SD...X                  : num  -0.919 -0.992 -0.993 -0.207 -0.487 ...
##  $ ave.timeBodyGyroscopeJerk.SD...Y                  : num  -0.968 -0.99 -0.995 -0.304 -0.239 ...
##  $ ave.timeBodyGyroscopeJerk.SD...Z                  : num  -0.958 -0.988 -0.992 -0.404 -0.269 ...
##  $ ave.timeBodyAccelerometerMagnitude.MEAN..         : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
##  $ ave.timeBodyAccelerometerMagnitude.SD..           : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
##  $ ave.timeGravityAccelerometerMagnitude.MEAN..      : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
##  $ ave.timeGravityAccelerometerMagnitude.SD..        : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
##  $ ave.timeBodyAccelerometerJerkMagnitude.MEAN..     : num  -0.9544 -0.9874 -0.9924 -0.1414 -0.0894 ...
##  $ ave.timeBodyAccelerometerJerkMagnitude.SD..       : num  -0.9282 -0.9841 -0.9931 -0.0745 -0.0258 ...
##  $ ave.timeBodyGyroscopeMagnitude.MEAN..             : num  -0.8748 -0.9309 -0.9765 -0.161 -0.0757 ...
##  $ ave.timeBodyGyroscopeMagnitude.SD..               : num  -0.819 -0.935 -0.979 -0.187 -0.226 ...
##  $ ave.timeBodyGyroscopeJerkMagnitude.MEAN..         : num  -0.963 -0.992 -0.995 -0.299 -0.295 ...
##  $ ave.timeBodyGyroscopeJerkMagnitude.SD..           : num  -0.936 -0.988 -0.995 -0.325 -0.307 ...
##  $ ave.frequencyBodyAccelerometer.MEAN...X           : num  -0.9391 -0.9796 -0.9952 -0.2028 0.0382 ...
##  $ ave.frequencyBodyAccelerometer.MEAN...Y           : num  -0.86707 -0.94408 -0.97707 0.08971 0.00155 ...
##  $ ave.frequencyBodyAccelerometer.MEAN...Z           : num  -0.883 -0.959 -0.985 -0.332 -0.226 ...
##  $ ave.frequencyBodyAccelerometer.SD...X             : num  -0.9244 -0.9764 -0.996 -0.3191 0.0243 ...
##  $ ave.frequencyBodyAccelerometer.SD...Y             : num  -0.834 -0.917 -0.972 0.056 -0.113 ...
##  $ ave.frequencyBodyAccelerometer.SD...Z             : num  -0.813 -0.934 -0.978 -0.28 -0.298 ...
##  $ ave.frequencyBodyAccelerometerJerk.MEAN...X       : num  -0.9571 -0.9866 -0.9946 -0.1705 -0.0277 ...
##  $ ave.frequencyBodyAccelerometerJerk.MEAN...Y       : num  -0.9225 -0.9816 -0.9854 -0.0352 -0.1287 ...
##  $ ave.frequencyBodyAccelerometerJerk.MEAN...Z       : num  -0.948 -0.986 -0.991 -0.469 -0.288 ...
##  $ ave.frequencyBodyAccelerometerJerk.SD...X         : num  -0.9642 -0.9875 -0.9951 -0.1336 -0.0863 ...
##  $ ave.frequencyBodyAccelerometerJerk.SD...Y         : num  -0.932 -0.983 -0.987 0.107 -0.135 ...
##  $ ave.frequencyBodyAccelerometerJerk.SD...Z         : num  -0.961 -0.988 -0.992 -0.535 -0.402 ...
##  $ ave.frequencyBodyGyroscope.MEAN...X               : num  -0.85 -0.976 -0.986 -0.339 -0.352 ...
##  $ ave.frequencyBodyGyroscope.MEAN...Y               : num  -0.9522 -0.9758 -0.989 -0.1031 -0.0557 ...
##  $ ave.frequencyBodyGyroscope.MEAN...Z               : num  -0.9093 -0.9513 -0.9808 -0.2559 -0.0319 ...
##  $ ave.frequencyBodyGyroscope.SD...X                 : num  -0.882 -0.978 -0.987 -0.517 -0.495 ...
##  $ ave.frequencyBodyGyroscope.SD...Y                 : num  -0.9512 -0.9623 -0.9871 -0.0335 -0.1814 ...
##  $ ave.frequencyBodyGyroscope.SD...Z                 : num  -0.917 -0.944 -0.982 -0.437 -0.238 ...
##  $ ave.frequencyBodyAccelerometerMagnitude.MEAN..    : num  -0.8618 -0.9478 -0.9854 -0.1286 0.0966 ...
##  $ ave.frequencyBodyAccelerometerMagnitude.SD..      : num  -0.798 -0.928 -0.982 -0.398 -0.187 ...
##  $ ave.frequencyBodyAccelerometerJerkMagnitude.MEAN..: num  -0.9333 -0.9853 -0.9925 -0.0571 0.0262 ...
##  $ ave.frequencyBodyAccelerometerJerkMagnitude.SD..  : num  -0.922 -0.982 -0.993 -0.103 -0.104 ...
##  $ ave.frequencyBodyGyroscopeMagnitude.MEAN..        : num  -0.862 -0.958 -0.985 -0.199 -0.186 ...
##  $ ave.frequencyBodyGyroscopeMagnitude.SD..          : num  -0.824 -0.932 -0.978 -0.321 -0.398 ...
##  $ ave.frequencyBodyGyroscopeJerkMagnitude.MEAN..    : num  -0.942 -0.99 -0.995 -0.319 -0.282 ...
##  $ ave.frequencyBodyGyroscopeJerkMagnitude.SD..      : num  -0.933 -0.987 -0.995 -0.382 -0.392 ...
```

### Variable 1 (subject) 
This variable indicates the volunteer index. stored in int class.

### Variable 2 (activitynum)
This stores the type of activity taken, from 1 `WALKING` 2 `WALKING_UPSTAIRS` 3 `WALKING_DOWNSTAIRS` 4 `SITTING` 5 `STANDING` 6 `LAYING`
 
From Variable 3 on, a full description of the variable and a statistical summary of ebservations is given here:
### Variable 3 
### mean acceleration of the body in x-axis 

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##  0.2216  0.2712  0.2770  0.2743  0.2800  0.3015
```

### Variable 4
### mean acceleration of the body in y-axis 

```
##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
## -0.040510 -0.020020 -0.017260 -0.017880 -0.014940 -0.001308
```

### Variable 5 
### mean acceleration of the body in z-axis 

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.15250 -0.11210 -0.10820 -0.10920 -0.10440 -0.07538
```

### Variable 6 
### std deviation of acceleration of the body in x-axis

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9961 -0.9799 -0.7526 -0.5577 -0.1984  0.6269
```

### Variable 7 
### std deviation of acceleration of the body in y-axis

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.99020 -0.94210 -0.50900 -0.46050 -0.03077  0.61690
```

### Variable 8 
### std deviation of acceleration of the body in z-axis 

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9877 -0.9498 -0.6518 -0.5756 -0.2306  0.6090
```

### Variable 9 
### mean acceleration of gravity in x-axis

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.6800  0.8376  0.9208  0.6975  0.9425  0.9745
```

### Variable 10 
### mean acceleration of gravity in y-axis

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.47990 -0.23320 -0.12780 -0.01621  0.08773  0.95660
```

### Variable 11 
### mean acceleration of gravity in z-axis

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.49510 -0.11730  0.02384  0.07413  0.14950  0.95790
```

### Variable 12 
### std deviation of acceleration of gravity in x-axis

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9968 -0.9825 -0.9695 -0.9638 -0.9509 -0.8296
```

### Variable 13 
### std deviation of acceleration of gravity in y-axis 

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9942 -0.9711 -0.9590 -0.9524 -0.9370 -0.6436
```

### Variable 14 
### std deviation of acceleration of gravity in z-axis 

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9910 -0.9605 -0.9450 -0.9364 -0.9180 -0.6102
```

### Variable 15 
### mean acceleration during jerk signals of the body in x-axis  

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## 0.04269 0.07396 0.07640 0.07947 0.08330 0.13020
```

### Variable 16 
### mean acceleration during jerk signals of the body in y-axis   

```
##       Min.    1st Qu.     Median       Mean    3rd Qu.       Max. 
## -0.0386900  0.0004664  0.0094700  0.0075650  0.0134000  0.0568200
```

### Variable 17 
### mean acceleration during jerk signals of the body in z-axis  

```
##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
## -0.067460 -0.010600 -0.003861 -0.004953  0.001958  0.038050
```

### Variable 18 
### std deviation of acceleration during jerk signals of body in x-axis  

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9946 -0.9832 -0.8104 -0.5949 -0.2233  0.5443
```

### Variable 19 
### std deviation of acceleration during jerk signals of body in y-axis   

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9895 -0.9724 -0.7756 -0.5654 -0.1483  0.3553
```

### Variable 20 
### std deviation of acceleration during jerk signals of body in z-axis    

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.99330 -0.98270 -0.88370 -0.73600 -0.51210  0.03102
```

### Variable 21 
### mean angular velocity of the body in x-axis      

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.20580 -0.04712 -0.02871 -0.03244 -0.01676  0.19270
```

### Variable 22 
### mean angular velocity of the body in y-axis       

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.20420 -0.08955 -0.07318 -0.07426 -0.06113  0.02747
```

### Variable 23 
### mean angular velocity of the body in z-axis     

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.07245  0.07475  0.08512  0.08744  0.10180  0.17910
```

### Variable 24 
### std deviation of angular velocity of the body in x-axis     

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9943 -0.9735 -0.7890 -0.6916 -0.4414  0.2677
```

### Variable 25 
### std deviation of angular velocity of the body in y-axis     

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9942 -0.9629 -0.8017 -0.6533 -0.4196  0.4765
```

### Variable 26 
### std deviation of angular velocity of the body in z-axis    

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9855 -0.9609 -0.8010 -0.6164 -0.3106  0.5649
```

### Variable 27 
### mean angular velocity during jerk signals of the body in x-axis    

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.15720 -0.10320 -0.09868 -0.09606 -0.09110 -0.02209
```

### Variable 28 
### mean angular velocity during jerk signals of the body in y-axis     

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.07681 -0.04552 -0.04112 -0.04269 -0.03842 -0.01320
```

### Variable 29 
### mean angular velocity during jerk signals of the body in z-axis     

```
##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
## -0.092500 -0.061720 -0.053430 -0.054800 -0.048980 -0.006941
```

### Variable 30 
### std deviation of angular velocity during jerk signals of body in x-axis     

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9965 -0.9800 -0.8396 -0.7036 -0.4629  0.1791
```

### Variable 31 
### std deviation of angular velocity during jerk signals of body in y-axis     

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9971 -0.9832 -0.8942 -0.7636 -0.5861  0.2959
```

### Variable 32 
### std deviation of angular velocity during jerk signals of body in z-axis    

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9954 -0.9848 -0.8610 -0.7096 -0.4741  0.1932
```

### Variable 33 
### mean magnitude of the acceleration of the body   

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9865 -0.9573 -0.4829 -0.4973 -0.0919  0.6446
```

### Variable 34 
### std deviation of the magnitude of the acceleration of the body

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9865 -0.9430 -0.6074 -0.5439 -0.2090  0.4284
```

### Variable 35 
### mean magnitude of the acceleration of gravity

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9865 -0.9573 -0.4829 -0.4973 -0.0919  0.6446
```

### Variable 36 
### std deviation of the magnitude of the acceleration of gravity

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9865 -0.9430 -0.6074 -0.5439 -0.2090  0.4284
```

### Variable 37 
### mean magnitude of the acceleration of the body during jerk signals

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9928 -0.9807 -0.8168 -0.6079 -0.2456  0.4345
```

### Variable 38 
### std deviation of the magnitude of the acceleration of the body during jerk signals

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9946 -0.9765 -0.8014 -0.5842 -0.2173  0.4506
```

### Variable 39 
### mean magnitude of the angular velocity of the body

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9807 -0.9461 -0.6551 -0.5652 -0.2159  0.4180
```

### Variable 40 
### std deviation of the magnitude of the angular velocity of the body

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9814 -0.9476 -0.7420 -0.6304 -0.3602  0.3000
```

### Variable 41 
### mean magnitude of the angular velocity of the body during jerk signals

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.99730 -0.98520 -0.86480 -0.73640 -0.51190  0.08758
```

### Variable 42 
### std deviation of the magnitude of the angular velocity of the body during jerk signals

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9977 -0.9805 -0.8809 -0.7550 -0.5767  0.2502
```

### Variable 43 
### mean frequency domain signals of the acceleration of the body in x-axis

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9952 -0.9787 -0.7691 -0.5758 -0.2174  0.5370
```

### Variable 44 
### mean frequency domain signals of acceleration of the body in y-axis

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.98900 -0.95360 -0.59500 -0.48870 -0.06341  0.52420
```

### Variable 45 
### mean frequency domain signals acceleration of the body in z-axis

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9895 -0.9619 -0.7236 -0.6297 -0.3183  0.2807
```

### Variable 46 
### std deviation of the frequency domain signals of acceleration of the body in x-axis  

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9966 -0.9820 -0.7470 -0.5522 -0.1966  0.6585
```

### Variable 47 
### std deviation of the frequency domain signals of acceleration of the body in y-axis  

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.99070 -0.94040 -0.51340 -0.48150 -0.07913  0.56020
```

### Variable 48 
### std deviation of the frequency domain signals of acceleration of the body in z-axis  

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9872 -0.9459 -0.6441 -0.5824 -0.2655  0.6871
```

### Variable 49 
### mean frequency domain signals during jerk signals for the acceleration of the body in x-axis   

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9946 -0.9828 -0.8126 -0.6139 -0.2820  0.4743
```

### Variable 50 
### mean frequency domain signals during jerk signals for the acceleration of the body in y-axis    

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9894 -0.9725 -0.7817 -0.5882 -0.1963  0.2767
```

### Variable 51 
### mean frequency domain signals during jerk signals for the acceleration of the body in z-axis     

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9920 -0.9796 -0.8707 -0.7144 -0.4697  0.1578
```

### Variable 52 
### std deviation of the frequency domain signals during jerk signals for the acceleration of the body in x-axis     

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9951 -0.9847 -0.8254 -0.6121 -0.2475  0.4768
```

### Variable 53 
### std deviation of the frequency domain signals during jerk signals for the acceleration of the body in y-axis      

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9905 -0.9737 -0.7852 -0.5707 -0.1685  0.3498
```

### Variable 54 
### std deviation of the frequency domain signals during jerk signals for the acceleration of the body in z-axis     

```
##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
## -0.993100 -0.983700 -0.895100 -0.756500 -0.543800 -0.006236
```

### Variable 55 
### mean frequency domain signals of the angular velocity of the body in x-axis     

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9931 -0.9697 -0.7300 -0.6367 -0.3387  0.4750
```

### Variable 56 
### mean frequency domain signals of angular velocity of the body in y-axis     

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9940 -0.9700 -0.8141 -0.6767 -0.4458  0.3288
```

### Variable 57 
### mean frequency domain signals angular velocity of the body in z-axis    

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9860 -0.9624 -0.7909 -0.6044 -0.2635  0.4924
```

### Variable 58 
### std deviation of the frequency domain signals of angular velocity of the body in x-axis    

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9947 -0.9750 -0.8086 -0.7110 -0.4813  0.1966
```

### Variable 59 
### std deviation of the frequency domain signals of angular velocity of the body in y-axis    

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9944 -0.9602 -0.7964 -0.6454 -0.4154  0.6462
```

### Variable 60 
### std deviation of the frequency domain signals of angular velocity of the body in z-axis    

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9867 -0.9643 -0.8224 -0.6577 -0.3916  0.5225
```

### Variable 61 
### mean magnitude of the frequency domain signals of the acceleration of the body  

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9868 -0.9560 -0.6703 -0.5365 -0.1622  0.5866
```

### Variable 62 
### std deviation of the frequency domain signals of the magnitude of the acceleration of the body 

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9876 -0.9452 -0.6513 -0.6210 -0.3654  0.1787
```

### Variable 63 
### mean magnitude of the frequency domain signals of the maganitude of acceleration of the body during jerk signals 

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9940 -0.9770 -0.7940 -0.5756 -0.1872  0.5384
```

### Variable 64 
### std deviation of the frequency domain signals of the magnitude of the acceleration of the body during jerk signals 

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9944 -0.9752 -0.8126 -0.5992 -0.2668  0.3163
```

### Variable 65 
### mean magnitude of the frequency domain signals of the angular velocity of the body 

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9865 -0.9616 -0.7657 -0.6671 -0.4087  0.2040
```

### Variable 66 
### std deviation of the frequency domain signals of the magnitude of the angular velocity of the body 

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9815 -0.9488 -0.7727 -0.6723 -0.4277  0.2367
```

### Variable 67 
### mean magnitude of the frequency domain signals of the angular velocity of the body during jerk signals 

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9976 -0.9813 -0.8779 -0.7564 -0.5831  0.1466
```

### Variable 68 
### std deviation of the frequency domain signals of the magnitude of the angular velocity of the body during jerk signals


```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.9976 -0.9802 -0.8941 -0.7715 -0.6081  0.2878
```
## Annex
The code that used to read and store the data for this code book is given here:


```r
if(!file.exists("UCI HAR Dataset")) {
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp, method="curl")
file <- unzip(temp)
unlink(temp)
```

The codes to tidy-up the data: 

```r
Test  <- read.table(file.path("UCI HAR Dataset", "test" , "X_test.txt" ),header = FALSE)
Train <- read.table(file.path("UCI HAR Dataset", "train", "X_train.txt"),header = FALSE)
LabelTest  <- read.table(file.path("UCI HAR Dataset", "test" , "y_test.txt" ),header = FALSE)
LabelTrain <- read.table(file.path("UCI HAR Dataset", "train", "y_train.txt"),header = FALSE)
SubjTest  <- read.table(file.path("UCI HAR Dataset", "test" , "subject_test.txt"),header = FALSE)
SubjTrain <- read.table(file.path("UCI HAR Dataset", "train", "subject_train.txt"),header = FALSE)

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

SubData<-Data[,grep("mean\\(\\)|std\\(\\)",names(Data),value=TRUE)]
tData<-cbind(tempData,SubData)

activityLabels <- read.table(file.path("UCI HAR Dataset", "activity_labels.txt"),header = FALSE)
temp<-activityLabels$V2
temp<-as.character(temp)
tData<-mutate(tData,activitynum=temp[as.integer(Label$activitynum)])
```

Codes used for renamings in the tidy data:

```r
names(tData)<-gsub("std()", "SD", names(tData))
names(tData)<-gsub("mean()", "MEAN", names(tData))
names(tData)<-gsub("^t", "time", names(tData))
names(tData)<-gsub("^f", "frequency", names(tData))
names(tData)<-gsub("Acc", "Accelerometer", names(tData))
names(tData)<-gsub("Gyro", "Gyroscope", names(tData))
names(tData)<-gsub("Mag", "Magnitude", names(tData))
names(tData)<-gsub("BodyBody", "Body", names(tData))

library(plyr)
Data2<-aggregate(. ~subject + activitynum, tData, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
new_colNames<-paste("ave", colnames(Data2), sep=".")
setnames(Data2, old = colnames(Data2[3:ncol(Data2)]), new = new_colNames[3:length(new_colNames)])
```
