setwd("/Users/dominicsoda1/Documents/data science/getcleandata/proj/UCI HAR Dataset")
library(dplyr)
library(data.table)
activity <- tbl_df(read.table("activity_labels.txt"))
activity <- rename(activity,activitynum=V1,activitylabel=V2)

# Get the list of feature column numbers and names
allFeatures <-tbl_df(read.table("features.txt"))
# Get the column numbers of those features which are averages or standard deviations
targetFeatures<-filter(allFeatures, V1 %in% grep("*mean*", allFeatures$V2) | V1 %in% grep("*std*", allFeatures$V2))
targetFeatures =rename(targetFeatures, featurenum =V1,featurename=V2)
    ## CHOOSE THE VARIABLES CONTAINING mean AND std FROM THE TEST SET AND ATTACH  subject 
    ## AND activity VARIABLES TO THE test set 
    ## RESULT IS CALLED targettestset

alltestset <- tbl_df(read.table("test/X_test.txt"))
# Restrict to those variables that are involved with mean and standard deviation (std)
targettestset <- select(alltestset,targetFeatures$featurenum)
# assign meaningful names to the variables
setnames(targettestset,old = names(targettestset), new = sapply(targetFeatures$featurename,toString))
# Subject numbers associated with the rows of the testing set
testsubject <- tbl_df(read.table("test/subject_test.txt"))
# name the variable appropriately
testsubject=rename(testsubject, subject=V1)
# Activity numbers associated with the rows of the testing set
testactivity <- tbl_df(read.table("test/y_test.txt"))
# name the variable appropriately
testactivity <- rename(testactivity, activitynum=V1)
# attach the subject numbeer and activity number to the target  testing set
targettestset = cbind(testsubject,testactivity,targettestset)

    ## CHOOSE THE VARIABLES CONTAINING mean AND std FROM THE TRAINING SET AND ATTACH  subject 
    ## AND activity VARIABLES TO THE test set 
    ## RESULT IS CALLED targettrainset

alltrainset <- tbl_df(read.table("train/X_train.txt"))
# Restrict to those variables that are involved with mean and standard deviation (std)
targettrainset <- select(alltrainset,targetFeatures$featurenum)
# assign meaningful names to the variables
setnames(targettrainset,old = names(targettrainset), new = sapply(targetFeatures$featurename,toString))
# Subject numbers associated with the rows of the training set
trainsubject <- tbl_df(read.table("train/subject_train.txt"))
# name the variable appropriately
trainsubject=rename(trainsubject, subject=V1)
# Activity numbers associated with the rows of the training set
trainactivity <- tbl_df(read.table("train/y_train.txt"))
# name the variable appropriately
trainactivity <- rename(trainactivity, activitynum=V1)
# attach the subject numbeer and activity number to the target  training set
targettrainset = cbind(trainsubject,trainactivity,targettrainset)

## COMBINE THE target train and test sets to form targetset
targetset = rbind(targettrainset,targettestset)
## Attach label names to the activities
targetset = merge(activity,targetset)
## remove - and () from variable names to allow use of non-quoted variable names in summarise
setnames(targetset,old = names(targetset), new = gsub("\\(\\)","",gsub("-","",names(targetset))))

grp_sub_act= group_by(targetset,subject,activitylabel)
## Generates the group averages for each variable and each sibject activity pair
tidyset = summarise_each(grp_sub_act,funs(mean))
## Ungroup the table to allow easy sorting with the 
tidyset=ungroup(tidyset)
## remove superflous column
tidyset$activitynum<-NULL
## cleam up the variable name
tidyset = rename(tidyset, activiy=activitylabel)
## Make the variable names relect the meaning all values are averages 
## so prepend "avg" on each varaiable name
setnames(tidyset,old = names(tidyset), new = c("subject","activity",paste0("avg",names(tidyset)[3:81])))
