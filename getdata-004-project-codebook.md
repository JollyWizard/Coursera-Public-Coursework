
# getdata-004 | Course Project | Codebook

## Overview

* The original data was harvested from smartphone accelerometers.
* The original data set included preprocessed data, including filtered values and inferred component parts.
* Each measurement was related to a sampling session.
* The mean of the each sample mean and standard deviation included in the dataset was aggregated using the activity and subject as identity columns

## Data Field Groups

# Identifiers

These are qualitative identities.

* **row_id**     : Integer = Implied column name / unique row id.
* **subject_id** : Integer = The human attached to the sensor 
* **activity**   : String  = The activity type performed when the measurements were taken

# Measurement Means

Each of these fields was averaged across their identifier columns using the original data set.  

Each measurement group is subdivided b mean value (_mean_) and standard deviation (_std_).

## Base Measurements

Two sensor types (accelerometer and gyroscope) with 3 directions each (X,Y,Z) were measured for the base measurements, from which the others are derived.

Measurements are in range [-1,1] representing the min and maximum values the sensor can read.

### Accelerometer measurements

Measures linear acceleration.

These were seperated into two signals ( Body and Gravity ) to avoid noise.

X, Y, and Z represent angular orientation; Magnitude (Mag) represents the scalar magnitude.

* tBodyAcc_mean_X
* tBodyAcc_mean_Y
* tBodyAcc_mean_Z
* tBodyAcc_std_X
* tBodyAcc_std_Y
* tBodyAcc_std_Z

* tBodyAccMag_mean
* tBodyAccMag_std

* tGravityAcc_mean_X
* tGravityAcc_mean_Y
* tGravityAcc_mean_Z
* tGravityAcc_std_X
* tGravityAcc_std_Y
* tGravityAcc_std_Z

* tGravityAccMag_mean
* tGravityAccMag_std 

### Gyroscope measurements

Measures angular acceleration.

X, Y, and Z represent angular orientation; Magnitude (Mag) represents the scalar magnitude.


* tBodyGyro_mean_X
* tBodyGyro_mean_Y
* tBodyGyro_mean_Z
* tBodyGyro_std_X
* tBodyGyro_std_Y
* tBodyGyro_std_Z

* tBodyGyroMag_mean
* tBodyGyroMag_std

## Inferred Measurements

These fields are derived from the original measurements using relevant, deterministic formulas.

The units of each of these measurements is related to their deriving formula.

### Jerk

Jerk is the derivative of acceleration; these fields were derived from their measurements with matching prefixes ( e.g. tbodyAccMag_mean matches tBodyAccJerkMag_mean )

* tBodyAccJerkMag_mean
* tBodyAccJerkMag_std

* tBodyAccJerk_mean_X
* tBodyAccJerk_mean_Y
* tBodyAccJerk_mean_Z
* tBodyAccJerk_std_X
* tBodyAccJerk_std_Y
* tBodyAccJerk_std_Z

* tBodyGyroJerkMag_mean
* tBodyGyroJerkMag_std

* tBodyGyroJerk_mean_X
* tBodyGyroJerk_mean_Y
* tBodyGyroJerk_mean_Z
* tBodyGyroJerk_std_X
* tBodyGyroJerk_std_Y
* tBodyGyroJerk_std_Z

### Fourier Transforms

These are FFT transformations of the corresponding field that starts with 't' instead of 'f'.

* fBodyAcc_mean_X
* fBodyAcc_mean_Y
* fBodyAcc_mean_Z
* fBodyAcc_std_X
* fBodyAcc_std_Y
* fBodyAcc_std_Z

* fBodyAccJerk_mean_X
* fBodyAccJerk_mean_Y
* fBodyAccJerk_mean_Z
* fBodyAccJerk_std_X
* fBodyAccJerk_std_Y
* fBodyAccJerk_std_Z

* fBodyGyro_mean_X
* fBodyGyro_mean_Y
* fBodyGyro_mean_Z
* fBodyGyro_std_X
* fBodyGyro_std_Y
* fBodyGyro_std_Z

* fBodyAccMag_mean
* fBodyAccMag_std

* fBodyBodyAccJerkMag_mean
* fBodyBodyAccJerkMag_std

* fBodyBodyGyroMag_mean
* fBodyBodyGyroMag_std

* fBodyBodyGyroJerkMag_mean
* fBodyBodyGyroJerkMag_std

