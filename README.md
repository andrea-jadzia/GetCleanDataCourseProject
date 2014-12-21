GetCleanDataCourseProject
=========================

## Course Project for 'Getting and Cleaning Data' - Data Science Course on Cousera

This is my contribution to the course project of the 'Getting and Cleaning Data' (Data Science) Course on Cousera in December 2014.

### Contents
1. Task and provided data  
2. Description of the contribution  
3. Operations performed on the raw data as well as reasoning  

### 1. Task and provided data
The task of the course project is to produce a tidy data set of the dataset that can be retrieved at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The data represents data collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

### 2. Description of the contribution
My contribution consists of  
1. This Readme document 'README.md'  
2. The R script called 'run_analysis.R' which transformes the raw data into a tidy data set by performing the following steps
    * Merge the training and the test sets to create one data set,
    * Extract only the measurements on the mean and standard deviation for each measurement,
    * Use descriptive activity names to name the activities in the data set,
    * Appropriately label the data set with descriptive variable names,
    * From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.  
3. The tidy dataset that is the result of the operations performed in the R script 'run_analysis.R'.  
4. A code book called 'CodeBook.md' describing the variables, the data, and any transformations that were performed to clean up the data.  

With the exception of [3.] the tidy dataset all of this can be found at the Github repository *GetCleanDataCourseProject* at https://github.com/andrea-jadzia/GetCleanDataCourseProject.
**The tidy dataset was uploaded to coursera.**

The dataset can be read into R using

  tidy_data <- read.table("./tidydata.txt", header = TRUE) 

### 3. Operations performed on the raw data as well as reasoning
To run the script 'run_analysis.R' the dataset needs to be extracted in the working directory. After extraction it should be in a subfolder called "UCI HAR Dataset".

This is what the script does:
* Load requires R packages: dplyr, stringr, reshape2.
* Load features.txt into R
* Make proper names of Features and correct mistakes like "Body.Body" to "Body" or remove special characters. Please note that duplicates in variable names are not removed as those only occur apart from the mean() and std() measurements (and therefore will be removed anyway).
* Temporarely "mean(" and "std(" are replaced with "mean9" and "std9". This is done in order to give a processable format for the later use of the grep-funktion.
* Load all other required datasets into R: activity labels.txt; X train.txt; subject train.txt; y train.txt; X test.txt; subject test.txt; y test.txt  
The features are used to label variables names of measurements in the X-part of the data
* At this point - as well as later on (after merging tables together) - checks for missing values are performed to control data quality.
* Bind X-part of training and test data together and add an ID (a number from 1 to 20299) for later merging without loosing the given order
* In the next step only variables are selected that contain a mean or standard deviation. "MeanFreq"-variables and "Angle"-variables are not included, as they do not contain a mean value (even though the have the word "mean" in the name).  
As parenthesis were replaced by "9" earlier, all mean values can be greped using "mean9", which was "mean()" before the replacement.
* Now the data set is finally labeled with descriptive variable names. The "9" and possible spaces are getting rid of.
* Bind subjects of training and test data, adding ID and naming the subject-variable
* Bind Y-part of training and test data, adding ID, labeling activities and adding subjects
* Merge all data: the x-Part and the y-Part including subjects and activities
* Drop the ID variable 
* Melting the data and calculating the mean on all measurements for every subject/activity combination
* Intermediate datasets are removed.
