##
## This flag indicates this script has been run in the environment
## 
project.data.access <- T

##
## the path to the arcive containing the data files.
##
dataArchive <- 'exdata_data_NEI_data.zip'

summaryFile         <- 'summarySCC_PM25.rds'
classificationFile  <- 'Source_Classification_Code.rds'

## THESE are the variables that store the datasets
summaryData         <- NULL
classificationsData <- NULL


#lazy loader function for #summaryData
summaries <- function() {
  ensureDataSets();
  summaryData;
}

#lazy loader function for #classificationData
classifications <- function() {
  ensureDataSets();
  classificationsData;
}

# makes sure both data sets are available if accessed
ensureDataSets <- function() {
  if (is.null(summaryData) || is.null(classificationsData))
    loadData()
}

# load and factor the data
loadData <- function() {
  unzip(dataArchive,overwrite=F)
  
  summaryData           <<- readRDS(summaryFile)
  classificationsData   <<- readRDS(classificationFile)
  
  conditionFields();
  
  unlink(c(summaryFile,classificationFile), force=T)
}

##
## coverts id fields to factors
##
conditionFields <- function() {
  summaryData$Pollutant <<- as.factor(summaryData$Pollutant)
  summaryData$type      <<- as.factor(summaryData$type)
  summaryData$SCC       <<- as.factor(summaryData$SCC)
  summaryData$fips      <<- as.factor(summaryData$fips)
}

## load data on script run
loadData()
print ("project datasets available");
