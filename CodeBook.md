#Raw Dataset Description

Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

**For each record it is provided:**

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

**The raw dataset includes the following files:**

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

**Notes:** 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.


**Feature Selection** 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

#Creating the tidy datafile

Dowload the raw dataset from the link : 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Create one R script called run_analysis.R that does the following to create the tidy dataset: 

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The name of the tidy dataset is ***tidydata.txt***. 

For more information on the cleaning, see the ***Readme.md*** file. 

##Description of the dataset

Dimensions of the tidy dataset : 180 observations of 68 variables 

**The Variables present in the dataset are:**
(description of the variables is below)

- activity
- subjectid
- timebodyaccelerationmeanx
- timebodyaccelerationmeany
- timebodyaccelerationmeanz
- timegravityaccelerationmeanx
- timegravityaccelerationmeany
- timegravityaccelerationmeanz
- timebodyaccelerationjerkmeanx
- timebodyaccelerationjerkmeany
- timebodyaccelerationjerkmeanz
- timebodygyromeanx
- timebodygyromeany
- timebodygyromeanz
- timebodygyrojerkmeanx
- timebodygyrojerkmeany
- timebodygyrojerkmeanz
- timebodyaccelerationmagnitudemean
- timegravityaccelerationmagnitudemean
- timebodyaccelerationjerkmagnitudemean
- timebodygyromagnitudemean
- timebodygyrojerkmagnitudemean
- frequencybodyaccelerationmeanx
- frequencybodyaccelerationmeany
- frequencybodyaccelerationmeanz
- frequencybodyaccelerationjerkmeanx
- frequencybodyaccelerationjerkmeany
- frequencybodyaccelerationjerkmeanz
- frequencybodygyromeanx
- frequencybodygyromeany
- frequencybodygyromeanz
- frequencybodyaccelerationmagnitudemean
- frequencybodyaccelerationjerkmagnitudemean
- frequencybodygyromagnitudemean
- frequencybodygyrojerkmagnitudemean
- timebodyaccelerationstdx
- timebodyaccelerationstdy
- timebodyaccelerationstdz
- timegravityaccelerationstdx
- timegravityaccelerationstdy
- timegravityaccelerationstdz
- timebodyaccelerationjerkstdx
- timebodyaccelerationjerkstdy
- timebodyaccelerationjerkstdz
- timebodygyrostdx
- timebodygyrostdy
- timebodygyrostdz
- timebodygyrojerkstdx
- timebodygyrojerkstdy
- timebodygyrojerkstdz
- timebodyaccelerationmagnitudestd
- timegravityaccelerationmagnitudestd
- timebodyaccelerationjerkmagnitudestd
- timebodygyromagnitudestd
- timebodygyrojerkmagnitudestd
- frequencybodyaccelerationstdx
- frequencybodyaccelerationstdy
- frequencybodyaccelerationstdz
- frequencybodyaccelerationjerkstdx
- frequencybodyaccelerationjerkstdy
- frequencybodyaccelerationjerkstdz
- frequencybodygyrostdx
- frequencybodygyrostdy
- frequencybodygyrostdz
- frequencybodyaccelerationmagnitudestd
- frequencybodyaccelerationjerkmagnitudestd
- frequencybodygyromagnitudestd
- frequencybodygyrojerkmagnitudestd

##Description of the variables

###activity 

This variable give the name of the six activities performed for the experiment.

Class of the variable : Factor with 6 levels

Levels of the variable: LAYING,SITTING,STANDING,WALKING, WALKING_DOWNSTAIRS,WALKING_UPSTAIRS

###subjectid

This variable give the number associating with each participant of the experience. This number repeat 6 times for each activity.

Class of the variable : Integer from 1 to 180

###timebodyaccelerationmeanx and timebodyaccelerationmeany and timebodyaccelerationmeanz

These three variables give the mean of the mean value estimated from  the time body accelaration  captured in three different axes (x,y,z). 

Class of the variable : Numeric 

###timegravityaccelerationmeanx and timegravityaccelerationmeany and timegravityaccelerationmeanz

These three variables give the mean of the mean value estimated from the time gravity accelaration signal captured in three different axes(x,y,z). 

