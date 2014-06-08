#
# I prepared a filtered file, which only has the relevant data
# to quicken the parse time.  The data format is the same, just less rows.
#
assignmentDataFile  <- "household_power_consumption_filtered.txt"

#
# This is cache for the parsed assignment data
#
assignmentDataCache <- NULL

#
# This is the entry point for assignment data access.
# It caches the response for later calls.
#
getAssignmentData <- function() {
  if (is.null(assignmentDataCache)) {
    assignmentDataCache <<- parseAssignmentData()
  }
  assignmentDataCache 
}

#
# This is the function that actually parses the data.
# It filters the results date/time format before returning.
#
parseAssignmentData <- function() {
  print(paste("READING FILE | ",assignmentDataFile))
  r <- read.csv(assignmentDataFile, sep=";", quote="")
  r <- filterDateFormats(r)
  r
}

#
# This function converts the date value (to filter data)
# and creates a timestamp field (for graphing)
#
filterDateFormats <- function(data, lower, upper) {
  #convert table data to dates
  data$Date <- as.Date(data$Date, format="%d/%m/%Y")
  
  #add timestamp column
  data$DateTime <- as.POSIXct(paste(data$Date,data$Time))
  
  #filter for date range
  data <- (data[data$Date < filterDateUpper && data$Date >= filterDateLower,])
  
  data
}