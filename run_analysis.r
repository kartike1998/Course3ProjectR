# Refer to the README for a comprehensive workflow and the rationale behind the steps detailed 
# below, along with the logic for carrying out these steps in the given order.
# 
# STEP 1:
# To begin with the analysis, we need to import the raw data into the R environment. We begin by 
# reading the datasets into separate data frames for each data file. The data frames are named 
# after the names of the files.
# 
# We are using read.table because the datasets are formatted as text files. Note that the files must
# be located in the same folder (relative to the working directory) as given in the path below for 
# the script to work. Default values of all other parameters are used.

xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")

# As described in the data README.txt, xTest contains the values for all variables in the 561 
# feature vector. yTest contains the activity labels corresponding to each record in the xTest data 
# frame. subjectTest contains the labels for the subject who performed the activity.
# 
# We now combine these into a single data frame named testData using the cbind() function.

testData <- cbind(subjectTest, yTest, xTest)

# In a similar manner as above, we import the training datasets too. The data frames are once again 
# named after the names of the files.
# 
# The file paths should be carefully noted as before.

xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")

# These objects contain the training data which is formatted and arranged just like the test data as 
# described in the README.txt.
# We now bind these objects together into one single data frame named trainData.

trainData <- cbind(subjectTrain, yTrain, xTrain)

# Finally, we merge these two datasets together into one called fullData using the rbind() function.

fullData <- rbind(trainData, testData)

# STEP 2:
# This step involves tidying the data. We copy fullData into a new dataset called tidyData, 
# which we will clean in the following steps.
 
tidyData <- fullData

# We want to use descriptive activity names to label the activities, which are listed as numbers in 
# the second column of the tidyData data frame.
# 
# We use factor() to convert the second column of the data frame to a factor variable. We use the
# labels parameter to set the labels as stipulated in activity_labels.txt.

tidyData[[2]] <- factor(tidyData[[2]], labels = c("Walking", "Walking Upstairs", 
                                                  "Walking Downstairs", "Sitting", "Standing", 
                                                  "Laying"))

# We also remove the raw data sets from the memory to make our script memory efficient.

remove(xTest, yTest, subjectTest, testData, xTrain, yTrain, subjectTrain, trainData, fullData)

# STEP 3:
# Now, we need to add descriptive variable names for the columns in tidyData. Each of 
# these corresponds to one feature of the 561-feature vector, as given in features.txt.
# 
# We import the contents of features.txt into a data frame called features.

features <- read.table("UCI HAR Dataset/features.txt")

# The variable names we need are in the second column of this data frame. We extract these to a 
# character vector named featureVector.

featureVector <- features[[2]]

# Then, we concatenate this featureVector with column names for the first and second column to 
# create a vector of variable names, which we set as the column headers using colnames().

variableNames <- c("Subject", "Activity", featureVector)
colnames(tidyData) <- variableNames

# STEP 4:
# In the next step of our analysis, we extract only the measurements on the mean and standard 
# deviation for each measurement.
# 
# First, we create an index vector of the required columns from the variableNames vector. The grep 
# function provides a simple way to do this using regular expressions. We also include column 1 
# and 2 for the subject and activity name respectively in indexVector.

indexVector <- c(1, 2, grep("-mean\\()|-std\\()", variableNames))

# Lastly, we subset tidyData using indexVector and copy the required data into a new object called 
# tidyDataFiltered.

tidyDataFiltered <- tidyData[, indexVector]

# STEP 5:
# In the final step, we create a new tidy data frame from tidyDataFiltered which is called avgData. 
# This contains the average of each variable (from tidyDataFiltered) for each activity and each 
# subject.
# 
# We use ddply in conjunction with summarise_at to split tidyDataFiltered by subject and activity 
# and apply mean on the desired columns (using a negative index to exclude the first two columns).

avgData <- ddply(tidyDataFiltered, .(Subject, Activity), summarise_at, .vars = -(1:2), .funs = mean)

# avgData can now be written to the disk or printed to the console as desired.