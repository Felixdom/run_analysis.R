# run_analysis.R
Project for "Getting and cleaning data" course.
----------------------------------------------------------

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare
tidy data that can be used for later analysis. It will be required to submit: 1) a tidy data set, 2) a link to a Github repository
with the script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations
or work that was performed to clean up the data called CodeBook.md.

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Create one R script called run_analysis.R that does the following: 

  1. Merge the training and the test sets to create one data set.
  2. Extract only the measurements on the mean and standard deviation for each measurement. 
  3. Use descriptive activity names to name the activities in the data set
  4. Appropriately label the data set with descriptive variable names. 
  5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and 
each subject.
