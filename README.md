Week-3-course-project run_analysis.R READEME
============================================

run_analysis.R is an R scrip by which to get a tidy dataset from the original data here: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The original datasets were extracted to the path ./UCI HAR Dataset
The R script has done the following jobs.
1.	Merges the training datasets (under path ./UCI HAR Dataset/train/) and the test sets (under path ./UCI HAR Dataset/test/)to create one data set.
2.	Extracts the measurements on the mean and standard deviation for each measurement. 
3.	Name the activities in the data set and label the data set with descriptive variable names.
4.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
5.	Write the tidy data to “a.txt”.

Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit?degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

Static variables in run_analysis.R
==================================
- features: a 2x561 matrix read from 'features.txt' which include a list of all 561 features. Its range is 1 to 561.
- activity_labels: a 2x6 matrix read from 'activity_labels.txt' which include a list of 6 activity names. Its range is 1 to 6.

- X_train: a 7352x561 matrix read from 'train/X_train.txt', the training set in the data package.
- y_train: a 7352x1 matrix read from 'train/y_train.txt', the training labels in the data package. Its range is 1 to 6.
- subject_train: a 7352x561 matrix read from 'train/subject_train.txt', the training subject in the data package. Its range is 1 to 30.

- X_test: a 2947x561 matrix read from 'test/X_test.txt', the test set in the data package.
- y_test: a 2947x561 matrix read from 'test/y_test.txt', the test labels in the data package. Its range is 1 to 6.
- subject_test: a 2947x561 matrix read from 'test/subject_test.txt', the test subject in the data package. Its range is 1 to 30.

- X_all: the merged dataset with X_train and X-test.
- label_all: the merged dataset with y_train and y-test.
- subject_all: the merged dataset with subject_train and subject-test.

- sub_X_all: the subset of X_all, which includes only mean and standard deviation of the measurements.
- sub_features: the feature names of sub_X_all.
- data_total: a combined dataset with sub_X_all, label_all and subject_all.
- ave_subject: the average result of each activity.
- t_ave_list: the average result of all six activities, the tidy data.

Activities Definition
=====================

- 1 WALKING
- 2 WALKING_UPSTAIRS
- 3 WALKING_DOWNSTAIRS
- 4 SITTING
- 5 STANDING
- 6 LAYING

Subjects Definition
===================

- 1 subject1
- 2 subject2
- 3 subject3
- 4 subject4
- 5 subject5
- 6 subject6
- 7 subject7
- 8 subject8
- 9 subject9
- 10 subject10
- 11 subject11
- 12 subject12
- 13 subject13
- 14 subject14
- 15 subject15
- 16 subject16
- 17 subject17
- 18 subject18
- 19 subject19
- 20 subject20
- 21 subject21
- 22 subject22
- 23 subject23
- 24 subject24
- 25 subject25
- 26 subject26
- 27 subject27
- 28 subject28
- 29 subject29
- 30 subject30

Features Definition
===================

- 1 tBodyAccmeanX: average of tBodyAcc-mean()-X
- 2 tBodyAccmeanY: average of tBodyAcc-mean()-Y
- 3 tBodyAccmeanZ: average of tBodyAcc-mean()-Z
- 4 tBodyAccstdX: average of tBodyAcc-std()-X
- 5 tBodyAccstdY: average of tBodyAcc-std()-Y
- 6 tBodyAccstdZ: average of tBodyAcc-std()-Z

- 7 tGravityAccmeanX: average of tGravityAcc-mean()-X
- 8 tGravityAccmeanY: average of tGravityAcc-mean()-Y
- 9 tGravityAccmeanZ: average of tGravityAcc-mean()-Z
- 10 tGravityAccstdX: average of tGravityAcc-std()-X
- 11 tGravityAccstdY: average of tGravityAcc-std()-Y
- 12 tGravityAccstdZ tGravityAcc-std()-Z

- 13 tBodyAccJerkmeanX: average of tBodyAccJerk-mean()-X
- 14 tBodyAccJerkmeanY: average of tBodyAccJerk-mean()-Y
- 15 tBodyAccJerkmeanZ: average of tBodyAccJerk-mean()-Z
- 16 tBodyAccJerkstdX: average of tBodyAccJerk-std()-X
- 17 tBodyAccJerkstdY: average of tBodyAccJerk-std()-Y
- 18 tBodyAccJerkstdZ: average of tBodyAccJerk-std()-Z

