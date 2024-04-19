---
title: "CodeBook.md"
author: "Samuel Aboelkhir"
date: "2024-04-16"
---

The following libraries were used in the script :
```
library(dplyr)
library(tidyr)
library(stringr)
library(data.table)
```
Summary of the 81 variables in order : (the output of str(summarizedSet))
```
gropd_df [180 × 81] (S3: grouped_df/tbl_df/tbl/data.frame)
 $ subjects                       : int [1:180] 1 1 1 1 1 1 2 2 2 2 ...
 $ activities                     : chr [1:180] "laying" "sitting" "standing" "walking" ...
 $ tBodyAcc-mean()-X              : num [1:180] 0.222 0.261 0.279 0.277 0.289 ...
 $ tBodyAcc-mean()-Y              : num [1:180] -0.04051 -0.00131 -0.01614 -0.01738 -0.00992 ...
 $ tBodyAcc-mean()-Z              : num [1:180] -0.113 -0.105 -0.111 -0.111 -0.108 ...
 $ tGravityAcc-mean()-X           : num [1:180] -0.249 0.832 0.943 0.935 0.932 ...
 $ tGravityAcc-mean()-Y           : num [1:180] 0.706 0.204 -0.273 -0.282 -0.267 ...
 $ tGravityAcc-mean()-Z           : num [1:180] 0.4458 0.332 0.0135 -0.0681 -0.0621 ...
 $ tBodyAccJerk-mean()-X          : num [1:180] 0.0811 0.0775 0.0754 0.074 0.0542 ...
 $ tBodyAccJerk-mean()-Y          : num [1:180] 0.003838 -0.000619 0.007976 0.028272 0.02965 ...
 $ tBodyAccJerk-mean()-Z          : num [1:180] 0.01083 -0.00337 -0.00369 -0.00417 -0.01097 ...
 $ tBodyGyro-mean()-X             : num [1:180] -0.0166 -0.0454 -0.024 -0.0418 -0.0351 ...
 $ tBodyGyro-mean()-Y             : num [1:180] -0.0645 -0.0919 -0.0594 -0.0695 -0.0909 ...
 $ tBodyGyro-mean()-Z             : num [1:180] 0.1487 0.0629 0.0748 0.0849 0.0901 ...
 $ tBodyGyroJerk-mean()-X         : num [1:180] -0.1073 -0.0937 -0.0996 -0.09 -0.074 ...
 $ tBodyGyroJerk-mean()-Y         : num [1:180] -0.0415 -0.0402 -0.0441 -0.0398 -0.044 ...
 $ tBodyGyroJerk-mean()-Z         : num [1:180] -0.0741 -0.0467 -0.049 -0.0461 -0.027 ...
 $ tBodyAccMag-mean()             : num [1:180] -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
 $ tGravityAccMag-mean()          : num [1:180] -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
 $ tBodyAccJerkMag-mean()         : num [1:180] -0.9544 -0.9874 -0.9924 -0.1414 -0.0894 ...
 $ tBodyGyroMag-mean()            : num [1:180] -0.8748 -0.9309 -0.9765 -0.161 -0.0757 ...
 $ tBodyGyroJerkMag-mean()        : num [1:180] -0.963 -0.992 -0.995 -0.299 -0.295 ...
 $ fBodyAcc-mean()-X              : num [1:180] -0.9391 -0.9796 -0.9952 -0.2028 0.0382 ...
 $ fBodyAcc-mean()-Y              : num [1:180] -0.86707 -0.94408 -0.97707 0.08971 0.00155 ...
 $ fBodyAcc-mean()-Z              : num [1:180] -0.883 -0.959 -0.985 -0.332 -0.226 ...
 $ fBodyAcc-meanFreq()-X          : num [1:180] -0.1588 -0.0495 0.0865 -0.2075 -0.3074 ...
 $ fBodyAcc-meanFreq()-Y          : num [1:180] 0.0975 0.0759 0.1175 0.1131 0.0632 ...
 $ fBodyAcc-meanFreq()-Z          : num [1:180] 0.0894 0.2388 0.2449 0.0497 0.2943 ...
 $ fBodyAccJerk-mean()-X          : num [1:180] -0.9571 -0.9866 -0.9946 -0.1705 -0.0277 ...
 $ fBodyAccJerk-mean()-Y          : num [1:180] -0.9225 -0.9816 -0.9854 -0.0352 -0.1287 ...
 $ fBodyAccJerk-mean()-Z          : num [1:180] -0.948 -0.986 -0.991 -0.469 -0.288 ...
 $ fBodyAccJerk-meanFreq()-X      : num [1:180] 0.132 0.257 0.314 -0.209 -0.253 ...
 $ fBodyAccJerk-meanFreq()-Y      : num [1:180] 0.0245 0.0475 0.0392 -0.3862 -0.3376 ...
 $ fBodyAccJerk-meanFreq()-Z      : num [1:180] 0.02439 0.09239 0.13858 -0.18553 0.00937 ...
 $ fBodyGyro-mean()-X             : num [1:180] -0.85 -0.976 -0.986 -0.339 -0.352 ...
 $ fBodyGyro-mean()-Y             : num [1:180] -0.9522 -0.9758 -0.989 -0.1031 -0.0557 ...
 $ fBodyGyro-mean()-Z             : num [1:180] -0.9093 -0.9513 -0.9808 -0.2559 -0.0319 ...
 $ fBodyGyro-meanFreq()-X         : num [1:180] -0.00355 0.18915 -0.12029 0.01478 -0.10045 ...
 $ fBodyGyro-meanFreq()-Y         : num [1:180] -0.0915 0.0631 -0.0447 -0.0658 0.0826 ...
 $ fBodyGyro-meanFreq()-Z         : num [1:180] 0.010458 -0.029784 0.100608 0.000773 -0.075676 ...
 $ fBodyAccMag-mean()             : num [1:180] -0.8618 -0.9478 -0.9854 -0.1286 0.0966 ...
 $ fBodyAccMag-meanFreq()         : num [1:180] 0.0864 0.2367 0.2846 0.1906 0.1192 ...
 $ fBodyBodyAccJerkMag-mean()     : num [1:180] -0.9333 -0.9853 -0.9925 -0.0571 0.0262 ...
 $ fBodyBodyAccJerkMag-meanFreq() : num [1:180] 0.2664 0.3519 0.4222 0.0938 0.0765 ...
 $ fBodyBodyGyroMag-mean()        : num [1:180] -0.862 -0.958 -0.985 -0.199 -0.186 ...
 $ fBodyBodyGyroMag-meanFreq()    : num [1:180] -0.139775 -0.000262 -0.028606 0.268844 0.349614 ...
 $ fBodyBodyGyroJerkMag-mean()    : num [1:180] -0.942 -0.99 -0.995 -0.319 -0.282 ...
 $ fBodyBodyGyroJerkMag-meanFreq(): num [1:180] 0.176 0.185 0.334 0.191 0.19 ...
 $ tBodyAcc-std()-X               : num [1:180] -0.928 -0.977 -0.996 -0.284 0.03 ...
 $ tBodyAcc-std()-Y               : num [1:180] -0.8368 -0.9226 -0.9732 0.1145 -0.0319 ...
 $ tBodyAcc-std()-Z               : num [1:180] -0.826 -0.94 -0.98 -0.26 -0.23 ...
 $ tGravityAcc-std()-X            : num [1:180] -0.897 -0.968 -0.994 -0.977 -0.951 ...
 $ tGravityAcc-std()-Y            : num [1:180] -0.908 -0.936 -0.981 -0.971 -0.937 ...
 $ tGravityAcc-std()-Z            : num [1:180] -0.852 -0.949 -0.976 -0.948 -0.896 ...
 $ tBodyAccJerk-std()-X           : num [1:180] -0.9585 -0.9864 -0.9946 -0.1136 -0.0123 ...
 $ tBodyAccJerk-std()-Y           : num [1:180] -0.924 -0.981 -0.986 0.067 -0.102 ...
 $ tBodyAccJerk-std()-Z           : num [1:180] -0.955 -0.988 -0.992 -0.503 -0.346 ...
 $ tBodyGyro-std()-X              : num [1:180] -0.874 -0.977 -0.987 -0.474 -0.458 ...
 $ tBodyGyro-std()-Y              : num [1:180] -0.9511 -0.9665 -0.9877 -0.0546 -0.1263 ...
 $ tBodyGyro-std()-Z              : num [1:180] -0.908 -0.941 -0.981 -0.344 -0.125 ...
 $ tBodyGyroJerk-std()-X          : num [1:180] -0.919 -0.992 -0.993 -0.207 -0.487 ...
 $ tBodyGyroJerk-std()-Y          : num [1:180] -0.968 -0.99 -0.995 -0.304 -0.239 ...
 $ tBodyGyroJerk-std()-Z          : num [1:180] -0.958 -0.988 -0.992 -0.404 -0.269 ...
 $ tBodyAccMag-std()              : num [1:180] -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
 $ tGravityAccMag-std()           : num [1:180] -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
 $ tBodyAccJerkMag-std()          : num [1:180] -0.9282 -0.9841 -0.9931 -0.0745 -0.0258 ...
 $ tBodyGyroMag-std()             : num [1:180] -0.819 -0.935 -0.979 -0.187 -0.226 ...
 $ tBodyGyroJerkMag-std()         : num [1:180] -0.936 -0.988 -0.995 -0.325 -0.307 ...
 $ fBodyAcc-std()-X               : num [1:180] -0.9244 -0.9764 -0.996 -0.3191 0.0243 ...
 $ fBodyAcc-std()-Y               : num [1:180] -0.834 -0.917 -0.972 0.056 -0.113 ...
 $ fBodyAcc-std()-Z               : num [1:180] -0.813 -0.934 -0.978 -0.28 -0.298 ...
 $ fBodyAccJerk-std()-X           : num [1:180] -0.9642 -0.9875 -0.9951 -0.1336 -0.0863 ...
 $ fBodyAccJerk-std()-Y           : num [1:180] -0.932 -0.983 -0.987 0.107 -0.135 ...
 $ fBodyAccJerk-std()-Z           : num [1:180] -0.961 -0.988 -0.992 -0.535 -0.402 ...
 $ fBodyGyro-std()-X              : num [1:180] -0.882 -0.978 -0.987 -0.517 -0.495 ...
 $ fBodyGyro-std()-Y              : num [1:180] -0.9512 -0.9623 -0.9871 -0.0335 -0.1814 ...
 $ fBodyGyro-std()-Z              : num [1:180] -0.917 -0.944 -0.982 -0.437 -0.238 ...
 $ fBodyAccMag-std()              : num [1:180] -0.798 -0.928 -0.982 -0.398 -0.187 ...
 $ fBodyBodyAccJerkMag-std()      : num [1:180] -0.922 -0.982 -0.993 -0.103 -0.104 ...
 $ fBodyBodyGyroMag-std()         : num [1:180] -0.824 -0.932 -0.978 -0.321 -0.398 ...
 $ fBodyBodyGyroJerkMag-std()     : num [1:180] -0.933 -0.987 -0.995 -0.382 -0.392 ...
 - attr(*, "groups")= tibble [30 × 2] (S3: tbl_df/tbl/data.frame)
  ..$ subjects: int [1:30] 1 2 3 4 5 6 7 8 9 10 ...
  ..$ .rows   : list<int> [1:30] 
  .. ..$ : int [1:6] 1 2 3 4 5 6
  .. ..$ : int [1:6] 7 8 9 10 11 12
  .. ..$ : int [1:6] 13 14 15 16 17 18
  .. ..$ : int [1:6] 19 20 21 22 23 24
  .. ..$ : int [1:6] 25 26 27 28 29 30
  .. ..$ : int [1:6] 31 32 33 34 35 36
  .. ..$ : int [1:6] 37 38 39 40 41 42
  .. ..$ : int [1:6] 43 44 45 46 47 48
  .. ..$ : int [1:6] 49 50 51 52 53 54
  .. ..$ : int [1:6] 55 56 57 58 59 60
  .. ..$ : int [1:6] 61 62 63 64 65 66
  .. ..$ : int [1:6] 67 68 69 70 71 72
  .. ..$ : int [1:6] 73 74 75 76 77 78
  .. ..$ : int [1:6] 79 80 81 82 83 84
  .. ..$ : int [1:6] 85 86 87 88 89 90
  .. ..$ : int [1:6] 91 92 93 94 95 96
  .. ..$ : int [1:6] 97 98 99 100 101 102
  .. ..$ : int [1:6] 103 104 105 106 107 108
  .. ..$ : int [1:6] 109 110 111 112 113 114
  .. ..$ : int [1:6] 115 116 117 118 119 120
  .. ..$ : int [1:6] 121 122 123 124 125 126
  .. ..$ : int [1:6] 127 128 129 130 131 132
  .. ..$ : int [1:6] 133 134 135 136 137 138
  .. ..$ : int [1:6] 139 140 141 142 143 144
  .. ..$ : int [1:6] 145 146 147 148 149 150
  .. ..$ : int [1:6] 151 152 153 154 155 156
  .. ..$ : int [1:6] 157 158 159 160 161 162
  .. ..$ : int [1:6] 163 164 165 166 167 168
  .. ..$ : int [1:6] 169 170 171 172 173 174
  .. ..$ : int [1:6] 175 176 177 178 179 180
  .. ..@ ptype: int(0) 
  ..- attr(*, ".drop")= logi TRUE
```
1st step (loading the data) :

