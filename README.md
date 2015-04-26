## Generating tidy data from UCI HAR Dataset

## Save the downlodead "UCI HAR Dataset"in your current directory. So "UCI HAR Dataset" would become a folder under 
## your current diectory.

## 1. Read the "activity_labels.txt" to the variable "activity_labels" which will contain
## six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

## 2. Read the "features.txt" to the variable "features" which will contain 
## fist of all features, 561 of it.

## 3. Read the "subject_test.txt" to the variable "subject_test" which will contain 
## list of all subjects who is part of test.

## 4. Read the "subject_train.txt" to the variable "subject_train" which will contain 
## list of all subjects who is part of train.

## 5. Read the "X_test.txt" to the variable "X_test" which will contain 
## test data which contains different statistical measurement.

## 6. Read the "Y_test.txt" to the variable "Y_test" which will contain 
## test data which contains the activity labels.

## 7. Read the "X_train.txt" to the variable "X_train" which will contain 
## train data which contains different statistical measurement.

## 8. Read the "Y_train.txt" to the variable "Y_train" which will contain 
## train data which contains the activity labels.

## 9."Complete_test" dataset with proper variable and activity names. 
## There are 563 columns including details of subject and activity.
## So each row in complete_test dataset contains a particlur acitivity(in activity column)
## of particular subject(in subject column) along with the 561 statistical
## values.(mean,sd,min,max,kurtosis etc..)

## 10."Complete_train" dataset with proper variable and activity names. 
## There are 563 columns including details of subject and activity.
## So each row in complete_train dataset contains a particlur acitivity(in activity column)
## of particular subject(in subject column) along with the 561 
## statistical values.(mean,sd,min,max,kurtosis etc..)

## 11.Creating "merge_complete" data set with 10299 rows with data for subjects
## 1 to 30. This is achieved by doing rbind on complete_test and  complete_train dataset, which
## contains part of the subjects. So teh merged dataset set will have data for all the subjects.

## 12. In below steps I am filtering out columns from merge_complete data set as per the 
## the requirement of the study. It contains columns having details on "mean","standard deviation",
## "activity" & "subject". The new dataset would be tidy_mean_std.

## 13. Sorting dataset based on subject column to get "tidy_mean_std" dataset.

##14. Summarizing the mean based on subject and activity and putting it in "tidy_dataset". So each row 
## would be a particular subject with his activity along with mean of statistic columns.

##15. Writing the final tidy_dataset to txt file named "tidy_dataset.txt".

