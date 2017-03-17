## ReadMe for run_analysis.R file

The run_analysis.R performs the following sequence of operations on the data files given in:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

obtained from the website : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


* Merges data from training and test datasets, reading data from the corresponding folders
* Labels the colums of the data set created with the names issued from the corresponding text files in folder
* Select only colums presenting mean and std for measures
* Change activity number with corresponding names in the data set created, and stores the result in data_final
* Groups rows of the data set per activity and member returning the average of all measures for the different coluns, save the results in an independant data_average
* Saves the data_average in a txt file called "dataset_q5.txt" in the working directory