- All the data was read in a single chunk of code in the script file directly from the folder provided for the assignment.
The readLines function worked best at reading in the contents of the "features.txt" file, which was then used to name the variables themselves, while the read.table function was best for everything else. Note, that only for the actual datasets, the files were read with read.table without further adjustments, in order to acquire a data frame object that has each feature represented in a single column (more on that in the "readme" file), while for the other files, a data frame was not needed, and it was more convenient to have the actual vector stored directly in the variable.
 ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
feat = readLines("UCI HAR Dataset/features.txt")
trainingset = read.table("UCI HAR Dataset/train/X_train.txt")
activitiesTrain = read.table("UCI HAR Dataset/train/y_train.txt")[[1]]
trainingsubjects = read.table("UCI HAR Dataset/train/subject_train.txt")[[1]]
testset = read.table("UCI HAR Dataset/test/X_test.txt")
activitiesTest = read.table("UCI HAR Dataset/test/y_test.txt")[[1]]
testsubjects = read.table("UCI HAR Dataset/test/subject_test.txt")[[1]]
 ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````

1) Subjects :

- The subjects column is the simplest as it doesn't require any adjustments aside from just storing it in a variable.
It represents the test subjects that participated in the experiment, numbered from 1 to 30.

 ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
 
2) Activities :

- This column represents the 6 activities done by each of the 30 test subjects.
This column required both the "y_test.txt" and "y_train.txt" files containing the numbers of each activity, alongside the "activity_labels.txt" file that has each activity numbered from 1 to 6 for the next part, where the following code was used to replace each number in the labels files which are ordered in the same order as the values obtained from them, with the actual name of the activity :

