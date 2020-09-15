# Course3ProjectR
"Getting and Cleaning Data" course project, part of the "Data Science: Foundations using R" specialization on Coursera

## Table of Contents
- [Objective](https://github.com/kartike1998/Course3ProjectR/blob/master/README.md#Objective)
- [Data](https://github.com/kartike1998/Course3ProjectR/blob/master/README.md#Data)
- [Preparation](https://github.com/kartike1998/Course3ProjectR/blob/master/README.md#Preparation)
- [Analysis](https://github.com/kartike1998/Course3ProjectR/blob/master/README.md#Analysis)
- [Results](https://github.com/kartike1998/Course3ProjectR/blob/master/README.md#Results)
- [References](https://github.com/kartike1998/Course3ProjectR/blob/master/README.md#References)

## Objective
This project was given as an assignment in week 4 of the Course "Getting and Cleaning Data". The objective of the project is to clean a messy dataset, analyze it and extract some inferences. The R script 'run_analysis.R' performs these tasks. It imports the raw data, cleans it and carries out transformations to produce a tidy dataset with the required calculations and their results.  
  
The problem statement for the assignment is:
> You should create one R script called run_analysis.R that does the following.
> 1. Merges the training and the test sets to create one data set.
> 2. Extracts only the measurements on the mean and standard deviation for each measurement.
> 3. Uses descriptive activity names to name the activities in the data set
> 4. Appropriately labels the data set with descriptive variable names.
> 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Data
The data are available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
  
The README.txt for the raw dataset is included in the folder "UCI HAR Dataset", along with the data files. It contains a comprehensive and elaborate description of all the files in the dataset, the method of collection of the raw data, and the various calculations performed on it to create the dataset.  
  
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
  
### Brief outline
30 subjects were asked to perform 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone on their bodies. The smartphone was used to capture 3-axial linear acceleration and 3-axial angular velocity during these activities. The obtained dataset was randomly split into two sets, training and test data, containing 70% and 30% of the volunteers' records respectively.
  
### Data used
The following files from the 'UCI HAR dataset' are required for the analysis:
- 'README.txt'
- 'features.txt' - contains a list of all 561 features making up the columns of the X_test and X_train data sets
- 'activity_labels.txt' - gives the activity name for each label in y_test and y_train
- 'X_train.txt' - [7352 x 561] training dataset containing the observations for the 561-feature vector
- 'y_train.txt' - [7352 x 1] has activity labels for each record in X_train data
- 'subject_train.txt' - [7352 x 1] gives subject who performed the activity for each record in X_train data
- 'X_test.txt' - [2947 x 561] training dataset containing the observations for the 561-feature vector
- 'y_test.txt' - [2947 x 1] has activity labels for each record in X_test data
- 'subject_test.txt' - [2947 x 1] gives subject who performed the activity for each record in X_test data

## Preparation
Before beginning with the analysis, ensure that the following are in order for 'run_analysis.R' to work correctly:
1. The 'UCI HAR Dataset' folder is available in the working directory for 'run_analysis.R' (ideally the same directory which contains 'run_analysis.R')
2. The folder contains the following files in the given structure:
	- UCI HAR Dataset/
		- UCI HAR Dataset/train/
			- UCI HAR Dataset/train/X_train.txt
			- UCI HAR Dataset/train/y_train.txt
			- UCI HAR Dataset/train/subject_train.txt
		- UCI HAR Dataset/test/
			- UCI HAR Dataset/test/X_test.txt
			- UCI HAR Dataset/test/y_test.txt
			- UCI HAR Dataset/test/subject_test.txt
		- UCI HAR Dataset/features.txt

## Analysis
The analysis is performed by the script 'run_analysis.R'. R should be installed in the machine on which the script is run. Optionally, RStudio may be installed to increase ease of use through its graphical interface.

### Setting up the environment
1. Start an R session in the system.
2. Set working directory to the directory containing 'run_analysis.R'. 'UCI HAR Dataset' should also be preferably located in this directory.
	> Use the `setwd(path)` command to set the working directory, where path is the system path to the desired directory.  
	> Hint: Use `getwd()` to get the current working directory.
3. In the R session, install (if not installed already) and load the following packages:
	- plyr
	- dplyr
	> The R code for installing the packages is:  
	> `install.packages("plyr")`  
	> `install.packages("dplyr")`  
	
	> The R code for loading the packages into the session is:  
	> `library(plyr)`  
	> `library(dplyr)`  
	> *Note: plyr must be loaded before dplyr*  
	> Hint: Use `sessionInfo()` to see all packages attached to the current session.

### Performing the analysis
Once the environment is set up, run the script 'run_analysis.R'.
> Use `source(path)` where path is the system path to 'run_analysis.R'

'run_analysis.R' carries out the required tasks in 5 steps:
1. First, it imports the training and test datasets along with the subject and activity labels files from 'UCI HAR Dataset' folder into R, and merges them to create a single complete dataset with dimensions [10299 x 563], called `fullData`.
2. Then, it creates a new data frame `tidyData` from the complete dataset of the previous step which will be cleaned to produce a tidy data set. Subsequently, it replaces the activity labels in the second column of `tidyData` with descriptive activity names (taken from activity_labels.txt) to make the data easier to understand.
3. Next, the program adds variable names to the columns in the tidy data set from step \2. All except two of these are programmatically obtained from features.txt and used as is to preserve referenceability. The headers for the first two columns are specified manually (as they are not present in features.txt)
4. In this step, the script extracts only the columns containing measurements on the mean and standard deviation from `tidyData` (as asked in the assignment), and copies them into a new dataset called `tidyDataFiltered` with dimensions [10299 x 68].
5. Finally, the program creates an independent tidy dataset called `avgData` from `tidyDataFiltered` as instructed. This dataset contains the average of each variable from `tidyDataFiltered` grouped by Subject and Activity, and has the dimensions [180 x 68]. The script also updates the variable names in `avgData` accordingly.  
  
A detailed description of the R methods and functions used for these processes can be found in the inline comments in 'run_analysis.R'.

## Results
The script 'run_analysis.R' creates three tidy datasets in the R environment:
	- `tidyData` [10299 x 563]
	- `tidyDataFiltered` [10299 x 68]
	- `avgData` [180 x 68]
Each of these can be printed to the console, written to the disk and/or analysed in another software as desired. For example, `avgData` was written to the disk and submitted to Coursera for the course assignment.
> Use `write.table(avgData, "avgData.txt", row.names = F)` to save avgData to the working directory as a table in .txt format.

'Codebook.md' is also included in this project. It contains a description of all the variables and statistical information about the datasets. Refer to it for more details.

## References
1. Lectures and notes from "Getting and Cleaning Data" course, part of the "Data Science: Foundations using R" specialization, offered by Johns Hopkins University on Coursera
2. Wickham, H. (2014). Tidy Data. Journal of Statistical Software, 59(10), 1 - 23. doi:http://dx.doi.org/10.18637/jss.v059.i10
3. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
4. www.markdownguide.org