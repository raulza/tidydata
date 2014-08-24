### Introduction
This file describes the process by which a series of raw data files were converted into a simple narrow tidy data. 

The source data as provided in the course materials, downloaded into a local folder and unzipped. The final folder structure is a bit complex but the process only made use of basic data files.

The enclosed R script, **run_analysis.R** runs as is from the main folder of the unzipped data. Make sure you check this is the case before attempting to running it. The R script also contains comments that documents each of the steps taken to create the tidy data set.

### Script description

#### Reading data
The script first reads basic information for the two datasets that will be used later on. First is reads the codes and names for the 6 activities that the data contains. It then reads the names of the variables that are common to the sets to be used (561 variables) and which I will use to define the R *names()* of the key datasets.

At this point, I made the assumption that all variable names containing the strings *"mean"* or *"std"* were the ones that we needed for the exercise. This yielded a total of 79 variables.

For the exercise, we needed to read data for the testing and training components of the original UCI study which are located in separate subfolders.

The script first reads the data for the test component which includes three relevant files: one for activities, one for subjects involved and one with the actual variable measurements. There are a total of 2,947 observations in these three sets which are then put together into one single data frame (via cbind), after dropping all the variables that are not needed for our purposes. The resulting data frame thus has 81 variables (79 measurements plus subjectID plus activity number) and 2,947 observations.

The same procedure is applied to the training component which yielded a data frame of 81 variables and 7,352 observations.

From the original documentation provided with the raw data we know that subjects that participated in the testing part of the exercise did not take part in the training, and vice-versa. This means that we do not need to merge the data but rather append one to the other which we can do using rbind. Note also that we have the same number of columns and variable names for the two sets. The "merged" data set has 10,299 observations.

#### Using activity description
The next step it to use the activity descriptions instead of the activity numbers. For this purpose I created a new variable called *activity* and then run a for loop to recode it, using the data frame created before that holds the activity information. 

#### Cleaning variable names
Raw variable names are rather longish and contain *"-"* and *"( )"* in their names. Also, all either contain strings *"mean"* or *"std"*. I eliminated all -, () and "mean", and replaced "std" with "s" as in the end our tidy data set will be providing the means for all measurements, regardless of their actual definitions. I then dropped variable *activityID* which contains the activity number and which is not needed in our tidy data set.

#### Cleaning up the data
Next I used both reshape2 and plyr libraries to create a narrow tidy set. I first melted the data by activity and data and then used the split data frame ddply function to generate means for every subject and activity.

This yielded a narrow tidy data set with 4 variables (see codebook for details) and 14,220 observations. In the end, we have 30 subjects who furnish 79 measurements for every one of the 6 activities (30x79x6 = 14,220 obs.) and for each record we have the mean of the measurements taken in each case.

#### Saving the data
The tidy data was then saved in the current folder with the name **tidy.txt** in text format.


