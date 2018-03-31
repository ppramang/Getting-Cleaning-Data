Getting and Cleaning Data
=========================


## Final Project
========================

We should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject


## Analytic Process
=========================

1. Download the data source from the link provided in the Code Book and store them in a folder on your local drive.
2. Store the run_analysis.R in zour directorz where the UCI HAR Dataset is already stored.
3. Run source("run_analysis.R") at the RStudio. A new file called tiny_data.txt will be created in your working directory.


## Importabt Notes
=========================

The run_analysis.R is highly dependent form the reshape2 package.

