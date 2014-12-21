Codebook for tidydata.txt
========================= 
This dataset was produced as part of the Course Project for 'Getting and Cleaning Data' - Course on Cousera.
It describes the variables, the data, and all transformations to clean up the data.

## Original Data
The original dataset contains information about Human Activity Recognition Using Smartphones and was recorded by Jorge L. Reyes-Ortiz et.al. from Smartlab [Università degli Studi di Genova]. It can be retrieved at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. As part of the dataset there are two files that describe the original data in more detail: 'readme.txt' and 'feature_info.txt'.

The data provides information of 30 individuals performing 6 different activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, a 3-axial linear acceleration and 3-axial angular velocity was captured at a constant rate of 50Hz.

Overall there are 10299 entries (number of rows) which contain different measurements of the 30 individuals performing six different activities over time. For each person and activity combination there are between 36 and 95 entries (rows) with a mean of 57 entries per person and activity.

The original data consists of 561 measurement-variables (features) describing different summarized information per entry like for example mean value, standard deviation, minimum and sum. Of this only mean and standard deviation variables were taken for the tidy dataset. There are no missing values in the original data. All measurements are normalized. The values are numeric values, between -1 and 1.

## Tidy data
The tidy data was build by calculating the mean value of all variables that contain a mean or standard deviation for each person (subject) and activity. It consists of 180 rows, representing all 30 individuals performing each of the 6 activities.

### Variables

Besides the variables on subjects (persons) and activity, there are 66 newly calculated mean variables (33 based on mean values, 33 based on standard deviation of the original measurement).
The kind of original measurement can be read from the variable names:

The names code consists of 5 different parts in the following order

1.  t             Time domain signals 
    f             Frequency domain signals

2.  Body          Body acceleration signals 
    Gravity	      Gravity acceleration signals 

3.  Acc           Linear acceleration from accelerometer
    AccJerk       Jerk signals from linear acceleration of body
    AccJerkMag    Magnitude of AccJerk
    AccMag    	  Magnitude of Acc
    Gyro	        Angular velocity from gyroscope
    GyroJerk	    Jerk signals from angular velocity of body
    GyroJerkMag	  Magnitude of GyroJerk
    GyroMag	      Magnitude of Gyro

4.  mean          Mean value of the original measurement over time
    std           Standard deviation of the original measurement over time

5.  X             x-axsis
    Y             y-axsis
    Z             z-axsis
                  no 3-axial information

**Variable overview**

Name | Class | Values
------|-------|---------
subject |integer |1,2,3,...,30
activity |factor |WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
tBodyAcc_mean_X |numeric [-1 to 1]
tBodyAcc_mean_Y |numeric [-1 to 1]
tBodyAcc_mean_Z |numeric [-1 to 1]
tBodyAcc_std_X |numeric [-1 to 1]
tBodyAcc_std_Y |numeric [-1 to 1]
tBodyAcc_std_Z |numeric [-1 to 1]
tGravityAcc_mean_X |numeric [-1 to 1]
tGravityAcc_mean_Y |numeric [-1 to 1]
tGravityAcc_mean_Z |numeric [-1 to 1]
tGravityAcc_std_X |numeric [-1 to 1]
tGravityAcc_std_Y |numeric [-1 to 1]
tGravityAcc_std_Z |numeric [-1 to 1]
tBodyAccJerk_mean_X  |numeric [-1 to 1]  
tBodyAccJerk_mean_Y |numeric [-1 to 1]
tBodyAccJerk_mean_Z |numeric [-1 to 1]
tBodyAccJerk_std_X |numeric [-1 to 1]
tBodyAccJerk_std_Y |numeric [-1 to 1]
tBodyAccJerk_std_Z |numeric [-1 to 1]
tBodyGyro_mean_X |numeric [-1 to 1]
tBodyGyro_mean_Y |numeric [-1 to 1]
tBodyGyro_mean_Z |numeric [-1 to 1]
tBodyGyro_std_X |numeric [-1 to 1]
tBodyGyro_std_Y |numeric [-1 to 1]
tBodyGyro_std_Z |numeric [-1 to 1]
tBodyGyroJerk_mean_X |numeric [-1 to 1]
tBodyGyroJerk_mean_Y |numeric [-1 to 1]
tBodyGyroJerk_mean_Z |numeric [-1 to 1]
tBodyGyroJerk_std_X |numeric [-1 to 1] 
tBodyGyroJerk_std_Y |numeric [-1 to 1]
tBodyGyroJerk_std_Z |numeric [-1 to 1] 
tBodyAccMag_mean |numeric [-1 to 1]
tBodyAccMag_std |numeric [-1 to 1]
tGravityAccMag_mean |numeric [-1 to 1]
tGravityAccMag_std |numeric [-1 to 1]
tBodyAccJerkMag_mean |numeric [-1 to 1] 
tBodyAccJerkMag_std |numeric [-1 to 1] 
tBodyGyroMag_mean |numeric [-1 to 1]
tBodyGyroMag_std |numeric [-1 to 1] 
tBodyGyroJerkMag_mean |numeric [-1 to 1]
tBodyGyroJerkMag_std |numeric [-1 to 1]
fBodyAcc_mean_X |numeric [-1 to 1]
fBodyAcc_mean_Y |numeric [-1 to 1]
fBodyAcc_mean_Z |numeric [-1 to 1]
fBodyAcc_std_X |numeric [-1 to 1]
fBodyAcc_std_Y |numeric [-1 to 1]
fBodyAcc_std_Z |numeric [-1 to 1]
fBodyAccJerk_mean_X |numeric [-1 to 1]
fBodyAccJerk_mean_Y |numeric [-1 to 1]
fBodyAccJerk_mean_Z |numeric [-1 to 1]
fBodyAccJerk_std_X |numeric [-1 to 1]
fBodyAccJerk_std_Y |numeric [-1 to 1]
fBodyAccJerk_std_Z |numeric [-1 to 1]
fBodyGyro_mean_X |numeric [-1 to 1]
fBodyGyro_mean_Y |numeric [-1 to 1]
fBodyGyro_mean_Z |numeric [-1 to 1]
fBodyGyro_std_X |numeric [-1 to 1]
fBodyGyro_std_Y |numeric [-1 to 1]
fBodyGyro_std_Z |numeric [-1 to 1]
fBodyAccMag_mean |numeric [-1 to 1]
fBodyAccMag_std |numeric [-1 to 1]
fBodyAccJerkMag_mean |numeric [-1 to 1]
fBodyAccJerkMag_std |numeric [-1 to 1]
fBodyGyroMag_mean |numeric [-1 to 1]  
fBodyGyroMag_std |numeric [-1 to 1]
fBodyGyroJerkMag_mean |numeric [-1 to 1]
fBodyGyroJerkMag_std |numeric [-1 to 1]
