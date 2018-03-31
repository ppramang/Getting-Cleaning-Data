
#Read the data tables after initially unziping them and storing them our workng directory
s_train <- read.table("subject_train.txt")
x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")


s_test <- read.table("subject_test.txt")
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")


#Check how the created data frames above look like - We will notice that innone of the data sets 
#there is a header. The headers are included in the file "features.txt"
View(s_train)
View(x_train)
View(y_train)

View(s_test)
View(x_test)
View(y_test)


#Read the features tables from the corresponding txt file and the feature names as header for each
#column of the data frames x_train, x_test. On top we will assign headers to the rest of the data
# sets (y_train, y_test, s_train and s_test)
headers <- read.table("features.txt")
names(x_train) <- headers[,2]
names(x_test) <- headers[,2]

names(s_train) <- "SubjectPerson"
names(s_test) <- "SubjectPerson"

names(y_train) <- "ActivityLabel"
names(y_test) <- "ActivityLabel"


#Requirement 1: Merge the above data frames in one clean and tidy dataset called "data_all"

dt_train <- cbind(s_train,y_train, x_train)
dt_test <- cbind(s_test, y_test, x_test)
data_all <- rbind(dt_train,dt_test)


#requirement 2: We will identify and extract thoses columns which corresponds to the mean 
#or standard deviation of the measurmeents while keeping the "ActivityLable" and "SubjectPerson"
#columns. The final dataset will be named "data_all_MeanStd"
headers_all <- names(data_all)
MeanStdMeas <- grepl("mean\\(\\)", headers_all) | grepl("std\\(\\)", headers_all)

keepActivitySubject <- data_all[,1:2]

data_all_MeanStd <- subset(data_all,MeanStdMeas | keepActivitySubject)


#Requirement 3 & 4: Assign the corresponding level names to each level of the ActivityLabel column
#We will start by converting the second column of the "data_all_MeanStd" dataset (which 
#corresponds to the "ActivityLabel" variable) into a factor variable. At the same time we will
# assign labels for each level of the factor variable
data_all_MeanStd[,"ActivityLabel"] <- factor(data_all_MeanStd[,"ActivityLabel"],labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))


#requirement 5: We will develop based on the latest dataset "data_all_MeanStd" a new independent 
#"tidy" dataset that will contain the average of each variable for each activity ("ActivityLabel")
# and each subject ("SubjectPerson")

library(reshape2)

split_dt <- melt(data_all_MeanStd, id=c("SubjectPerson","ActivityLabel"))
new_dt <- dcast(split_dt, SubjectPerson+ActivityLabel ~ variable, mean)

#Save the new dataset in a .csv file
write.csv(new_dt, "ind_tidy_dt.csv")