```
activitiesTrain = sapply(activitiesTrain, function(x){
        if (x == 1) {
                activitiesTrain[activitiesTrain == 1] = "walking"
        }
        else if (x == 2) {
                activitiesTrain[activitiesTrain == 2] = "walkingUpstairs"
        }
        else if (x == 3) {
                activitiesTrain[activitiesTrain == 3] = "walkingDownstairs"
        }
        else if (x == 4) {
                activitiesTrain[activitiesTrain == 4] = "sitting"
        }
        else if (x == 5) {
                activitiesTrain[activitiesTrain == 5] = "standing"
        }
        else if (x == 6) {
                activitiesTrain[activitiesTrain == 6] = "laying"
        }
})
```

- The same code was used for the "y_test.txt" file, with the name activitiesTest instead.
This code goes over each element of the activitiesTrain variable (containing the data from y_train/test.txt), checks it's value (1:6) and replaces it with the relevant activity from the activity_labels file.

 ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
 
3) The data variables :

- For the rest of the data, the data is first read as a data frame into the trainingset, and testset variables, and the "features.txt" file is used to with grep to create both the meanIndex, and stdIndex variables, which contain the indexes of any mean, and standard deviation measurements (refer to the readme for the files explanation to know how that worked).
These variables are then used to subset all the mean and std data from the trainingset and testset variables, as well as create the variables newMeanNames, and newStdNames, which are the names of the mean and std variables from the features files, which are also used to change the column names in the trainingset and testset variables.

