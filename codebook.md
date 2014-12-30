Codebook
========

## Description of the variables

### First two variables
* Activity: 6 values for each activity type performed by subject: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

* Subject: subject ID from 1 to 30

### Information on other variables
Extract from features_info.txt in the original data set: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

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

### Common features of the 66 last variables
* domain signals: first letter 't' stands for time domain signals, 'f' for frequency domain signals
* signal type: 'Acc' for Acceleration, 'Gyro' for Gyroscope, 'Mag' for Magnitude
* 'mean_' for mean value, 'std_' for standard deviation
* 'X', 'Y' or 'Z' for signals in the X, Y and Z directions

## Transformations performed to clean up the data

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

The resulting tidy data set ("TidyData.txt") contains the average for each variable (mean or standard deviation for each measurement) for each subject and activity.