
source('project_meta_tables.r')
source('project_datasets.r')
source('project_output.r')

run_analysis <- function () {  
  combo <- getCombinedData();
  ## I need to write the csv 
  
  agg_data  <- combo[,features_filtered()]
  agg_table <- aggregate(agg_data
                         ,by=list(subject=combo$subject_id, activity=combo$activity)
                         ,data=combo
                         ,FUN=mean
                         )
  print(head(agg_table))
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

run_analysis()