## This function takes as input the 2 letters abbreviation name of a state, and a desired disease, and returns the best hospital in
## the specified state at treating that disease

best <- function(state, outcome) {
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
        
        ## Return hospital name in that state with lowest 30-day death
        ## rate
        
        ## 1) In this section, the data is split into categories by state in the "splitData" variable.
        ## 2) The specific state we want is then selected in "specificStateData"
        ## 3) The 11th, 17th, and 23rd columns which corresponds to the 3 specific diseases of interest 
        ## are then converted to numeric vectors for easier removal of NA values
        ## 5) The specific name of the vector that contains the disease data in recreated in "diseaseSearch"
        ## 6) The minimum value in the desired disease's vector is found and stored
        ## 7) Hospital names are then split by the values in the disease's vector
        ## 8) The best hospital(s) is/are selected by subsetting the minimum value
        ## 9) In case of multiple best hospitals, the vector is then sorted alphabetically, and only the first result is returned
        
        splitData <- split(out, out$State)
        specificStateData <- splitData[[state]]
        specificStateData[,11] = as.numeric(specificStateData[,11])
        specificStateData[,17] = as.numeric(specificStateData[,17])
        specificStateData[,23] = as.numeric(specificStateData[,23])
        diseaseSearch <- paste("Hospital.30.Day.Death..Mortality..Rates.from.", disease, sep="")
        minDiseaseValue <- min(na.omit(as.numeric(specificStateData[[diseaseSearch]])))
        hospNamesByMortVals <- split(specificStateData$Hospital.Name, specificStateData[[diseaseSearch]])
        bestHospital <- hospNamesByMortVals[[as.character(minDiseaseValue)]]
        if (length(bestHospital > 1)) {
                sorted <- sort(bestHospital)
                return(sorted[1])
        }
}