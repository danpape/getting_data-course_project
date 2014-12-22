# Code book for Getting and Cleaning Data - Course Project

This file describing the methods used to clean up the 'UCI HAR Dataset', and also explains the variables contained in the tidy data set.

## Raw data

The raw data represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

My `run_analysis.R` script assumes that the raw data set is contained in a relative directory called `./UCI HAR Dataset`. If your raw data lives somewhere else, you can modify the variable `dataPath` at the top of `run_analysis.R`.

## Method

The code in `run_analysis.R` is well commented, and I will give an overview of what it does here.

First we read in some of the supporting data we need, like the feature names for the measured observations (body acceleration, gravity acceleration, etc), and the activity names which are a description of what the subjects were doing at the time of the measurements (standing, sitting, laying, etc.)

Next, we extract indexes of feature names that include "mean()" or "std()" for use when filtering the list of feature names, since we are only interested in mean or standard deviation measurements. We will use these indexes later to filter the larger set of feature names. Then we rename those feature names to make them a bit easier to read. For example, 'tBodyAcc-mean()-X' becomes 'time_BodyAcc_mean_X'. 

Next, we read in the test data set, along with the activity labels (ids of activity names) and the test subject ids (ids of people used as test subjects). We do the same with the training data set, and then we use the indexes of feature names that include "mean()" or "std()" to filter these large sets of data down to something smaller that we are interested in.

Next we combine the filtered test and training data sets into a single combined set.

Now, we use function from the dplyr package to group data by subject and activity, then run mean() on the grouped data in order to summarize. This produces a WIDE tidy data set.

Last, we write out the tidy data to the file `tidy_data.txt`.


## Data variables

Here is a list of the feature names we have kept from the filtering. To recap, we feature names that include "mean()" or "std()" for use when filtering the list of feature names, since we are only interested in mean or standard deviation measurements. 

"time_BodyAcc_mean_X" "time_BodyAcc_mean_Y" "time_BodyAcc_mean_Z" "time_BodyAcc_std_X" "time_BodyAcc_std_Y" "time_BodyAcc_std_Z" "time_GravityAcc_mean_X" "time_GravityAcc_mean_Y" "time_GravityAcc_mean_Z" "time_GravityAcc_std_X" "time_GravityAcc_std_Y" "time_GravityAcc_std_Z" "time_BodyAccJerk_mean_X" "time_BodyAccJerk_mean_Y" "time_BodyAccJerk_mean_Z" "time_BodyAccJerk_std_X" "time_BodyAccJerk_std_Y" "time_BodyAccJerk_std_Z" "time_BodyGyro_mean_X" "time_BodyGyro_mean_Y" "time_BodyGyro_mean_Z" "time_BodyGyro_std_X" "time_BodyGyro_std_Y" "time_BodyGyro_std_Z" "time_BodyGyroJerk_mean_X" "time_BodyGyroJerk_mean_Y" "time_BodyGyroJerk_mean_Z" "time_BodyGyroJerk_std_X" "time_BodyGyroJerk_std_Y" "time_BodyGyroJerk_std_Z" "time_BodyAccMag_mean" "time_BodyAccMag_std" "time_GravityAccMag_mean" "time_GravityAccMag_std" "time_BodyAccJerkMag_mean" "time_BodyAccJerkMag_std" "time_BodyGyroMag_mean" "time_BodyGyroMag_std" "time_BodyGyroJerkMag_mean" "time_BodyGyroJerkMag_std" "freq_BodyAcc_mean_X" "freq_BodyAcc_mean_Y" "freq_BodyAcc_mean_Z" "freq_BodyAcc_std_X" "freq_BodyAcc_std_Y" "freq_BodyAcc_std_Z" "freq_BodyAccJerk_mean_X" "freq_BodyAccJerk_mean_Y" "freq_BodyAccJerk_mean_Z" "freq_BodyAccJerk_std_X" "freq_BodyAccJerk_std_Y" "freq_BodyAccJerk_std_Z" "freq_BodyGyro_mean_X" "freq_BodyGyro_mean_Y" "freq_BodyGyro_mean_Z" "freq_BodyGyro_std_X" "freq_BodyGyro_std_Y" "freq_BodyGyro_std_Z" "freq_BodyAccMag_mean" "freq_BodyAccMag_std" "freq_BodyBodyAccJerkMag_mean" "freq_BodyBodyAccJerkMag_std" "freq_BodyBodyGyroMag_mean" "freq_BodyBodyGyroMag_std" "freq_BodyBodyGyroJerkMag_mean" "freq_BodyBodyGyroJerkMag_std"