```
meanIndex = grep("mean",feat)
stdIndex = grep("std",feat)
newMeanNames = feat[meanIndex]
newStdNames = feat[stdIndex]
```
```
trainingset = trainingset[,c(meanIndex,stdIndex)]
names(trainingset) = c(newMeanNames, newStdNames)
```
```
testset = testset[,c(meanIndex,stdIndex)]
names(testset) = c(newMeanNames, newStdNames)
```

 ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
 
4) The data sets :

- Two data sets, training, and test, are then created as data tables instead of data frames, as data tables are able to accept entire numeric vectors as data points, keeping the dimensions of the data set at 7352 X 81 and 2947 X 81 respectively, while using a data frame, will force each element from each vector to be stored separately, and will generate a row number mismatch error. The names of the columns are first set as :

```
training = data.table(activitiesTrain = activitiesTrain, trainingsubjects = trainingsubjects, trainingset = trainingset)
```

and

```
test = data.table(activitiesTest = activitiesTest, testsubjects = testsubjects, testset = testset)
```

but are then changes to 

```
names(training) = c("activities", "testsubjects", names(trainingset))
```

and

```
names(test) = c("activities", "testsubjects", names(testset))
```

- The activities column is then used as a key for both data table, as it's the only common column, to allow their merging into one set.

