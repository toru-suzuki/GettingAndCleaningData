 README.md 
## Coursera "Getting and Cleaning data project assignment
Script: "run_analysis.R"
Codebook:"CodeBook.md"
##Contents of script
###Read folloing files supplied 
*"./UCI HAR Dataset/activity_labels.txt"		Links the class labels with their activity name
*"./UCI HAR Dataset/features.txt" 	 	List of all features
*"./UCI HAR Dataset/train/X_train.txt"		Training set
*"./UCI HAR Dataset/train/Y_train.txt"		Training labels
*"./UCI HAR Dataset/train/subject_train.txt"	Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30
*"./UCI HAR Dataset/test/X_test.txt"		Test set
*"./UCI HAR Dataset/test/Y_test.txt"		Test labels
*"./UCI HAR Dataset/test/subject_test.txt"	Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30
###Process
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.?
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable?names.?
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

####Output files
"tdata.txt": tidy data set
