### Script_Name : run_analysis.R###
# 1. Merges the training and the test sets to create one data set. #
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.  #
# 3. Uses descriptive activity names to name the activities in the data set. #
# 4. Appropriately labels the data set with descriptive variable names.  #
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. # 

#  Set Work Directory as default#
setwd("~/")
#  Download the source file in Work Directory and unzip it#
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "source_data.zip")
unzip("source_data.zip")
#  Set Work Directory to Source Data File path#
first_dir <- "~/UCI HAR Dataset"
setwd(first_dir)
#  Check files#
dir_files <- list.files(first_dir)
# read 'activity_labels.txt' and load into a vector #
Activity_label <- read.table(paste(first_dir, "/", dir_files[1], sep = ""))
Activity_label <- as.vector(Activity_label$V2)
# read 'features.tx' and load into a vector #
features <- read.table(paste(first_dir, "/", dir_files[2], sep = ""))
features <- as.vector(features$V2)
count = 1
# load merge datasets from train & test folders #
while (count < 3){
      if (count == 1){
            setwd("~/UCI HAR Dataset/test")
            data_type = "test"
                  }
      if (count == 2){
# load train data #
            
            D1 <- Data
            setwd("~/UCI HAR Dataset/train")
            data_type = "train"
      }
# list files from working directory #      
      files <- list.files(getwd())
      X <- files[3]
      Y <- files[4]
      S <- files[2]
      library(plyr)
# run cbind to concatenate 3 datasets (repeating activity to add Activity label & Activity Name) #
      Data <- do.call("cbind", lapply(c(S, Y, Y, X), function(dn) data.frame(read.table(dn))))
      Act <- Data[, 3]
      for (i in Act) {
            Act[Act == i] = Activity_label[i]
      }
      Data[, 3] <- Act
      Type <- rep(paste(data_type, "set", sep = ""), nrow(Data))
      Data <- cbind(data.frame(Type), Data)
      count <- count + 1
}
# load train data #
D2 <- Data
#merge train data with test data #
ALL_DATA <- rbind(D1, D2)
# put column names #
cols <- c("Type", "Subject", "Activity_label", "Activity", features)
colnames(ALL_DATA) <- cols
#find mean & std columns #
matches <- grep ("mean|std", colnames(ALL_DATA), value = TRUE)
# extract matching column data #
Mean_Std <- ALL_DATA[, matches]
# List of List of matching columns
Target_Data <- split(ALL_DATA[, 5:565], list(ALL_DATA$Activity, ALL_DATA$Subject))
Mean_Summary <- sapply(Target_Data, colMeans)
setwd("~/")
write.table(Mean_Summary, "~/Mean_Summary.txt", sep="\t")