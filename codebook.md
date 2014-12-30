Codebook
========

## Study design

The run_analysis.R script is used to process raw data collected from the accelerometers from the Samsung Galaxy S smartphone.
The "Human Activity Recognition Using Smartphones Data Set" was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Information on the data set (extract from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones):
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Description of the variables

### First two variables
* Activity: 6 values for each activity type performed by subject: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

* Subject: subject ID from 1 to 30

### Information on other variables - raw data
Extract from features_info.txt in the original data set: 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

### Common features of the 66 last variables - tidy data
* domain signals: first letter 't' stands for time domain signals, 'f' for frequency domain signals
* signal type: 'Acc' for Acceleration, 'Gyro' for Gyroscope, 'Mag' for Magnitude
* 'mean_' for mean value, 'std_' for standard deviation
* 'X', 'Y' or 'Z' for signals in the X, Y and Z directions

Values have been normalised into a -1 to 1 range therefore there are no units.

## Transformations performed to clean up the data (run_analysis.R script)

### Changes to the field names
* Deleted "()-", "()" and ")"
* Replaced "-", "," and "(" by "_"
* Replaced "BodyBody" by "Body"

### Changes to the data
* Bound the test data set with test "Subject" and "Activity" columns
* Bound the train data set with train "Subject" and "Activity" columns
* Bound the test and training data sets to create one data set
* Added column names
* Extracted only the columns with mean and standard deviation for each measurement, in addition to "Subject" and "Activity" columns
* Replaced activity labels by descriptive activity names
* Summarised the data by computing the average of each variable grouped by activity and subject

The resulting tidy data set ("TidyData.txt") contains the average for each variable (mean or standard deviation for each measurement) for each subject and activity. Values have been normalised into a -1 to 1 range therefore there are no units.