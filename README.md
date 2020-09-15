# Course3ProjectR
"Getting and Cleaning Data" course project, part of the Data Science using R specialization on Coursera

## Table of Contents
1. Objective
2. Preparation
3. Analysis
4. Results
5. References

## Objective
This project was given as an assignment in week 4 of the Course "Getting and Cleaning Data". The objective of the project is to clean a messy dataset, analyze it and extract some inferences. To do this, I created an R script called 'run_analysis.R' which imports the raw data, cleans it and carries out transformations to produce a tidy dataset with the required calculations and their results.

## Raw data
The README.txt for the raw dataset is included in the folder "UCI HAR Dataset", along with the data files. It contains a comprehensive and elaborate description of all the files in the dataset, the method of collection of the raw data, and the various calculations performed on it to create the dataset.  
  
### Brief outline
30 subjects were asked to perform 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone on their bodies. The smartphone was used to capture 3-axial linear acceleration and 3-axial angular velocity during these activities. The obtained dataset was randomly split into two sets, training and test data, containing 70% and 30% of the volunteers' records respectively.
  
### Data used
The following files from the dataset were used for the analysis:  
- 'README.txt'  
- 'features.txt' - contains a list of all features making up the columns of the X_test and X_train data sets
- 'activity_labels.txt' - gives the activity name for each label in y_test and y_train
- 'X_train.txt' - [7352 x 561] training dataset containing the observations for the 561-feature vector
- 'y_train.txt' - [7352 x 1] activity labels for each record in X_train data
- 'subject_train.txt' - [7352 x 1] subject who performed the activity for each record in X_train data
- 'X_test.txt' - [2947 x 561] training dataset containing the observations for the 561-feature vector
- 'y_test.txt' - [2947 x 1] activity labels for each record in X_test data
- 'subject_test.txt' - [2947 x 1] subject who performed the activity for each record in X_test data