```
setkey(training, activities)
setkey(test, activities)
```

- The sets are then combined into one set using rbind as such :

```
completeSet = rbind(test, training)
```

as using merge caused issues with the existence of over 30k rows.

- Then the testsubjects column is renamed to just subjects :

```
completeSet = rename(completeSet, subjects = testsubjects)
```

- Variable names are then further cleaned by removing the numbers, and trimming the names :

```
names(completeSet) = gsub("^[0-9]*","",names(completeSet))
names(completeSet) = str_trim(names(completeSet))
```

and the set is arranged by the order of the subjects 1:30 :

```
completeSet = arrange(completeSet, subjects)
```

- Finally, all the uneeded variables are removed :

```
rm(test, training, testset, trainingset, activitiesTrain, activitiesTest, trainingsubjects, testsubjects,
   feat, meanIndex, stdIndex, newMeanNames, newStdNames)
 ```
 
 ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
 
 5) Summarized set :
 
-  The summarized set is then created by first grouping the completeSet by both subjects and activities :
 
 ```
 summarizedSet = group_by(completeSet, subjects, activities)
 ```
 
 and then the set is summarized by mean, to obatain the average values of every activity for every subject :
 
 ```
 summarizedSet = summarise_all(summarizedSet, mean)
 ```
 
 -The completeSet is then removed :
 
 ```
 rm(completeSet)
 ```
 ```
 > sessionInfo()
R version 4.3.3 (2024-02-29)
Platform: x86_64-pc-linux-gnu (64-bit)
Running under: Ubuntu 22.04.4 LTS

Matrix products: default
BLAS:   /usr/lib/x86_64-linux-gnu/blas/libblas.so.3.10.0 
LAPACK: /usr/lib/x86_64-linux-gnu/lapack/liblapack.so.3.10.0

locale:
 [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C               LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8     LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
 [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                  LC_ADDRESS=C               LC_TELEPHONE=C             LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       

time zone: Africa/Cairo
tzcode source: system (glibc)

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
[1] data.table_1.15.4 reshape2_1.4.4    stringr_1.5.1     tidyr_1.3.1       dplyr_1.1.4      

loaded via a namespace (and not attached):
 [1] vctrs_0.6.5       knitr_1.46        cli_3.6.2         xfun_0.43         rlang_1.1.3       stringi_1.8.3     purrr_1.0.2       generics_0.1.3    jsonlite_1.8.8   
[10] glue_1.7.0        htmltools_0.5.8.1 plyr_1.8.9        sass_0.4.9        fansi_1.0.6       rmarkdown_2.26    jquerylib_0.1.4   evaluate_0.23     tibble_3.2.1     
[19] fastmap_1.1.1     yaml_2.3.8        lifecycle_1.0.4   compiler_4.3.3    Rcpp_1.0.12       pkgconfig_2.0.3   rstudioapi_0.16.0 digest_0.6.35     R6_2.5.1         
[28] tidyselect_1.2.1  utf8_1.2.4        pillar_1.9.0      magrittr_2.0.3    bslib_0.7.0       tools_4.3.3       withr_3.0.0       cachem_1.0.8
```