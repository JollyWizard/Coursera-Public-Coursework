writeTidyData <- function(data, name) {
  
}

##
## Gets a specific column by name in the dataset.
##
columnId <- function(data, name) {
  which(colnames(data)==name)  
}


##
## filters the data frame for:
##
## * subject id
## * activity name
## *... any column with mean or std in its name
## 
##
filterData <- function(data) {
  
  cols <- c(
      columnid(data, "student_id")
    , columnId(data, "activity")
    , features_filtered()
    )
  data[,cols]
}

##
## Filters the feature metatable the target measurement columns
## (mean or std columns)
##
features_filtered <- function() {
  cols <- grep("mean|std", features()$category )
}