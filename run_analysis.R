library(dplyr)

## Merge data from training and test 

##  'train/X_train.txt': Training set.

url_X_train <- "./UCIHARDataset/train/X_train.txt"
X_train <- read.table(url_X_train)

##  'train/y_train.txt': Training labels.

url_y_train <- "./UCIHARDataset/train/y_train.txt"
y_train <- read.table(url_y_train)

##  'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

url_subject_train <- "./UCIHARDataset/train/subject_train.txt"
subject_train <- read.table(url_subject_train)

## merge all the data for the training set

training_set <- cbind(subject_train, y_train, X_train)


##  'test/X_test.txt': Test set.

url_X_test <- "./UCIHARDataset/test/X_test.txt"
X_test <- read.table(url_X_test)

##  'test/y_test.txt': Test labels.

url_y_test <- "./UCIHARDataset/test/y_test.txt"
y_test <- read.table(url_y_test)

##  'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

url_subject_test <- "./UCIHARDataset/test/subject_test.txt"
subject_test <- read.table(url_subject_test)

## merge all the data for the test set

test_set <- cbind(subject_test, y_test, X_test)


## merge all data for training and test sets

data <- rbind(test_set, training_set)

## labels columns

url_features <- "./UCIHARDataset/features.txt"
features <- read.table(url_features)
features$V2 <- gsub("\\(\\)", "", features$V2)
features$V2 <- gsub("\\(", ".", features$V2)
features$V2 <- gsub("\\)", ".", features$V2)
vect_names <- c("Subject","Activity", features$V2)
names(data) <- vect_names

## select only colums for std and mean
## note that the 2 first colums are for the subject and the activity and are to be kept

vec1 <- grep("mean", features$V2 )+2
vec2 <- grep("std", features$V2)+2
var_keep <- c(1,2, vec1, vec2)
var_keep <-sort(var_keep)

data_mean_std <- data[,var_keep]

## Variables: Activities to be modified 

url_activities <- "./UCIHARDataset/activity_labels.txt"
act <- read.table(url_activities)

data_final <- mutate(data_mean_std, Activity=act[Activity,2])

## data_final presents the data set as required at the end of question 4. The questioins were not followed in the given order for convenience

## Question 5: Independant tidy data set with the average of each variable for each activity and each subject

data_average <- data_final %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))


write.table(data_average, "dataset_q5.txt")