- 19 tBodyGyromeanX: average of tBodyGyro-mean()-X
- 20 tBodyGyromeanY: average of tBodyGyro-mean()-Y
- 21 tBodyGyromeanZ: average of tBodyGyro-mean()-Z
- 22 tBodyGyrostdX: average of tBodyGyro-std()-X
- 23 tBodyGyrostdY: average of tBodyGyro-std()-Y
- 24 tBodyGyrostdZ: average of tBodyGyro-std()-Z

- 25 tBodyGyroJerkmeanX: average of tBodyGyroJerk-mean()-X
- 26 tBodyGyroJerkmeanY: average of tBodyGyroJerk-mean()-Y
- 27 tBodyGyroJerkmeanZ: average of tBodyGyroJerk-mean()-Z
- 28 tBodyGyroJerkstdX: average of tBodyGyroJerk-std()-X
- 29 tBodyGyroJerkstdY: average of tBodyGyroJerk-std()-Y
- 30 tBodyGyroJerkstdZ: average of tBodyGyroJerk-std()-Z

- 31 tBodyAccMagmean: average of tBodyAccMag-mean()
- 32 tBodyAccMagstd: average of tBodyAccMag-std()

- 33 tGravityAccMagmean: average of tGravityAccMag-mean()
- 34 tGravityAccMagstd: average of tGravityAccMag-std()

- 35 tBodyAccJerkMagmean: average of tBodyAccJerkMag-mean()
- 36 tBodyAccJerkMagstd: average of tBodyAccJerkMag-std()

- 37 tBodyGyroMagmean: average of tBodyGyroMag-mean()
- 38 tBodyGyroMagstd: average of tBodyGyroMag-std()

- 39 tBodyGyroJerkMagmean: average of tBodyGyroJerkMag-mean()
- 40 tBodyGyroJerkMagstd: average of tBodyGyroJerkMag-std()               


- 41 fBodyAccmeanX: average of fBodyAcc-mean()-X
- 42 fBodyAccmeanY: average of fBodyAcc-mean()-Y
- 43 fBodyAccmeanZ: average of fBodyAcc-mean()-Z
- 44 fBodyAccstdX: average of fBodyAcc-std()-X
- 45 fBodyAccstdY: average of fBodyAcc-std()-Y
- 46 fBodyAccstdZ: average of fBodyAcc-std()-Z

- 47 fBodyAccJerkmeanX: average of fBodyAccJerk-mean()-X
- 48 fBodyAccJerkmeanY: average of fBodyAccJerk-mean()-Y
- 49 fBodyAccJerkmeanZ: average of fBodyAccJerk-mean()-Z
- 50 fBodyAccJerkstdX: average of fBodyAccJerk-std()-X
- 51 fBodyAccJerkstdY: average of fBodyAccJerk-std()-Y
- 52 fBodyAccJerkstdZ: average of fBodyAccJerk-std()-Z

- 53 fBodyGyromeanX: average of fBodyGyro-mean()-X
- 54 fBodyGyromeanY: average of fBodyGyro-mean()-Y
- 55 fBodyGyromeanZ: average of fBodyGyro-mean()-Z
- 56 fBodyGyrostdX: average of fBodyGyro-std()-X
- 57 fBodyGyrostdY: average of fBodyGyro-std()-Y
- 58 fBodyGyrostdZ: average of fBodyGyro-std()-Z

- 59 fBodyAccMagmean: average of fBodyAccMag-mean()
- 60 fBodyAccMagstd: average of fBodyAccMag-std()

- 61 fBodyBodyAccJerkMagmean: average of fBodyBodyAccJerkMag-mean()
- 62 fBodyBodyAccJerkMagstd: average of fBodyBodyAccJerkMag-std()

- 63 fBodyBodyGyroMagmean: average of fBodyBodyGyroMag-mean()
- 64 fBodyBodyGyroMagstd: average of fBodyBodyGyroMag-std()

- 65 fBodyBodyGyroJerkMagmean: average of fBodyBodyGyroJerkMag-mean()
- 66 fBodyBodyGyroJerkMagstd: average of fBodyBodyGyroJerkMag-std()               

