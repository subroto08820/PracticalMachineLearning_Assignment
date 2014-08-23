###############################################################################
#   Part 1  Load the data sets                                                #        
###############################################################################

#download the data
setwd("~/COURSERA/Getting & Cleaning Data/Assignments/Assignment2/UCI HAR Dataset")
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "Raw_Data.zip")
unzip("Raw_Data.zip") #unzip the file

#prepare the column names for all the features
setwd("~/COURSERA/Getting & Cleaning Data/Assignments/Assignment2/UCI HAR Dataset")
features <- read.table("features.txt", quote="\"")
features_list<-c("subject","activity",as.character(features[,2]))

#read tables
#training dataset
setwd("~/COURSERA/Getting & Cleaning Data/Assignments/Assignment2/UCI HAR Dataset/train")
X_train <- read.table("X_train.txt", quote="\"")
y_train <- read.table("y_train.txt", quote="\"")
subject_train <- read.table("subject_train.txt", quote="\"")

#Create new raw sets with column names
train_raw<-cbind(subject_train,y_train,X_train)
colnames(train_raw)<-features_list

#label the training set
train_raw$group<-"train"

#test dataset
setwd("~/COURSERA/Getting & Cleaning Data/Assignments/Assignment2/UCI HAR Dataset/test")
X_test <- read.table("X_test.txt", quote="\"")
y_test <- read.table("y_test.txt", quote="\"")
subject_test <- read.table("subject_test.txt", quote="\"")

#Create new raw sets with column names
test_raw<-cbind(subject_test,y_test,X_test)
colnames(test_raw)<-features_list

#label the testing set
test_raw$group<-"test"


###############################################################################
#   Part 2  data manipulation                                                 #        
###############################################################################

#Merges the training and the test sets to create one data set
all_data_raw<-rbind(train_raw,test_raw)
table(all_data_raw$group) #check the split percentage of training/test(70/30)

#Extracts only the measurements on the mean and standard deviation for each measurement
#feature names with "mean"
mean_col<-names(all_data_raw)[grep("mean()",names(all_data_raw),fixed = TRUE)]

#feature names with "std"
std_col<-names(all_data_raw)[grep("std()",names(all_data_raw),fixed = TRUE)]
mean_std_col<-sort(c(mean_col,std_col))

#final feature names
col_selected<-c("subject","activity","group",mean_std_col)

#subset to selecy only target features
all_data_selected<-all_data_raw[ , c(col_selected)]

###############################################################################
#   Part 3  join tables to get descriptive activity names                     #        
###############################################################################

#load the lookup table for class labels and their activity name
setwd("~/COURSERA/Getting & Cleaning Data/Assignments/Assignment2/UCI HAR Dataset")
activity_labels <- read.table("activity_labels.txt", quote="\"")
colnames(activity_labels)<-c("activity","activity_description")

#Uses descriptive activity names to name the activities in the data set
all_data_final<-merge(all_data_selected,activity_labels,by.x="activity",by.y="activity",all=TRUE)
all_data_final<-all_data_final[,c(ncol(all_data_final),1:(ncol(all_data_final)-1))]


###############################################################################
#   Part 4  create new tidy data set                                          #        
###############################################################################

#new tidy data set with the average of each variable for each activity and each subject
#ONLY grouped by activity_description and subject, training and test data mixed togather
all_data_aggr<-all_data_final[, !(colnames(all_data_final) %in% c("activity","group"))]
results<-aggregate(. ~ activity_description + subject,data = all_data_aggr, mean)

#add "mean" to all the calculated column
names(results)[grep("std()|mean()",names(results))] <-
        paste(names(results)[grep("std()|mean()",names(results))], "mean", sep = "-")

#final output as a .txt file
write.table(results,"mean_for_all.txt")
