
row_limit <- -1

##
## Adds a single column file to another dataset of matching length
##
read_col <- function(data, columnFile, columnId) {
  column <- read.table(columnFile
                       , header=FALSE
                       , col.names=c(columnId)
                       , nrows=row_limit
                       , stringsAsFactors=T)
  data <- cbind(data, column)
  data;
}

##
## reads the actual data table, 
## using the category table for column names
##
read_data <- function(dataFile) {
  columnIds <- features()$category
  r <- read.table(dataFile
                  , header=FALSE
                  , sep=""
                  , quote=''
                  , fill=T
                  , nrows=row_limit
                  , col.names=columnIds);
  r
}

##
## creates a column $activity based on $activity_id
##
bind_activities <- function(data) {
  
  #add the pretty activity column
  data$activity <- apply(data, 1, function(row) { 
    activities()$activity[row["activity_id"]]
  });
  
  #return the updated reference
  data
}

##
## Applys the read and processing methods to create a single table out
## one of the dataset folders.  Filenames are based on the name of the 
## containing folder.
##
read_folder <- function(datasetId) {
  print(paste("loading dataset folder: ",datasetId))
  
  featureFile <- paste(datasetId, '/X_' ,datasetId,'.txt', sep='')
  activityFile <- paste(datasetId, '/Y_' ,datasetId, '.txt', sep='')
  subjectFile <- paste(datasetId, '/subject_', datasetId, '.txt', sep='')
  
  data <- read_data(featureFile)
  
  data <- read_col(data, activityFile, "activity_id")
  data <- bind_activities(data)
  
  data <- read_col(data, subjectFile, "subject_id")
  data$subject_id <- as.factor(data$subject_id)
  
  data
}