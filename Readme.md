---
title: "Readme"
output: html_document
---

This is the Readme file explaining what the analysis file does.

For the course project, we should create one R script called run_analysis.R that does the following: 
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. - Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each    variable for each activity and each subject.

This is the description on how the script that I have created works for each given step.
Sorry for my poor english.

The data have been collected by clicking on the link below.  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

By doing this, I automatically dowload a zip file.
After unzipping the file, we should have a directory named UCI HAR Dataset. 

Don't change anything in this directory.

The structure of the UCI HAR datasets directory are as follows:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

Before, you begin, you need the packages data.table and dplyr. If you don't have it, you should install it and load it.

**Step 1: Merges the training and the test sets to create one data set**

load package data.table. 

Use the command fread() to create dataframe with each file that are in the train and test directories. We obtain 6 dataframes (3 for the files in the training directory and 3 for the files in the test directory).

Check the dimension of each dataframe. 

Find that in the test directory, the dimensions of the files are as follow:

- Y_test file : 2947 rows x 1 column
- subject_test file : 2947 rows x 1 column
- X_test file : 2947 rows x 561 columns

In the train directories, the dimensions are: 

- Y_train file: 7352 rows x 1 column
- subject_train file : 7352 rows x 1 column
- X_train file : 7352 rows x 561 column

I understand that the Y_train and Y_test files values indicate what activity are measured, the subject_train and subject_test values are the ID of the subject who made the experiment and the X_train and X_test values are the differents features measurements, either for the test or training group that have made the experiment.

Column merge the train files together and the test files together, each merging is made with cbind(). 

The order to merge the file is subject_train, y_train, x_train for the merging of the train file and subject_test, y_test, x_test for the merging of the test files.

We obtain two files, one for the training with dimension 7352 rows and 563 columns and one for the test with 2947 rows and 563 columns. 

Merge the train file with the test file with rbind() to obtain a complete file with 10299 rows and 563 columns.

The feature.txt file has two columns. The first column is a sequence of number from 1 to 561 identifying each feature. The second column contain the list of all features.  

After creating a dataframe from the feature.txt file, I notice that there are duplicated name in the list of features. Since I am not interested in the duplicated column names because they are not measurements on mean and standard deviation and I will have to remove them, I rename them with anything. The important thing is that the name are unique. So, I rename the duplicated name by the ID of the feature name.  

After that, I extract the second column from the feature dataframe to have a character vector with the name of features.

I add at the beginning of this vector, two other names "subjectid" and "numactivity" and I sse this vector to name the columns of the complete data set.

Remove all the intermediary dataframe to keep only the complete one.

**Step 2: Extracts only the measurements on the mean and standard deviation for each measurement**

Load package dplyr as it works well with big data frame.

Load the complete data frame in a data frame tbl with the tbl_df() command.

Use the select command to select all the variable containing the word "mean" or "std" in the complete dataset. 
The word "mean" also appear in the angle() variables but I don't want to keep them as I just want the mean of the feature vector for each pattern. So I remove them from the complete dataset. 
The meanFreq, weighted average of the frequency components, have also been measured. But I choose to keep only the mean value for each measurement, so I remove them also.   

I obtain a new dataset with 68 columns and 10 299 observations. 

The two first columns are the subjectID and activity number and the last 66 columns are the mean value and  standard deviation estimated for each of the following  pattern:

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag


**Step 3: Uses descriptive activity names to name the activities in the data set**

Create a dataframe with the activity label from the file activity_labels.txt

Use the first column in the dataframe activity as a KEY to merge with the complete dataset. 
In the complete dataset, the column "numactivity"  is set as the key.

After merging the activity dataframe with the complete dataframe, we remove the activity number because we don't need it anymore. We wanted descriptive activity names instead of activity number. 


**Step 4: Appropriately labels the data set with descriptive variable names**

I create a character vector with the complete dataset names. Then, I write a function to replace the following text in the names and have a new vector with more descriptive variable name:

- acc is replaced by accelaration
- mag by magnitude
- tbody by timebody
- tgravity by timegravity
- f by frequency
- bodybody by body
Also, remove the parentheses () and the -

After, I replace the names of the complete dataset by the new one.


**Step 5 : From the data set in step4, creates a second, independant tidy data set with the average of each variable for each activity and each subject**

Use the group_by() command to group the complete dataset by activity and subjectID. It gives 180 groups for 6 activities and 30 subjects.

Then I use the summarize_each() command with the mean fonction on all the variable in the dataset. It returns the average of each variable for each of 180 groups created before  


Upload this data set  as a txt file created with write.table using row.name=FALSE

