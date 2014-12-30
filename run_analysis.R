## Read test files
test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
test_activity <- read.table("UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")

## Read training files
train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
train_activity <- read.table("UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")

## Create one data set with the training and the test sets
test <- cbind(test_subject, test_activity, test_data)
train <- cbind(train_subject, train_activity, train_data)
dataset <- rbind(train, test)

## Read column names
features <- read.table("UCI HAR Dataset/features.txt")
column_names <- features[,2]

## Clean column names
## Delete "(", ")", ",", "-" or replace them with "_" when it eases readability
column_names <- gsub("()-", "", column_names)
column_names <- gsub("-", "_", column_names)
column_names <- gsub(",", "_", column_names)
column_names <- gsub("()", "", column_names)
column_names <- gsub("\\(", "_", column_names)
column_names <- gsub("\\)", "", column_names)

## Replace "BodyBody" by "Body"
column_names <- gsub("BodyBody", "Body", column_names)

## Add column names for bound columns ("Subject" and "Activity" columns)
column_names <- c("Subject", "Activity", column_names)

## Replace variable names in dataset created in 1.
names(dataset) <- column_names

## Create a subset of dataset with column whose names contain Subject, Activity, 
## mean_ or std_ (formerly mean() or std() in features.txt) to select columns 
## with measurements on the mean and standard deviation and first two columns
## ("Subject" and "Activity" columns)
selection <- dataset[, grep("Subject|Activity|mean_|std_", column_names)]

## Read activity labels and rename columns
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activity_labels) <- c("Nrs", "Activity")

## Replace labels by activity names in 'selection' data set created in 2.
mergedData <- merge(activity_labels, selection, by.x="Nrs", by.y="Activity", all=TRUE)
mergedData$Nrs <- NULL

## Average values grouped by "Activity" and "Subject" using plyr package
require(plyr)
tidyData <- ddply(mergedData, .(Activity, Subject), colwise(mean))

## Write tidy data set in txt format
write.table(tidyData,"TidyData.txt",row.names = FALSE)