## This function takes only outcome and num as arguments as it searches through all the states for the hospital with the chosen
## rank for a specific disease, and gathers then returns all the answers in alphabetical order in a data frame.

rankall <- function(outcome, num = "best") {
        ## Read outcome data
        out <- read.csv("outcome-of-care-measures.csv")
        ## Check that state and outcome are valid
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
        ## For each state, find the hospital of the given rank
        ## The following code creates the initial data frame where the data will be stored, then search term for the chosen disease
        ## then picks only the relevant columns from the dataset, splits the data by state, then loops over every state, to rank 
        ## all the hospitals after clearing out NA values.
        ## The data frame is then filled with hospitals of the relevant rank chosen in the input, and states without a hospital
        ## of said rank, will return an NA value in the data frame.
        
        hospitalRankPerState <- data.frame(hospital = c(1:length(unique(out$State))), state = unique(out$State), row.names = unique(out$State))
        diseaseSearch <- paste("Hospital.30.Day.Death..Mortality..Rates.from.", disease, sep="")
        chosenColumns <- out[c(2, 7, 11, 17, 23)]
        splitData <- split(chosenColumns, chosenColumns$State)
        for (i in splitData) {
                i[[diseaseSearch]] <- round(as.numeric(i[[diseaseSearch]]), digits = 2)
                hospNamesByMortVals <- na.omit(i[c("Hospital.Name", diseaseSearch)])
                hospNamesByMortVals <- hospNamesByMortVals[order(hospNamesByMortVals[[diseaseSearch]], hospNamesByMortVals$Hospital.Name),]
                if (num == "best") {
                        hospitalRank <- hospNamesByMortVals$Hospital.Name[1]
                }
                else if (num == "worst") {
                        hospitalRank <- hospNamesByMortVals$Hospital.Name[length(hospNamesByMortVals$Hospital.Name)]
                }
                else {hospitalRank <- hospNamesByMortVals$Hospital.Name[num]}
                hospitalRankPerState[i$State[1], 1] <- hospitalRank
        }
        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
        ## The data frame is sorted alphabetically first by state to prioritize it, then by hospital name.
        
        hospitalRankPerState <- hospitalRankPerState[order(hospitalRankPerState$state, hospitalRankPerState$hospital),]
        return(hospitalRankPerState)
}