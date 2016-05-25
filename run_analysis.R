# This R script does the following:
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

install.packages("dplyr")
library(dplyr)

# Load the test data
x_test <- read.delim("./UCI HAR Dataset/test/X_test.txt", header=F,sep = "")
# Load the test data subject
subject_test <- read.delim("./UCI HAR Dataset/test/subject_test.txt", header=F,sep = "")
# Load the test data activity codes
y_test <- read.delim("./UCI HAR Dataset/test/y_test.txt", header=F,sep = "")
# combine all these three files
test_data <- cbind(subject_test,y_test, x_test)

# Load the training data
x_train <- read.delim("./UCI HAR Dataset/train/X_train.txt", header=F,sep = "")
# Load the training data subject
subject_train <- read.delim("./UCI HAR Dataset/train/subject_train.txt", header=F,sep = "")
# Load the training data activity codes
y_train <- read.delim("./UCI HAR Dataset/train/y_train.txt", header=F,sep = "")
# combine all these three files for training data set
train_data <- cbind(subject_train,y_train, x_train)

# Merge test and train data sets
all_data <- rbind(test_data,train_data)
# Load features for column names of the measurements
features <- read.delim("./UCI HAR Dataset/features.txt", header=F,sep = "")
# Assign column names to the combined data set
colnames(all_data) <- c("subject","activity",as.character(features$V2))

# Extract only relevant columns: mean and standard deviation and subject and activity code
sub_data <-  all_data[,grep('subject|activity|(.*)mean(.*)|(.*)std(.*)',colnames(all_data))]
# Load the activity labels files
activity_labels <- read.delim("./UCI HAR Dataset/activity_labels.txt", header=F,sep = "")
colnames(activity_labels) <- c("activity","activity_label")

# Merge the activity label with extracted features data set
sub_data_label <- merge(sub_data,activity_labels,by.x = "activity",by.y = "activity")

# Do the mean  for the extracted measures  and output the data to the file tidy_data.txt
sub_data_group <- group_by(sub_data_label, subject, activity_label)
avg_by_subject_activity <- summarise_each(sub_data_group, funs(mean))
write.table(avg_by_subject_activity, file = "tiny_data.txt", row.names = F)

