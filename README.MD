
## Getting and Cleaning Data Course Project - **ReadMe File**

### The purpose of this project is to demonstrate an ability to collect, work with, and clean a data set. The goal is to prepare a tidy dataset from a more basic or raw dataset that can be used for later analysis.

### The data for this project come from a data archive at the University of California, Irvine.

#### The link to the project website is [HERE](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 
#### The link to the project's data archive is [HERE](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
#### The project website and its data archive (e.g., its own ReadMe file) both provide details regarding the study design and the nature of the raw data files.

##### Per the dataset authors' request, the following citation is provided for the raw data in the archive:
##### Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 


### The **CodeBook.md** on this repo contains relevant details about the study design, the original raw data archive, and the tidy dataset derived from it, including final variable names, descriptions, and units of measurement.

### The **run_analysis.R** file on this repo contains the R script for obtaining the raw data archive, manipulating raw data files, assigning more descriptive variable names and creating a final tidy dataset. This script is extensively notated so that reviewers can better follow the details of the analyses performed.

### The general steps taken in this R script are the following:
* 1 Download the data archive and unzip it
* 2 Read in the activity_labels and the features files
* 3 Read in the 3 test subject files (subject_test, y_test, X_test) and add column labels
* 4 Reduce the X_test columns to only those containing "mean()" or "std()" in their names
* 5 Label resulting columns more appropriately following course instructions, including removing special characters
* 6 Merge the three test subject files
* 7 REPEAT STEPS 3-6 for the three training subject files
* 8 Merge the test and training files
* 9 Replace the "Activity" column's numbers (1 thru 6) with the activity labels from the activity_labels file
* 10 Group the dataset by subject ID and Activity label, then get the mean for each of the 66 columns by subject ID and Activity
* 11 Write out the final tidy dataset

#### NOTE: the tidy dataset can be read in to R using the read.table() command with the option header = TRUE

### Is the data I submitted actually tidy?
#### The dataset at the end of step 9 above still does not meet the requirements of tidy data. As required, there are reasonably appropriate labels for columns, there is one and only one variable per column, and there are no duplicate columns. However, each study subject has multiple measures of the same activity stored in multiple rows across all of the measuement variables. To make this a tidy dataset, we group the dataset by subject ID and activity to get the column means for each subject (n = 30) and each activity (1-6). This results in 1 mean per subject per activity for each feature column (30*6 = 180 rows and 66 features).


### ADDITIONAL ACKNOWLEDGEMENTS
#### A 2014 paper on tidy data principles by Hadley Wickham in the Journal of Statistical Software can be found [HERE](https://www.jstatsoft.org/article/view/v059i10/v59i10.pdf) 
#### To complete this project, I relied heavily upon the following two supplemental sources:
##### 1 A general guide kindly shared by [David Hood](https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/)
##### 2 A visual guide kindly shared by [Luis Sandino](https://drive.google.com/file/d/0B1r70tGT37UxYzhNQWdXS19CN1U/view?usp=sharing)

