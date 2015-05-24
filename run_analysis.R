library(dplyr)

# Load the train and the test data
TestDataRaw <- read.table("UCI HAR Dataset/test/X_test.txt",colClasses="numeric",comment.char="")
TrainDataRaw <- read.table("UCI HAR Dataset/train/X_train.txt",colClasses="numeric",comment.char="")
TestSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt",colClasses="numeric",comment.char="")
TrainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt",colClasses="numeric",comment.char="")
TestActivities <- read.table("UCI HAR Dataset/test/y_test.txt",colClasses="numeric",comment.char="")
TrainActivities <- read.table("UCI HAR Dataset/train/y_train.txt",colClasses="numeric",comment.char="")

# Merge them
DataRaw <- rbind(TestDataRaw,TrainDataRaw)
Subjects <- rbind(TestSubjects,TrainSubjects)
Activities <- rbind(TestActivities,TrainActivities)

# Read in the info on activities and features 
Features <- read.table("UCI HAR Dataset/features.txt")
names(Features) <- c("Index","Var")
ActivityLabels <- read.table("UCI HAR Dataset/activity_labels.txt",stringsAsFactors=FALSE)
names(ActivityLabels) <- c("Index","Act")

# Extract only the features that contain mean and std
Means <- grep("mean\\(\\)",Features$Var)
Stds <- grep("std\\(\\)",Features$Var)
RelFeatures <- Features[sort(c(Means,Stds)),]

# Select the relevant features in the data and name them
DataRel <- DataRaw[,RelFeatures$Index]
RelFeatures$Var <- gsub("\\(\\)", "", RelFeatures$Var)
RelFeatures$Var <- gsub("-", "_", RelFeatures$Var)
names(DataRel) <- RelFeatures$Var

# Add to this data set columns with subjecs and activities
DataRel <- cbind(Subject = Subjects$V1, Activity = ActivityLabels$Act[Activities$V1], DataRel)

# Group data by subject and activity and summarize each column within the group
DataRel$Subject <- factor(DataRel$Subject)
DataRel$Activity <- factor(DataRel$Activity)
Group <- group_by(DataRel,Subject,Activity)
TidyData <- as.data.frame(summarise_each(Group,funs(mean)))

#Write the new tidy data to a file
write.table(TidyData,"ActivityAverages.txt",row.name=FALSE)