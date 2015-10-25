Code book for Course Project for the course Getting and Cleaning Data. 

This code book covers the following topics: 
  1. Description of the variables and data
  2. The code and transformations of the variables if any
  3. Output from analysis
 
 
Regarding 1. 

I have used the following rules for the data:
  a. all lowercase when possible
  b. descriptive 
  c. unique
  d. contains no underscores/dots/space

I have also used full names instead of abbreviations, unfortunately this gives some 
very long features names. The data is well described in the following to files.
features_info.txt and in the readme.txt. 

Please note that:
 -Triaxial acceleration from the accelerometer (total acceleration) and the estimated   -body acceleration. The "acc" variables. 
 -Triaxial Angular velocity from the gyroscope. The "gyro"
 -A 561-feature vector with time and frequency domain variables (t and f in front of   each feature name). 
 Its activity label. 
 An identifier of the subject who carried out the experiment.
 
The datasets I have used for solving this exercise is for both train and test are:
  x_test/train (the features file)
  y_test/train (the activity file)
  subject_test/train (the subject file)

I have extracted the mean() and std() from the data set. This results in 66 (+ the subject &  activity variable ) feature variables. One can review this by executing str(tidyfinal). Description of the tidy data(tidyfinal):
  All the extracted mean() and std() are normalized to [-1,1] and thereby have no units
  Activity is a factor (walking,standing,laying etc)
  Subject is also a factor 1,,30. 

Regarding 2. 
I have made comments in the code run_analysis.R, and it follows the 5 steps that is in the assignment documentation. For solving this assignment I have used the following R functions:
  1. cbind() and rbind() for merging the datasets
  2. !duplicated for excluding redundant feature variables
  3. grep for extracting mean() & std() variables from feature set
  4. gsub for finding text and replacing in order to make descriptive names
  5. ddply for making aggregated tidy data by activity and subject and averages. Part       of the plyr package.
  6. Write.table() for writing the final tidy data set.
  
  Regarding 3. 
  
  The output of the run_analysis code is tidyfinal.txt. I have used ; as separation. 
  