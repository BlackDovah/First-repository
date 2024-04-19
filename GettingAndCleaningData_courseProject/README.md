---
title: "README.md"
author: "Samuel Aboelkhir"
date: "2024-04-16"
---

This is a description of the methods used to tidy the project's provided data, and generate the final tidy set, conveniently named tidy_set.txt.

This file will also contain a breakdown of the accompanying codebook that contains a description of how, and why the variables were created, and the transformations needed to obtain them.

First, the dataset contains 81 variables, which are an activities variable, a subjects variable, and 79 data columns which are all the means, and standard deviations obtained from the data set, being 46 mean columns, and 33 standard deviation columns in that order in the data set.

The activities in the activity column was obtained from the "activity_labels.txt" file were the activities are numbered 1 to 6, and were then used along side the "y_test.txt" and "y_training.txt" files which contain the the same numbers (1 to 6) to substitute the numbers with the actual activity names.

The activities are : 

1 walking
2 walkingUpstairs
3 walkingDownstairs
4 sitting
5 standing
6 laying

For the 79 data columns, from observing the provided data sets (both x_test.txt and x_train.txt) I realized that 2947 and 7352 test respectively were performed, and from each, 561 measurements were obtained, which are described in the features.txt and features_info.txt files. When read using read.table, they were stored in a data frame object as 561 columns, and 2947 or 7352 rows depending on the data set.

Each column represented one of the 561 measurements, which included the means and standard deviations required by the project, and that directed my approach when it came to subsetting the data, as will be shown in the code spinets in the codebook.

The feature names were descriptive, and I decided to keep them as is, although with a little bit of tidying, such as removing the underscores and their numbers, which were kept at first while extracting them from their files.

All the variables are presented in the tidy set as the activities first, then the subjects, then the means, and finally the standard deviations, with their same order that's in the features.txt file, although all the means are grouped together, and the the STDs.

Keeping the same feature names also means that they can still be cross referenced with the features_info file for more information on what each variable refers to, although they are still very telling if you read the course project's files to understand the type of experiment that was being conducted first.

````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````

- The codebook :

As for the codebook, it follows the same order as the run_analysis.R script, showing what was done at each step, and why.

The code snipets are not in the same order as in the script however, as the code ran on the training set was separated from the one ran on the test set before they were combined, but I grouped the training and test codes together to show both versions at each step, so just keep in mind, that to recreate the script, you would add the training code from each step in one chunk, and the test code after.

The codebook starts by showing the libraries used, then structure function's output of for the final data set "summarizedSet" showing all 81 variables from the final data set in order, as well as the type of each variable and the dimentions of the set.

As previously explained, the codebook then retraces the steps in the script, starting with reading in all the data as step 1, then describes the creation of each variable in order, starting with :

```````````````````````````````````````
The subjects :

The activities :

The data variables :

The data sets :

The summarized set :
```````````````````````````````````````

All the uneeded variables are then removed at the end, leaving only the tidy set called summarizedSet

The tidy set itself if read as a text file, will show all the variable names at the top, and then the 181 rows of the final set, with the relevant activity name at the begining of each row.

Both the codebook and this readme file will also end in the session info from R (please, note that there are more packages loaded than what was used in this project).

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