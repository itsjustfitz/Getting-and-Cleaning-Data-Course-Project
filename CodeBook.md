
## Getting and Cleaning Data Course Project - **CodeBook File**

### The purpose of this **Code Book** is to provide summary details about original study design and the original raw data archive, and to describe in detail the final tidy dataset derived from it, including variable names, variable descriptions, and units of measurement.

### Original Study Design
#### This summary information comes from the study's archive [website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and the raw data archive's "README.txt" and "features_info.txt" files:

##### The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on their waist. Using its embedded accelerometer and gyroscope, authors captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data. 

##### The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force was assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of 561 features was obtained by calculating variables from the time and frequency domains. 

### Raw Dataset Contents Used for Course Project
* activity_labels.txt : List of activity numbers and associated activity labels; dimensions 6x2
* features.txt        : List of calculated feature numbers and names; dimensions 561x2
* subject_test.txt    : Unique identifier of the subject (1 to 30) who performed the activity for each window sample in test group; dimensions 2947x1
* y_test.txt          : Listing of activity number performed by subjects in test group; dimensions 2947x1
* X_test.txt          : Columns containing the 561 calculated features in test group; dimensions 2947x561
* subject_train.txt   : Unique identifier of the subject (1 to 30) who performed the activity for each window sample in training group; dimensions 7352x1
* y_train.txt         : Listing of activity number performed by subjects in training group; dimensions 7352x1
* X_train.txt         : Columns containing the 561 calculated features in training group; dimensions 7352x561

###### Total number of records in raw dataset is 2947 + 7352 = 10299 (test group plus training group)

##### *Per the dataset authors' request, the following citation is provided for the raw data in the archive:*
##### *Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.* 

### Steps to Create the Tidy Dataset
#### Using the **run_analysis.R** script, the 561 features were reduced to 66 features for this tidy dataset using the criterion that the feature names in the features.txt raw data file included either "mean()" or "std()" as part of their names. These names were then altered to be more consistent with tidy variable names and to be more descriptive in nature. Next, all test and training data were merged into one dataset (dimensions 10299x68). Finally, because there were still multiple rows of measurements per activity for each subject, the dataset was grouped by subject ID and activity, and column means were calculated across the 66 features. 

#### The resulting tidy dataset **tidy_data.txt** has no duplicate columns, there is only one measure per column, variable names are reasonably tidy and descriptive, and there is only one measurement for each activity per subject (30 subjects with 6 activities; dimensions 180x68).

##### NOTE: The final tidy dataset "tidy_data.txt" can be read in with the following R code: read.table("tidy_data.txt", header = TRUE). Columns are space delimited.

### Tidy Dataset Variable Names and Descriptions

#### NOTES:
* Variable names beginning with "time" indicates signal measurement is in the time domain.
* Variable names beginning with "freq" indicates signal measurement is in the frequency domain.
* Variable names including "Acc" indicate acceleration measurements taken using the phone's accelerometer.
* Variable names including "Gyro" indicate angular velocity measurements taken using the phone's gyroscope.
* Body Acceleration variables are derived by subtracting gravity from total acceration as measured.
* Variables measured using the phone's accelerometer are in standard gravity units (g's; meters/sec^2).
* Variables using the phone's gyroscope are in radians per second (rad/sec).
* All 66 feature variables are normalized and bounded within the range -1 to +1.
* Variable names and descriptions below are listed in order of their position in the tidy_data.txt file.

#### **subjectID**
##### Unique identifier for study participant: Range = 1 to 30
#### **Activity**
#####    Physical activity of study subject measured by the phone's accelerometer and gyroscope.
######      LAYING
######      SITTING
######      STANDING
######      WALKING
######      WALKING_DOWNSTAIRS
######      WALKING_UPSTAIRS

#### **TIME DOMAIN VARIABLES:**

