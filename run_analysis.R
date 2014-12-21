## This is the Script for the Course Projekt of The Getting and Cleaning Data Coursera Course in December 2014.

## Based on the dataset at 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
## This script performes the following steps:

## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.

## The dataset needs to be extracted in the working directory. After extraction 
## the files on the top level should be directly in a subfolder called 
## "UCI HAR Dataset" in the working directory.

## Load requires R packages for this script
library(dplyr)
library(stringr)
library(reshape2)

## Load features into R
features <- read.table("./UCI HAR Dataset/features.txt",
                       header = FALSE, sep = " ")

## Make proper names of features$V2 and correct mistakes like "Body.Body" to "Body"
## Please note that duplicates in variable names are not removed as those only occur apart from the mean()
##    and std() measurements

## Temporarely "mean(" and "std(" are replaced with "mean9" and "std9" in order to give a processable
## format for the later use of the grep-funktion
features$V2 <- gsub("\\)|\\,", "", features$V2)
features$V2 <- gsub("\\(", "9", features$V2)
features$V2 <- gsub("\\-|\\.", "_", features$V2)
features$V2 <- gsub("BodyBody", "Body", features$V2)

## Load all other required datasets into R
activity <- read.table("./UCI HAR Dataset/activity_labels.txt",
                       header = FALSE, sep = " ")

##      The features are used to label variables names of measurements in x_train and x_test

x_train <- read.table(file="./UCI HAR Dataset/train/X_train.txt", header = FALSE,
                      sep="", col.names= features$V2, colClasses=c(rep("numeric",561)), nrow=7352)


subjects_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",
                             header = FALSE, sep = " ")

y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",
                      header = FALSE, sep = "\n")

x_test <- read.table(file="./UCI HAR Dataset/test/X_test.txt", header = FALSE,
                     sep="", col.names= features$V2, colClasses=c(rep("numeric",561)), nrow=2947)

subjects_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",
                            header = FALSE, sep = " ")

y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",
                     header = FALSE, sep = "\n")

## Check for missing values
all(colSums(is.na(features))==0)
all(colSums(is.na(activity))==0)
all(colSums(is.na(x_train))==0)
all(colSums(is.na(subjects_train))==0)
all(colSums(is.na(y_train))==0)
all(colSums(is.na(x_test))==0)
all(colSums(is.na(subjects_test))==0)
all(colSums(is.na(y_test))==0)

## Bind X-part of training and test data together and add an id
x_all <- rbind(x_train, x_test)
x_all$id <- c(1:10299)

## Select only variables containing a mean or standard deviation.
## "MeanFreq"-variables and "Angle" variables are not included, as they do not contain a mean value 
##    (even though they have the word "mean" in the name).
## As parenthesis were replaced by "9" earlier, all mean values can be greped using "mean9",
##    which was "mean()" before replacement  
x_all_short <- select(x_all, id, grep("mean9|std9",colnames(x_all)))

## Label the data set with descriptive variable names: get rid of "9" and possible spaces.
colnames(x_all_short) <- str_trim(gsub("9", "", colnames(x_all_short)))

## Bind subjects of training and test data, adding ID, renaming subject-variable
subjects_all <- rbind(subjects_train, subjects_test)
subjects_all$id <- c(1:10299)
subjects_all <- select(subjects_all, id, subject = V1)

## Bind Y-part of training and test data, labeling activities and adding subjects
y2all <- rbind(y_train, y_test)
y2all$id <- c(1:10299)
y_all  <- merge(y2all, activity, by ="V1", all.x=TRUE)
y_all <- select(y_all, id, activity=V2)
y_all_subs <- merge(y_all, subjects_all, by ="id", all=TRUE)

## Check for missings again, as merging may have produced some new ones
all(colSums(is.na(y_all))==0)
all(colSums(is.na(y_all_subs))==0)

## Merge all data
all_data <- merge(x_all_short, y_all_subs, by ="id", all=TRUE)

## Check for missings in all_data
all(colSums(is.na(all_data))==0)

## Remove all unnessarary datasets
rm("x_train", "y_train", "subjects_train", "x_test", "y_test", "subjects_test", "x_all",
   "x_all_short", "y2all", "y_all", "subjects_all", "y_all_subs")

## Drop the id variable before melting the data and calculating the mean on all measurements
## for every subject/activity combination
data_melt <- melt(select(all_data, -id), id=c("subject", "activity"))
tidy_data <- dcast(data_melt, subject + activity ~ variable, mean)

## Remove intermediate dataset
rm("data_melt")
