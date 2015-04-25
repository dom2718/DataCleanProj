---

---
---
title: "CodeBook"
author: "Dominic Soda"
date: "April 25, 2015"
output: html_document

1. Features of the original data 


1. Original Features  
===================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

2. Features of Tidy Data 
========================

There are 81 features in the tidy data referred to as tidyset. These 79 features were obtained by selecting all features of the original data whose name indicated that the feature value was an 
average (includes mean) or was a standard deviation (includes std). The feature names were modified
in two ways, first the characters "-" and "()" were removed simplyfy reference to these varaiables, particularly with dplyr which requires unquoted variable names. Since each variable value in the 
tidyset (except subject and activity) is an average of the the means and standard deviation values of the original data we have prepended the string "avg" to each of those variable names of the tidy data tidyset. 


Here  are examples of how varaible names are interpreted 

subject         activity avgtBodyAccmeanX 
      3 WALKING_UPSTAIRS        0.2608199
      
means that for subject 3  walking upstairs the average of the time mean body acceleration 
in the X direction is 0.2608199 


  subject         activity avgfBodyAccJerkstdX
        3 WALKING_UPSTAIRS          -0.4864465
means that for subject 3  walking upstairs the average of the frequency standard deviation body acceleration jerk 
in the X direction is  -0.4864465
      
is a list of all features of tidyset. 


 [1] subject                         activity                       
 [3] avgtBodyAccmeanX                avgtBodyAccmeanY               
 [5] avgtBodyAccmeanZ                avgtBodyAccstdX                
 [7] avgtBodyAccstdY                 avgtBodyAccstdZ                
 [9] avgtGravityAccmeanX             avgtGravityAccmeanY            
[11] avgtGravityAccmeanZ             avgtGravityAccstdX             
[13] avgtGravityAccstdY              avgtGravityAccstdZ             
[15] avgtBodyAccJerkmeanX            avgtBodyAccJerkmeanY           
[17] avgtBodyAccJerkmeanZ            avgtBodyAccJerkstdX            
[19] avgtBodyAccJerkstdY             avgtBodyAccJerkstdZ            
[21] avgtBodyGyromeanX               avgtBodyGyromeanY              
[23] avgtBodyGyromeanZ               avgtBodyGyrostdX               
[25] avgtBodyGyrostdY                avgtBodyGyrostdZ               
[27] avgtBodyGyroJerkmeanX           avgtBodyGyroJerkmeanY          
[29] avgtBodyGyroJerkmeanZ           avgtBodyGyroJerkstdX           
[31] avgtBodyGyroJerkstdY            avgtBodyGyroJerkstdZ           
[33] avgtBodyAccMagmean              avgtBodyAccMagstd              
[35] avgtGravityAccMagmean           avgtGravityAccMagstd           
[37] avgtBodyAccJerkMagmean          avgtBodyAccJerkMagstd          
[39] avgtBodyGyroMagmean             avgtBodyGyroMagstd             
[41] avgtBodyGyroJerkMagmean         avgtBodyGyroJerkMagstd         
[43] avgfBodyAccmeanX                avgfBodyAccmeanY               
[45] avgfBodyAccmeanZ                avgfBodyAccstdX                
[47] avgfBodyAccstdY                 avgfBodyAccstdZ                
[49] avgfBodyAccmeanFreqX            avgfBodyAccmeanFreqY           
[51] avgfBodyAccmeanFreqZ            avgfBodyAccJerkmeanX           
[53] avgfBodyAccJerkmeanY            avgfBodyAccJerkmeanZ           
[55] avgfBodyAccJerkstdX             avgfBodyAccJerkstdY            
[57] avgfBodyAccJerkstdZ             avgfBodyAccJerkmeanFreqX       
[59] avgfBodyAccJerkmeanFreqY        avgfBodyAccJerkmeanFreqZ       
[61] avgfBodyGyromeanX               avgfBodyGyromeanY              
[63] avgfBodyGyromeanZ               avgfBodyGyrostdX               
[65] avgfBodyGyrostdY                avgfBodyGyrostdZ               
[67] avgfBodyGyromeanFreqX           avgfBodyGyromeanFreqY          
[69] avgfBodyGyromeanFreqZ           avgfBodyAccMagmean             
[71] avgfBodyAccMagstd               avgfBodyAccMagmeanFreq         
[73] avgfBodyBodyAccJerkMagmean      avgfBodyBodyAccJerkMagstd      
[75] avgfBodyBodyAccJerkMagmeanFreq  avgfBodyBodyGyroMagmean        
[77] avgfBodyBodyGyroMagstd          avgfBodyBodyGyroMagmeanFreq    
[79] avgfBodyBodyGyroJerkMagmean     avgfBodyBodyGyroJerkMagstd     
[81] avgfBodyBodyGyroJerkMagmeanFreq