#### **timeBodyAccMeanX**
##### Mean of the Body Acceleration signal means on the X Axis
#### **timeBodyAccMeanY**
##### Mean of the Body Acceleration signal means on the Y Axis
#### **timeBodyAccMeanZ**
##### Mean of the Body Acceleration signal means on the Z Axis       
#### **timeBodyAccStdX**
##### Mean of the Body Acceleration signal Standard Deviation means on the X Axis      
#### **timeBodyAccStdY**
##### Mean of the Body Acceleration signal Standard Deviation means on the Y Axis       
#### **timeBodyAccStdZ**
##### Mean of the Body Acceleration signal Standard Deviation means on the Z Axis        
#### **timeGravityAccMeanX**
##### Mean of the Gravity Acceleration signal means on the X Axis   
#### **timeGravityAccMeanY**
##### Mean of the Gravity Acceleration signal means on the Y Axis   
#### **timeGravityAccMeanZ**
##### Mean of the Gravity Acceleration signal means on the Z Axis  
#### **timeGravityAccStdX**
##### Mean of the Gravity Acceleration signal Standard Deviation means on the X Axis  
#### **timeGravityAccStdY**
##### Mean of the Gravity Acceleration signal Standard Deviation means on the Y Axis  
#### **timeGravityAccStdZ**
##### Mean of the Gravity Acceleration signal Standard Deviation means on the Z Axis
#### **timeBodyAccJerkMeanX**
##### Mean of the Jerk of the Body Acceleration signal means on the X Axis  
#### **timeBodyAccJerkMeanY**
##### Mean of the Jerk of the Body Acceleration signal means on the Y Axis     
#### **timeBodyAccJerkMeanZ**
##### Mean of the Jerk of the Body Acceleration signal means on the Z Axis    
#### **timeBodyAccJerkStdX**
##### Mean of the Jerk of the Body Acceleration signal Standard Deviation means on the X Axis   
#### **timeBodyAccJerkStdY**
##### Mean of the Jerk of the Body Acceleration signal Standard Deviation means on the Y Axis   
#### **timeBodyAccJerkStdZ**
##### Mean of the Jerk of the Body Acceleration signal Standard Deviation means on the Z Axis  
#### **timeBodyGyroMeanX**
##### Mean of the Body angular velocity signal means on the X Axis    
#### **timeBodyGyroMeanY**
##### Mean of the Body angular velocity signal means on the Y Axis     
#### **timeBodyGyroMeanZ**
##### Mean of the Body angular velocity signal means on the Z Axis    
#### **timeBodyGyroStdX**
##### Mean of the Body angular velocity signal Standard Deviation means on the X Axis  
#### **timeBodyGyroStdY**
##### Mean of the Body angular velocity signal Standard Deviation means on the Y Axis  
#### **timeBodyGyroStdZ**
##### Mean of the Body angular velocity signal Standard Deviation means on the Z Axis  
#### **timeBodyGyroJerkMeanX**
##### Mean of the Jerk of the Body angular velocity signal means on the X Axis 
#### **timeBodyGyroJerkMeanY**
##### Mean of the Jerk of the Body angular velocity signal means on the Y Axis 
#### **timeBodyGyroJerkMeanZ**
##### Mean of the Jerk of the Body angular velocity signal means on the Z Axis
#### **timeBodyGyroJerkStdX**
##### Mean of the Jerk of the Body angular velocity signal Standard Deviation means on the X Axis
#### **timeBodyGyroJerkStdY**
##### Mean of the Jerk of the Body angular velocity signal Standard Deviation means on the Y Axis  
#### **timeBodyGyroJerkStdZ**
##### Mean of the Jerk of the Body angular velocity signal Standard Deviation means on the Z Axis 
#### **timeBodyAccMagMean**
##### Mean of the Body Acceleration signal Magnitude means      
#### **timeBodyAccMagStd**
##### Mean of the Body Acceleration signal Magnitude Standard Deviation means     
#### **timeGravityAccMagMean**
##### Mean of the Gravity Acceleration signal Magnitude means
#### **timeGravityAccMagStd**
##### Mean of the Gravity Acceleration signal Magnitude Standard Deviation means 
#### **timeBodyAccJerkMagMean**
##### Mean of the Jerk of the Body Acceleration signal Magnitude means 
#### **timeBodyAccJerkMagStd**
##### Mean of the Jerk of the Body Acceleration signal Magnitude Standard Deviation means
#### **timeBodyGyroMagMean**
##### Mean of the Body angular velocity signal Magnitude means 
#### **timeBodyGyroMagStd**
##### Mean of the Body angular velocity signal Magnitude Standard Deviation means 
#### **timeBodyGyroJerkMagMean**
##### Mean of the Jerk of the Body angular velocity Magnitude means
#### **timeBodyGyroJerkMagStd**
##### Mean of the Jerk of the Body angular velocity Magnitude Standard Deviation means

