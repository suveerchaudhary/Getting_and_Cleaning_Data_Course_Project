Following files are used:
=========================================
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'subject_test.txt' : subjects who were part of observations for test observation
- 'subject_train.txt' : subjects who were part of observations for train observation

Datasets/Variables used in script :
=========================================
Activity_label -> Vector of activities(names)
features -> Vectorr with list of 561 readings/observation description
D1 -> Tidy Test Data
D2 -> Tidy Train Data
ALL_DATA -> Merged test & train Data
matches  -> List of matching columns which have mean and standard deviation for each measurement.
Mean_Std -> Data with mean and standard deviation for each measurement.
Target_Data -> Large LIST with 180 elements each element with mean & std observation for all subjects
Mean_Summary -> tidy data set with the average of each variable for each activity and each subject. 
