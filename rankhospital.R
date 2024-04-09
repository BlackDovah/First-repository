## This functions takes three arguments, two of which are the exact same as best.R, and the last is "num"
## num can be a number, or one of the two words "best", and "worst", which represents the rank of a hospital.
## The function uses this input to return the specified rank of a hospital among the other hospitals in a specific state
## with regards to it's ability to it's efficiency at treating the specified disease

rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
        out <- read.csv("outcome-of-care-measures.csv")
        states <- out$State
        ## Check that state and outcome are valid
        if (sum(state == states) > 1) {
                if (outcome == "heart attack") {
                        disease = "Heart.Attack"
                }
                else if (outcome == "heart failure") {
                        disease = "Heart.Failure"
                }
                else if (outcome == "pneumonia") {
                        disease = "Pneumonia"
                }
                else {stop ("invalid outcome")}
        }
        else {stop ("invalid state")}
        ## Return hospital name in that state with the given rank
        ## 30-day death rate
        
        ## Most of the code is identical in it's preprocessing to best.R. However, here, we choose specifically the two columns for
        ## the hospital names, and the specified disease, and then we order first by the disease values so that they are sorted
        ## from lowest to highest, then by hospital names so that they are sorted based on the values, but in alphabetical order
        ## please, note that inverting the order, will prioritize the alphabetical ordering of the data frame first.
        ## The function then evaluates your input, and if you chose best or worst as a value for num, index 1, or the index
        ## equal to the length number of rows respectively will be searched for, any integer value representing a rank, will be
        ## searched for as an index in the same manner, and the resulting hospital name is then returned.
        
        splitData <- split(out, out$State)
        specificStateData <- splitData[[state]]
        specificStateData[,11] = round(as.numeric(specificStateData[,11]), digits = 2)
        specificStateData[,17] = round(as.numeric(specificStateData[,17]), digits = 2)
        specificStateData[,23] = round(as.numeric(specificStateData[,23]), digits = 2)
        diseaseSearch <- paste("Hospital.30.Day.Death..Mortality..Rates.from.", disease, sep="")
        hospNamesByMortVals <- na.omit(specificStateData[c("Hospital.Name", diseaseSearch)])
        hospNamesByMortVals <- hospNamesByMortVals[order(hospNamesByMortVals[[diseaseSearch]], hospNamesByMortVals$Hospital.Name),]
        if (num == "best") {
                hospitalRank <- hospNamesByMortVals$Hospital.Name[1]
        }
        else if (num == "worst") {
                hospitalRank <- hospNamesByMortVals$Hospital.Name[length(hospNamesByMortVals$Hospital.Name)]
        }
        else {hospitalRank <- hospNamesByMortVals$Hospital.Name[num]}
        return(hospitalRank)
}