#### **FREQUENCY DOMAIN VARIABLES:**

#### **freqBodyAccMeanX**
##### Mean of the Body Acceleration signal means on the X Axis
#### **freqBodyAccMeanY**
##### Mean of the Body Acceleration signal means on the Y Axis
#### **freqBodyAccMeanZ**
##### Mean of the Body Acceleration signal means on the Z Axis
### #**freqBodyAccStdX**
##### Mean of the Body Acceleration signal Standard Deviation means on the X Axis 
#### **freqBodyAccStdY**
##### Mean of the Body Acceleration signal Standard Deviation means on the Y Axis 
#### **freqBodyAccStdZ**
##### Mean of the Body Acceleration signal Standard Deviation means on the Z Axis 
#### **freqBodyAccJerkMeanX**
##### Mean of the Jerk of the Body Acceleration signal means on the X axis 
#### **freqBodyAccJerkMeanY**
##### Mean of the Jerk of the Body Acceleration signal means on the Y axis 
#### **freqBodyAccJerkMeanZ**
##### Mean of the Jerk of the Body Acceleration signal means on the Z axis 
#### **freqBodyAccJerkStdX**
##### Mean of the Jerk of the Body Acceleration signal Standard Deviation means on the X axis
#### **freqBodyAccJerkStdY**
##### Mean of the Jerk of the Body Acceleration signal Standard Deviation means on the Y axis
#### **freqBodyAccJerkStdZ**
##### Mean of the Jerk of the Body Acceleration signal Standard Deviation means on the Z axis
#### **freqBodyGyroMeanX**
##### Mean of the Body angular velocity signal means on the X Axis 
#### **freqBodyGyroMeanY**
##### Mean of the Body angular velocity signal means on the Y Axis 
#### **freqBodyGyroMeanZ**
##### Mean of the Body angular velocity signal means on the Z Axis 
#### **freqBodyGyroStdX**
##### Mean of the Body angular velocity signal Standard Deviation means on the X Axis
#### **freqBodyGyroStdY**
##### Mean of the Body angular velocity signal Standard Deviation means on the Y Axis
#### **freqBodyGyroStdZ**
##### Mean of the Body angular velocity signal Standard Deviation means on the Z Axis
#### **freqBodyAccMagMean**
##### Mean of the Body Acceleration signal Magnitude means
#### **freqBodyAccMagStd**
##### Mean of the Body Acceleration signal Magnitude Standard Deviation means  
#### **freqBodyAccJerkMagMean**
##### Mean of the Jerk of the Body Acceleration signal Magnitude means 
#### **freqBodyAccJerkMagStd**
##### Mean of the Jerk of the Body Acceleration signal Magnitude Standard Deviation means 
#### **freqBodyGyroMagMean**
##### Mean of the Body angular velocity signal Magnitude means
#### **freqBodyGyroMagStd**
##### Mean of the Body angular velocity signal Magnitude Standard Deviation means
#### **freqBodyGyroJerkMagMean**
##### Mean of the Jerk of the Body angular velocity signal Magnitude means
#### **freqBodyGyroJerkMagStd**
##### Mean of the Jerk of the Body angular velocity signal Magnitude Standard Deviation means



