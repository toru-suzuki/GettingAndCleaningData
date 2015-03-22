## File name "run_analysis.R"
## Courcera Getting and Cleaning Data Program assignment 

## 2015/3/5 Programmed by T.Suzuki

## Read data files
setwd("C://Users/“O/Documents/TS/Coursera/Getting and Cleaning data")
library(plyr)
library(dplyr)

## read activity and feature labels
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt") #6x2: NO.,Label
names(activity_labels)<-c("activityID","activity_labels")
features<-read.table("./UCI HAR Dataset/features.txt") #561x2 No.,Label

## read train data file
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt") #7352x561 :Measured Data -1:+1
Y_train<-read.table("./UCI HAR Dataset/train/Y_train.txt") #7352x1 :Trainig Label Data 1:6 
S_train<-read.table("./UCI HAR Dataset/train/subject_train.txt") #7352x1 :Person ID 1:30

## read test data file
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt") #2947x561
Y_test<-read.table("./UCI HAR Dataset/test/Y_test.txt") #2947x1
S_test<-read.table("./UCI HAR Dataset/test/subject_test.txt") #2947x1

## Add feature label, Training label, Person's ID
names(X_train)<-features[,2]
names(X_test) <-features[,2]
names(Y_train)<-"activityID" # 6 activity Label
names(Y_test) <-"activityID"
names(S_train)<-"subjectID" # 1:30
names(S_test) <-"subjectID"

Train<-cbind(X_train, Y_train, S_train) #7352x563 col.562=activityID, 563=Subject ID
TestData<-cbind(X_test, Y_test, S_test) #2947x563

## 1.  Merges the training and the test sets to create one data set.
AllData<-rbind(Train, TestData) #10299x563

## 2.  Extracts only the measurements on the mean and standard deviation
mean_col<-grep("mean()", names(AllData),fixed=TRUE)
std_col<-grep("std()", names(AllData),fixed=TRUE)
mean_std<-sort(c(mean_col, std_col,562,563)) #  col.562=activityID, 563=SubjectID
mean_std_Data<-AllData[,mean_std] ## results of Q2  10299x68

## 3.  Uses descriptive activity names to name the activities in the data set
mean_std_Data$activityID<-mapvalues(mean_std_Data$activityID,
                        from=activity_labels$activityID,
                        to=as.character(activity_labels$activity_labels))

## 4.  Appropriately labels the data set with descriptive variable names.
## Already assigned at step2

## 5.  From the data set in step 4, creates a second, 
##     independent tidy data set with the average of each variable 
##     for each activity and each subject.

# variable: 68
# activity: 6
# subject: 30
by_var<-group_by(mean_std_Data,activityID,subjectID)
tdata<-summarise_each_(by_var,funs(mean),names(c(mean_col,std_col)))

write.table(tdata, file="tdata.txt", row.name=FALSE)

### end of program ###