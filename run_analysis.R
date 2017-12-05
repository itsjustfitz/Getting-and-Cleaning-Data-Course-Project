
#########THIS FILE CONTAINS ALL THE R CODE FOR THIS PROJECT################################

# Set the working directory
setwd("C:/Users/ItsJustFitz/Desktop/GetCleanData")

# download the UCI HAR Dataset zip file
fileurl <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile = "UCI-HAR.zip")


# unzip the UCI HAR Dataset zip filefile
unzip ("UCI-HAR.zip", exdir = "C:/Users/ItsJustFitz/Desktop/GetCleanData")

##### NOTE: Used Notepad++ to confirm the defaults for read.table would read files in correctly
####### (header = FALSE and sep = "")

# Read the activity_labels file
activity_labels <- read.table("C:/Users/ItsJustFitz/Desktop/GetCleanData/UCI HAR Dataset/activity_labels.txt")

str(activity_labels)
dim(activity_labels)  # Get dimensions 6 x 2  -  activity labels in column 2

# Read the features file
features <- read.table("C:/Users/ItsJustFitz/Desktop/GetCleanData/UCI HAR Dataset/features.txt")

str(features)
dim(features)  # Get dimensions 561 x 2 - actual feature names in column 2


####### READ IN TEST FILES AND GIVE COLUMN LABELS  ################
# Read the subject_test file
subject_test <- read.table("C:/Users/ItsJustFitz/Desktop/GetCleanData/UCI HAR Dataset/test/subject_test.txt")

str(subject_test)
dim(subject_test) # Get dimensions 2947 x 1

# Label the subject_test column
colnames(subject_test) <- "subjectID"

# Read the y_test file
y_test <- read.table("C:/Users/ItsJustFitz/Desktop/GetCleanData/UCI HAR Dataset/test/y_test.txt")

str(y_test)
dim(y_test)   # Get dimensions 2947 x 1

# Label the y_test column
colnames(y_test) <- "Activity"

# Read the X_test file
X_test <- read.table("C:/Users/ItsJustFitz/Desktop/GetCleanData/UCI HAR Dataset/test/X_test.txt")

str(X_test)
dim(X_test)  # Get dimensions 2947 x 561

# Add column labels to X_test from the features file
colnames(X_test) <- features$V2

###### REDUCE X_TEST to only desired columns #####################
# Use features file to identify columns labelled with a leading dash followed by "mean()" or "std()" in their names 
X_test_reduce <- grep("-(mean|std)\\(\\)", features$V2)
X_test_reduce   # Verified that only desired columns were included in grep results
length(X_test_reduce)  #  Get length of 66

# use this resulting vector of columns to reduce the X_test dataset
X_test_meanstd <- X_test[,X_test_reduce]
str(X_test_meanstd)  
dim(X_test_meanstd)  # Get dimensions 2947 x 66

########## APPROPRIATELY LABEL x_test_reduce WITH MORE DESCRIPTIVE VARIABLE NAMES #################################
# Change start letter of each variable to more descriptive text
colnames(X_test_meanstd) <- sub("tBody","timeBody",colnames(X_test_meanstd))
colnames(X_test_meanstd) <- sub("tGrav","timeGrav",colnames(X_test_meanstd))
colnames(X_test_meanstd) <- sub("fBody","freqBody",colnames(X_test_meanstd))
# Change redundant "BodyBody" text in some variable names to "Body
colnames(X_test_meanstd) <- sub("BodyBody","Body",colnames(X_test_meanstd))
# Check results
names(X_test_meanstd)

# Search for and delete special characters "()" and "-"
colnames(X_test_meanstd) <- sub("mean\\(\\)","Mean",colnames(X_test_meanstd))
colnames(X_test_meanstd) <- sub("std\\(\\)","Std",colnames(X_test_meanstd))
colnames(X_test_meanstd) <- gsub("\\-","",colnames(X_test_meanstd))
# Check results
names(X_test_meanstd)



######### MERGE THE THREE TEST FILES ###################
all_test <- cbind(subject_test,y_test,X_test_meanstd)

str(all_test)
dim(all_test)   # Get dimensions 2947 X 68 as expected

####### READ IN TRAIN FILES AND GIVE COLUMN LABELS ##############
# Read the subject_train file
subject_train <- read.table("C:/Users/ItsJustFitz/Desktop/GetCleanData/UCI HAR Dataset/train/subject_train.txt")

