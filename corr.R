corr <- function(directory, threshold = 0) {
        mainDir = getwd()
        if (getwd() != "/home/blackdovah/Work and Education/Python39/Bioinformatics/GenomicDataScienceSpecialization/RStuff/specdata"){ 
                setwd(directory)
        }
        corelations = c()
        for (i in dir()) {
                if (sum(complete.cases(read.csv(i))) > threshold) {
                        corelations = c(corelations, cor(read.csv(i)[["sulfate"]], read.csv(i)[["nitrate"]], use= "complete.obs"))
                }
        }
        setwd(mainDir)
        return(corelations)
}