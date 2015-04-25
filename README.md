# DataCleanProj
Data Cleaning Project
---
title: "README"
author: "Dominic Soda"
date: "April 25, 2015"





The script run_analysis.R. Performs the following steps

1. Attach subject and activity feature to each data set
Each data set has measured  variables, i.e., 561 features. The associated subjects and activities  for 
each observation are in separate data sets. The subject and activity features are attached to each of the training and test data, this descriptive activity names to name the activities in the data set.

2. Find all measured features which are means or standard deviations. 


3. Extracts only the measurements on the mean and standard deviation 
for each measurement for each data set. The Inertial data files are where not 
used since the measured features already include Gyro mean and standard deviations.
These extractions are done separately for each of the training and test set. 
These are called targetttrainset and targettestset. 

4. Label the data set with descriptive variable names. 
5. Merge the training and the test sets to create one data set.
   This set is called targetset
   
6. Create at tidy data set called tidyset.
   We first group the data by subject and activity. Then we compute the mean of each variable.
   We then ungroup the data to allow the user to more easily arrang the data according to needs.