str(subject_train)
dim(subject_train)   # Get dimension 7352 x 1

# Label the subject_train column
colnames(subject_train) <- "subjectID"

# Read the y_train file
y_train <- read.table("C:/Users/ItsJustFitz/Desktop/GetCleanData/UCI HAR Dataset/train/y_train.txt")

str(y_train)
dim(y_train)    # Get dimensions 7352 x 1

# Label the y_test column
colnames(y_train) <- "Activity"

# Read the X_train file
X_train <- read.table("C:/Users/ItsJustFitz/Desktop/GetCleanData/UCI HAR Dataset/train/X_train.txt")

str(X_train)
dim(X_train)  # Get dimensions 7352 x 561

# Add column labels to X_train from the features file
colnames(X_train) <- features$V2

###### REDUCE X_TRAIN to only desired columns #####################
# Use features file to identify columns labelled with a leading dash followed by "mean()" or "std()" in their names 
X_train_reduce <- grep("-(mean|std)\\(\\)", features$V2)
X_train_reduce   # Verified that only desired columns were included in grep results
length(X_train_reduce)  #  Get length of 66

# use this resulting vector of columns to reduce the X_test dataset
X_train_meanstd <- X_train[,X_train_reduce]
str(X_train_meanstd)  
dim(X_train_meanstd)  # Get dimensions 7352 x 66

########## APPROPRIATELY LABEL x_train_reduce WITH MORE DESCRIPTIVE VARIABLE NAMES #################################
# Change start letter of each variable to more descriptive text
colnames(X_train_meanstd) <- sub("tBody","timeBody",colnames(X_train_meanstd))
colnames(X_train_meanstd) <- sub("tGrav","timeGrav",colnames(X_train_meanstd))
colnames(X_train_meanstd) <- sub("fBody","freqBody",colnames(X_train_meanstd))
# Change redundant "BodyBody" text in some variable names to "Body
colnames(X_train_meanstd) <- sub("BodyBody","Body",colnames(X_train_meanstd))
# Check results
names(X_train_meanstd)

# Search for and delete special characters "()" and "-"
colnames(X_train_meanstd) <- sub("mean\\(\\)","Mean",colnames(X_train_meanstd))
colnames(X_train_meanstd) <- sub("std\\(\\)","Std",colnames(X_train_meanstd))
colnames(X_train_meanstd) <- gsub("\\-","",colnames(X_train_meanstd))
# Check results
names(X_train_meanstd)


######### MERGE THE THREE TRAIN FILES ###################
all_train <- cbind(subject_train,y_train,X_train_meanstd)

str(all_train)
dim(all_train)   # Get dimensions 7352 x 68 as expected

######### MERGE THE TEST AND TRAIN FILES ###################
all_data <- rbind(all_test,all_train)

str(all_data)
dim(all_data)   # Get dimensions 10299 x 68 as expected


######### REPLACE ALL ACTIVITY NUMBERS WITH LABELS FROM activity_labels FILE ############################
all_data$Activity <- activity_labels[,2][match(all_data$Activity, activity_labels[,1])]
table(all_data$Activity) # Verified that all 10299 rows have Activity label instead of number

str(all_data)
dim(all_data)
names(all_data)   # Get dimensions 10299 x 68 as expected


######## CREATE SECOND INDEPENDENT TIDY DATASET WITH THE AVERAGE FOR EACH OF 66 VARIABLES BY EACH SUBJECT AND ACTIVITY ################
# call to plyr and dplyr libraries
library(plyr)
library(dplyr)

# Group the data by vars subjectID and Activity
all_data_grouped <- group_by(all_data,subjectID,Activity)
# Get means for the 66 variables grouped by subjectID and Activity
all_means_data <- ddply(all_data_grouped, .(subjectID, Activity), function(x) colMeans(x[, 3:68]))

str(all_means_data)
dim(all_means_data)  # Get 180 rows by 68 variables as expected
head(all_means_data) # Verify Activity 1-6 per subjectID

# Write out final file
write.table(all_means_data, "tidy_data.txt", row.name=FALSE)

######### NOTE: The final tidy dataset "tidy_data.txt" can be read in with the following: read.table("tidy_data.txt", header = TRUE) ##################


