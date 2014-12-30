RunAnalysis
===========

Repo for Getting and Cleaning Data Assignment


## The repo includes the following:
* README.md, which you are currently reading
* run_analysis.R: an R script to clean data and perform the analysis; it uses files in the "UCI HAR Dataset" subdirectory in the working directory 
* TidyData.txt: the output obtained from running run_analysis.R; it can be read in R using read.table with argument header = TRUE
* codebook.md: a code book describing the variables and the processing done


## The run_analysis.R script: 

* Reads test files and train files
* Creates one data set by binding the training and the test sets
* Reads column names from features.txt
* Cleans column names from undesirable characters
* Extracts only the measurements on the mean and standard deviation for each measurement
* Replaces activity labels by activity names
* Creates a separate data set with the average of each variable for each activity and each subject using plyr package
* Writes tidy data set in txt format