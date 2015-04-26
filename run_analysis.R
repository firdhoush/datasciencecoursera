## Generating tidy data from UCI HAR Dataset

## Save the downlodead "UCI HAR Dataset"in your current directory. So "UCI HAR Dataset" would become a folder under 
## your current diectory.

## 1. Read the "activity_labels.txt" to the variable "activity_labels" which will contain
## six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
activity_labels$V1<-as.character(activity_labels$V1)  ####Coercing first column to character
activity_labels$V2<-as.character(activity_labels$V2)  ##Coercing second column to character


## 2. Read the "features.txt" to the variable "features" which will contain 
## fist of all features, 561 of it.

features<-read.table("./UCI HAR Dataset/features.txt")
features$V2<-as.character(features$V2)   ##Coercing the second column to character

## 3. Read the "subject_test.txt" to the variable "subject_test" which will contain 
## list of all subjects who is part of test.

subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
names(subject_test)=c("subject")

## 4. Read the "subject_train.txt" to the variable "subject_train" which will contain 
## list of all subjects who is part of train.
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
names(subject_train)=c("subject")

## 5. Read the "X_test.txt" to the variable "X_test" which will contain 
## test data which contains different statistical measurement.
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
for (i in 1:561) {names(X_test)[i]<-features[i,2]} ## Giving descriptive variable names taken from features dataset

## 6. Read the "Y_test.txt" to the variable "Y_test" which will contain 
## test data which contains the activity labels.
Y_test<-read.table("./UCI HAR Dataset/test/Y_test.txt")
names(Y_test)=c("activity") ## Changing column name to activity
Y_test$activity<-as.character(Y_test$activity) ## Coercing the activity column to character
for (i in 1:2947) {Y_test[i,1]<-activity_labels[Y_test[i,1],2]} ## Giving descriptive names to the activity labels.

## 7. Read the "X_train.txt" to the variable "X_train" which will contain 
## train data which contains different statistical measurement.
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
for (i in 1:561) {names(X_train)[i]<-features[i,2]} ## Giving descriptive variable names taken from features dataset

## 8. Read the "Y_train.txt" to the variable "Y_train" which will contain 
## train data which contains the activity labels.
Y_train<-read.table("./UCI HAR Dataset/train/Y_train.txt")
names(Y_train)=c("activity") ## Changing column name to activity
Y_train$activity<-as.character(Y_train$activity) ## Coercing the activity column to character
for (i in 1:7352) {Y_train[i,1]<-activity_labels[Y_train[i,1],2]} ## Giving descriptive names to the activity labels.

## 9.Complete test dataset below with proper variable and activity names. 
## There are 563 columns including details of subject and activity.
## So each row in complete_test dataset contains a particlur acitivity(in activity column)
## of particular subject(in subject column) along with the 561 statistical
## values.(mean,sd,min,max,kurtosis etc..)
complete_test<-X_test 
complete_test$activity<-Y_test$activity
complete_test$subject<-subject_test$subject ## New dataset complete_test created from X_test,Y_test and subject_test.

## 10.Complete train dataset with proper variable and activity names. 
## There are 563 columns including details of subject and activity.
## So each row in complete_train dataset contains a particlur acitivity(in activity column)
## of particular subject(in subject column) along with the 561 
## statistical values.(mean,sd,min,max,kurtosis etc..)
complete_train<-X_train
complete_train$activity<-Y_train$activity
complete_train$subject<-subject_train$subject ## New dataset complete_train created 
                                              ## from X_train,Y_train and subject_train.

## 11.Creating merge_complete data set with 10299 rows with data for subjects
## 1 to 30. This is achieved by doing rbind on complete_test and  complete_train dataset, which
## contains part of the subjects. So teh merged dataset set will have data for all the subjects.
merge_complete<-rbind(complete_test,complete_train) 

## 12. In below steps I am filtering out columns from merge_complete data set as per the 
## the requirement of the study. It contains columns having details on "mean","standard deviation",
## "activity" & "subject". The new dataset would be tidy_mean_std.

m<-data.frame()
n<-""
j<-0
for (i in 1:563) {
  if ((sum(str_count(names(merge_complete)[i],c("mean","std","activity","subject")))) == 1 )
  {
    j<-j+1
    n[j]<-names(merge_complete)[i]
  }
 }

complete_mean_std<-merge_complete[n]

## 13. Sorting dataset based on subject column to get "tidy_mean_std" dataset.
tidy_mean_std<-complete_mean_std[order(complete_mean_std$subject),]

##14. Summarizing the mean based on subject and activity and putting it in "tidy_dataset". So each row 
## would be a particular subject with his activity along with mean of statistic columns. 
tidy_dataset<-tidy_mean_std %>% group_by(subject,activity) %>% summarise_each(funs(mean))

##15. Writing the final tidy_dataset to txt file named "tidy_dataset.txt".
write.table(tidy_dataset,file="tidy_dataset.txt",row.names=FALSE)
