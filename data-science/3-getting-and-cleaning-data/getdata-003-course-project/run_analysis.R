
source('project_meta_tables.r')
source('project_datasets.r')
source('project_output.r')

run_analysis <- function () {  
  combo <- getCombinedData();
  
  agg_data  <- combo[,features_filtered()]
  agg_table <- aggregate(agg_data
                         ,by=list(subject=combo$subject_id, activity=combo$activity)
                         ,data=combo
                         ,FUN=mean
                         )
  write.csv(agg_table, file="getdata-004-project-tidy-data.csv")
}

getCombinedData <- function() {
  if(exists("combinedData")) combinedData
  else loadCombinedData()
}

loadCombinedData <- function() {
  print("Loading datasets")
  test_data <- read_folder("test")
  train_data <- read_folder("train")
  
  print("Combining Datasets")
  
  combinedData <<- rbind(test_data, train_data)
}


##
## Filters the feature metatable the target measurement columns
## (mean or std columns)
##
features_filtered <- function() {
  cols <- grep("mean\\(\\)|std", features()$category )
}

run_analysis()