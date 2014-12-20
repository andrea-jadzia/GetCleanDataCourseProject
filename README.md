GetCleanDataCourseProject
=========================

Course Project for 'Getting and Cleaning Data' - Data Science Course on Cousera

This is my contribution to the course project of the 'Getting and Cleaning Data' Data Science Course 
on Cousera in December 2014.

The task of the course project is to produce a tidy data set of the dataset that can be retrieved at
'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'.

The data represents data collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available at the site where the data was obtained: 'http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones'.

My contribution consists of
I.  This Readme document 'ReadMe.md'
II. The R script called 'run_analysis.R' which transformes the raw data into a tidy data set by performing the following steps
	1. Merge the training and the test sets to create one data set,
	2. Extract only the measurements on the mean and standard deviation for each measurement,
	3. Use descriptive activity names to name the activities in the data set,
	4. Appropriately label the data set with descriptive variable names,
	5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
III.The tidy data set that is the result of the operations performed in the R script 'run_analysis.R'.
IV. A code book called 'CodeBook.md' describing the variables, the data, and any transformations that were performed to clean up the data. 

All of this can be found at the Github repository at 'https://github.com/andrea-jadzia/GetCleanDataCourseProject'.

Please read the dataset into R using
	tidy_data <- read.table("./tidydata.txt", header = TRUE) 

