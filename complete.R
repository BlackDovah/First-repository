complete <- function(directory, id = 1:332) {
        mainDir = getwd()
        if (getwd() != "/home/blackdovah/Work and Education/Python39/Bioinformatics/GenomicDataScienceSpecialization/RStuff/specdata"){ 
                setwd(directory)
        }
        x = data.frame(id = seq_along(id), nobs = seq_along(id), row.names = seq_along(id))
        counter = 0
        for (i in dir()[id]) {
                counter = counter + 1
                x[counter,1] = read.csv(i)$ID[1]
                x[counter,2] = sum(complete.cases(read.csv(i)))
        }
        setwd(mainDir)
        return(x)
}