Class of the variable : Numeric 

###timebodyaccelerationjerkmeanx and timebodyaccelerationjerkmeany timebodyaccelerationjerkmeanz

These three variables give the mean of the mean value estimated from the Jerk signals that have been derived in time from the body linear acceleration. The suffix x,y and z is used to denote 3-axial signal.

Class of the variable : Numeric 

###timebodygyromeanx and timebodygyromeany and timebodygyromeanz

These three variables give the mean of the mean value estimated from the time body  measured from the gyroscope 3 axial raw signals. 

Class of the variable : Numeric 

###timebodygyrojerkmeanx and timebodygyrojerkmeany and timebodygyrojerkmeanz

These three variables give the mean of the mean value estimated from the Jerk signals that have been derived in time from the angular velocity. The suffix x,y and z is used to denote 3-axial signal.

Class of the variable : Numeric 

###timebodyaccelerationmagnitudemean

This variable give the mean of the mean value estimated from the magnitude of the time body accelaration signal calculated using the Euclidian norm

Class of the variable : Numeric 

###timegravityaccelerationmagnitudemean

This variable give the mean of the mean value estimated from the magnitude of the time gravity accelaration signal calculated using the Euclidian norm

Class of the variable : Numeric 

###timebodyaccelerationjerkmagnitudemean

This variable give the mean of the mean value estimated from the magnitude of the Jerk signals that have been derived in time from the body linear acceleration calculated using the Euclidian norm

Class of the variable : Numeric 

###timebodygyromagnitudemean

This variable give the mean of the mean value estimated from the magnitude of the time body  measured from the gyroscope 3 axial raw signals

Class of the variable : Numeric 

###timebodygyrojerkmagnitudemean

This variable give the mean of the mean value estimated from the magnitude of  the Jerk signals that have been derived in time from the angular velocity

Class of the variable : Numeric 

###frequencybodyaccelerationmeanx and frequencybodyaccelerationmeany and frequencybodyaccelerationmeanz

These three variables give the mean of the mean value estimated from the frequency signal for the body accelaration captured in three different axes (x,y,z).

Class of the variable : Numeric 

###frequencybodyaccelerationjerkmeanx and frequencybodyaccelerationjerkmeany and frequencybodyaccelerationjerkmeanz

These three variables give the mean of the mean value estimated from the frequency signal that have produce a Fast Fourier Transformation applied on the Jerk signals that have been derived in time from the body linear acceleration

Class of the variable : Numeric 

###frequencybodygyromeanx and frequencybodygyromeany and frequencybodygyromeanz

These three variables give the mean of the mean value estimated from the frequency signal that have produce a Fast Fourier Transformation applied on the time body  measured from the gyroscope 3 axial raw signals.

Class of the variable : Numeric 

###frequencybodyaccelerationmagnitudemean

This variable give the mean of the mean value estimated from the frequency signal that have produce a Fast Fourier Transformation applied on the magnitude of the time body accelaration signal calculated using the Euclidian norm

Class of the variable : Numeric 

###frequencybodyaccelerationjerkmagnitudemean

This variable give the mean of the mean value estimated from the frequency signal that have produce a Fast Fourier Transformation applied on the magnitude of the Jerk signals that have been derived in time from the body linear acceleration calculated using the Euclidian norm.

Class of the variable : Numeric 

###frequencybodygyromagnitudemean

This variable give the mean of the mean value estimated from the frequency signal that have produce a Fast Fourier Transformation applied on the magnitude of the time body  measured from the gyroscope 3 axial raw signals

Class of the variable : Numeric 

###frequencybodygyrojerkmagnitudemean

This variable give the mean of the mean value estimated from the frequency signal that have produce a Fast Fourier Transformation applied on the magnitude of  the Jerk signals that have been derived in time from the angular velocity

Class of the variable : Numeric 

###timebodyaccelerationstdx and timebodyaccelerationstdy and timebodyaccelerationstdz

These three variables give the mean of the standard deviation value estimated from  the time body accelaration  captured in three different axes (x,y,z). 

Class of the variable : Numeric 

