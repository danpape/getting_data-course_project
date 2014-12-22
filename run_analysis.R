library(dplyr)

# Location of UCI HAR dataset
dataPath = "./UCI HAR Dataset"

# Read file containing the activity names
activity_names = read.table(file = paste(dataPath, "activity_labels.txt", sep = "/"), 
                            stringsAsFactors = FALSE);

# Read file containing the feature names
feature_names = read.table(file = paste(dataPath, "features.txt", sep = "/"), 
                           stringsAsFactors = FALSE);

# Extract indexes of feature names that include "mean()" or "std()" for use 
# when filtering the list of feature names
indices_of_desired_features = grep("*(mean|std)\\(\\)*", feature_names$V2)

# Do some renaming of feature names to make them easier to read
feature_names$V2 = gsub("^f", "freq_", feature_names$V2)
feature_names$V2 = gsub("^t", "time_", feature_names$V2)
feature_names$V2 = gsub("-mean\\(\\)", "_mean", feature_names$V2)
feature_names$V2 = gsub("-std\\(\\)", "_std", feature_names$V2)
feature_names$V2 = gsub("-([XYZ])$", '_\\1', feature_names$V2)

##############################
# Dealing with "Test" data set

# Read test set data (observational measurements)
test_set = read.table(file = paste(dataPath, "test/X_test.txt", sep = "/"), col.names=feature_names$V2);

# Read test set labels (activity ids)
test_labels = read.table(file = paste(dataPath, "test/y_test.txt", sep = "/"));

# Read test set subjects (id of person being measured)
test_subjects = read.table(file = paste(dataPath, "test/subject_test.txt", sep = "/"));

# Convert activity ids to activity names 
test_activities = lapply(test_labels, function(x) activity_names[x,2])

# Use extracted indexes of the features we want to keep to filter the main data set
filtered_test_set = test_set[,indices_of_desired_features]

##################################
# Dealing with "Training" data set

# Read training set data (observational measurements)
train_set = read.table(file = paste(dataPath, "train/X_train.txt", sep = "/"), col.names=feature_names$V2);

# Read training set labels (activity ids)
train_labels = read.table(file = paste(dataPath, "train/y_train.txt", sep = "/"));

# Read training set subjects (id of person being measured)
train_subjects = read.table(file = paste(dataPath, "train/subject_train.txt", sep = "/"));

# Convert activity ids to activity names 
train_activities = lapply(train_labels, function(x) activity_names[x,2])

# Use extracted indexes of the features we want to keep to filter the main data set
filtered_train_set = train_set[,indices_of_desired_features]

#######################################
# Combine the testing and training data

combined_data = rbind(filtered_test_set, filtered_train_set)

# Add new 'activity' column
combined_activities = append(test_activities$V1, train_activities$V1)
combined_data$activity = combined_activities

# Add new 'subject' column
combined_subjects = append(test_subjects$V1, train_subjects$V1)
combined_data$subject = combined_subjects

###############################################################################
# Use dplyr functions to group data by subject and activity, then run mean() on 
# the grouped data in order to summarize. This produces a WIDE tidy data set.

tidy_data = group_by(combined_data, subject, activity) %>% summarise_each(funs(mean))

write.table(tidy_data, file = "tidy_data.txt", row.name=FALSE)

