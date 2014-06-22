
features <- function() {
  if (TRUE ||  !exists("feature_table")) {
    feature_table <<- read.table('features.txt'
                                 , sep=' '
                                 , header=FALSE
                                 , row.names=1
                                 ,  col.names=c("id","category")
    );
    
    clean_name <- function(x) {
      val <- x[["category"]]
      val <- gsub("\\(\\)","",val)
      val <- gsub("-","_",val)
      val <- gsub(",","_to_",val)
      val
    }
    feature_table$category <<- apply(feature_table,1,clean_name)
  }  
  feature_table
}

activity_table <- NULL

activities <- function() {
  if (is.null(activity_table)) {
    activity_table <<- read.table('activity_labels.txt'
                                  , sep=' '
                                  , header=FALSE
                                  , row.names=1
                                  ,  col.names=c("id","activity")
    );
  }  
  activity_table
}