###timegravityaccelerationstdx and timegravityaccelerationstdy and timegravityaccelerationstdz

These three variables give the mean of the standard deviation value estimated from the time gravity accelaration signal captured in three different axes(x,y,z). 

Class of the variable : Numeric 

### timebodyaccelerationjerkstdx and timebodyaccelerationjerkstdy and timebodyaccelerationjerkstdz

These three variables give the mean of the standard deviation value estimated from the Jerk signals that have been derived in time from the body linear acceleration. The suffix x,y and z is used to denote 3-axial signal.

Class of the variable : Numeric 

###timebodygyrostdx and timebodygyrostdy and timebodygyrostdz

These three variables give the mean of the standard deviation value estimated from the time body  measured from the gyroscope 3 axial raw signals. 

Class of the variable : Numeric 

###timebodygyrojerkstdx and timebodygyrojerkstdy and timebodygyrojerkstdz

These three variables give the mean of the standard deviation value estimated from the Jerk signals that have been derived in time from the angular velocity. The suffix x,y and z is used to denote 3-axial signal.

Class of the variable : Numeric 

###timebodyaccelerationmagnitudestd

This variable give the mean of the standard deviation value estimated from the magnitude of the time body accelaration signal calculated using the Euclidian norm

Class of the variable : Numeric 

###timegravityaccelerationmagnitudestd 

This variable give the mean of the standard deviation value estimated from the magnitude of the time body accelaration signal calculated using the Euclidian norm

Class of the variable : Numeric 

###timebodyaccelerationjerkmagnitudestd

This variable give the mean of the standard deviation value estimated from the magnitude of the Jerk signals that have been derived in time from the body linear acceleration calculated using the Euclidian norm

Class of the variable : Numeric 

###timebodygyromagnitudestd

This variable give the mean of the standard deviation value estimated from the magnitude of the time body  measured from the gyroscope 3 axial raw signals

Class of the variable : Numeric 

###timebodygyrojerkmagnitudestd

This variable give the mean of the standard deviation value estimated from the magnitude of  the Jerk signals that have been derived in time from the angular velocity

Class of the variable : Numeric 

###frequencybodyaccelerationstdx and frequencybodyaccelerationstdy and frequencybodyaccelerationstdz

These three variables give the mean of the standard deviation value estimated from the frequency signal for the body accelaration captured in three different axes (x,y,z).

Class of the variable : Numeric 

###frequencybodyaccelerationjerkstdx and frequencybodyaccelerationjerkstdy and frequencybodyaccelerationjerkstdz

These three variables give the mean of the standard deviation value estimated from the frequency signal that have produce a Fast Fourier Transformation applied on the Jerk signals that have been derived in time from the body linear acceleration

Class of the variable : Numeric 

###frequencybodygyrostdx and frequencybodygyrostdy and frequencybodygyrostdz

These three variables give the mean of the standard deviation value estimated from the frequency signal that have produce a Fast Fourier Transformation applied on the time body  measured from the gyroscope 3 axial raw signals.

Class of the variable : Numeric 

###frequencybodyaccelerationmagnitudestd

This variable give the mean of the standard deviation value estimated from the frequency signal that have produce a Fast Fourier Transformation applied on the magnitude of the time body accelaration signal calculated using the Euclidian norm

Class of the variable : Numeric 

###frequencybodyaccelerationjerkmagnitudestd

This variable give the mean of the standard deviation value estimated from the frequency signal that have produce a Fast Fourier Transformation applied on the magnitude of the Jerk signals that have been derived in time from the body linear acceleration calculated using the Euclidian norm.

Class of the variable : Numeric 

###frequencybodygyromagnitudestd

This variable give the mean of the standard deviation value estimated from the frequency signal that have produce a Fast Fourier Transformation applied on the magnitude of the time body  measured from the gyroscope 3 axial raw signals

Class of the variable : Numeric 

###frequencybodygyrojerkmagnitudestd

This variable give the mean of the standard deviation value estimated from the frequency signal that have produce a Fast Fourier Transformation applied on the magnitude of  the Jerk signals that have been derived in time from the angular velocity

Class of the variable : Numeric 