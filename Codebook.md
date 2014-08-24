## Codebook 

### tidy.txt Data Set

### Introduction
The raw data used for this exercise is located at the UCI Machine Learning Repository. The data pertains to a study on human activity recognition using smartphones. See http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones for full details. 

### Data processing
For the purposes of our particular exercise, two main core sets of data of the original raw data were used, each pertaining to training and testing activities. Both sets have the same number of variables but differ on the number of observations (as 70% of them are related to testing). For each of these subsets, we also found separate data files for both activity (6 in total) and subjects (30). 

Out of the 561 types or measurements, we only cared about those that were either means or presented standard deviations. A total of 79 measurements were thus identified and selected. Names for measurements were slightly changed by dropping any "-" "()", and the word "mean". Standard deviation abbreviations in measurement names ("std") were replaced by a single "s". 

The two sets of data, testing and training, were then merged into one single file, including subject IDs and activity types.

Data was then manipulated to create a narrow tidy set with the means for all of the 79 types of measurements for every activity and subject.

### Codebook
The tidy data set has 4 variables:

**Activity**

- Name of Activity
- Character 18 max.
- Values:

  - Laying
  - Sitting
  - Standing
  - Walking
  - Walking_downstairs 
  - Walking_upstairs

**Subject**

- Subject identification
- Integer 
- Values:
			
  - 1 to 30

**Measure**

- Measurement type
- Character 22 max.
- Values:

  - tBodyAccX 
  - tBodyAccY 
  - tBodyAccZ 
  - tBodyAccsX 
  - tBodyAccsY 
  - tBodyAccsZ 
  - tGravityAccX 
  - tGravityAccY 
  - tGravityAccZ 
  - tGravityAccsX 
  - tGravityAccsY 
  - tGravityAccsZ 
  - tBodyAccJerkX 
  - tBodyAccJerkY 
  - tBodyAccJerkZ 
  - tBodyAccJerksX 
  - tBodyAccJerksY 
  - tBodyAccJerksZ 
  - tBodyGyroX 
  - tBodyGyroY 
  - tBodyGyroZ 
  - tBodyGyrosX 
  - tBodyGyrosY 
  - tBodyGyrosZ 
  - tBodyGyroJerkX 
  - tBodyGyroJerkY 
  - tBodyGyroJerkZ 
  - tBodyGyroJerksX 
  - tBodyGyroJerksY 
  - tBodyGyroJerksZ 
  - tBodyAccMag 
  - tBodyAccMags 
  - tGravityAccMag 
  - tGravityAccMags 
  - tBodyAccJerkMag 
  - tBodyAccJerkMags 
  - tBodyGyroMag 
  - tBodyGyroMags 
  - tBodyGyroJerkMag 
  - tBodyGyroJerkMags 
  - fBodyAccX 
  - fBodyAccY 
  - fBodyAccZ 
  - fBodyAccsX 
  - fBodyAccsY 
  - fBodyAccsZ 
  - fBodyAccFreqX 
  - fBodyAccFreqY 
  - fBodyAccFreqZ 
  - fBodyAccJerkX 
  - fBodyAccJerkY 
  - fBodyAccJerkZ 
  - fBodyAccJerksX 
  - fBodyAccJerksY 
  - fBodyAccJerksZ 
  - fBodyAccJerkFreqX 
  - fBodyAccJerkFreqY 
  - fBodyAccJerkFreqZ 
  - fBodyGyroX 
  - fBodyGyroY 
  - fBodyGyroZ 
  - fBodyGyrosX 
  - fBodyGyrosY 
  - fBodyGyrosZ 
  - fBodyGyroFreqX 
  - fBodyGyroFreqY 
  - fBodyGyroFreqZ 
  - fBodyAccMag 
  - fBodyAccMags 
  - fBodyAccMagFreq 
  - fBodyBodyAccJerkMag 
  - fBodyBodyAccJerkMags 
  - fBodyBodyAccJerkMagFreq 
  - fBodyBodyGyroMag 
  - fBodyBodyGyroMags 
  - fBodyBodyGyroMagFreq 
  - fBodyBodyGyroJerkMag 
  - fBodyBodyGyroJerkMags 
  - fBodyBodyGyroJerkMagFreq

See original documentation in file attribute_info.txt in home folder of raw data for explanation of the above. Measurement names have been simplified as explained above and in the accompanying README.md file.

The entries here are distinct as they constitute the average of the original measures by activity and by subject (all already being either means or standard deviation measurements).

**Mean**

- Mean of measurement
- Float
- Values:

  - Ranging between -1 and 1

