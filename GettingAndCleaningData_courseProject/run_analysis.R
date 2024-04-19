library(dplyr)
library(tidyr)
library(stringr)
library(data.table)

feat = readLines("UCI HAR Dataset/features.txt")
trainingset = read.table("UCI HAR Dataset/train/X_train.txt")
activitiesTrain = read.table("UCI HAR Dataset/train/y_train.txt")[[1]]
trainingsubjects = read.table("UCI HAR Dataset/train/subject_train.txt")[[1]]
testset = read.table("UCI HAR Dataset/test/X_test.txt")
activitiesTest = read.table("UCI HAR Dataset/test/y_test.txt")[[1]]
testsubjects = read.table("UCI HAR Dataset/test/subject_test.txt")[[1]]

meanIndex = grep("mean",feat)
stdIndex = grep("std",feat)
newMeanNames = feat[meanIndex]
newStdNames = feat[stdIndex]

trainingset = trainingset[,c(meanIndex,stdIndex)]
names(trainingset) = c(newMeanNames, newStdNames)
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
training = data.table(activitiesTrain = activitiesTrain, trainingsubjects = trainingsubjects, trainingset = trainingset)
names(training) = c("activities", "testsubjects", names(trainingset))
setkey(training, activities)

testset = testset[,c(meanIndex,stdIndex)]
names(testset) = c(newMeanNames, newStdNames)
activitiesTest = sapply(activitiesTest, function(x){
        if (x == 1) {
                activitiesTest[activitiesTest == 1] = "walking"
        }
        else if (x == 2) {
                activitiesTest[activitiesTest == 2] = "walkingUpstairs"
        }
        else if (x == 3) {
                activitiesTest[activitiesTest == 3] = "walkingDownstairs"
        }
        else if (x == 4) {
                activitiesTest[activitiesTest == 4] = "sitting"
        }
        else if (x == 5) {
                activitiesTest[activitiesTest == 5] = "standing"
        }
        else if (x == 6) {
                activitiesTest[activitiesTest == 6] = "laying"
        }
})
test = data.table(activitiesTest = activitiesTest, testsubjects = testsubjects, testset = testset)
names(test) = c("activities", "testsubjects", names(testset))
setkey(test, activities)

completeSet = rbind(test, training)
completeSet = rename(completeSet, subjects = testsubjects)
names(completeSet) = gsub("^[0-9]*","",names(completeSet))
names(completeSet) = str_trim(names(completeSet))
completeSet = arrange(completeSet, subjects)

rm(test, training, testset, trainingset, activitiesTrain, activitiesTest, trainingsubjects, testsubjects,
   feat, meanIndex, stdIndex, newMeanNames, newStdNames)

summarizedSet = group_by(completeSet, subjects, activities)
summarizedSet = summarise_all(summarizedSet, mean)
rm(completeSet)
# write.table(summarizedSet, file = "tidy_set.txt", row.names = F)