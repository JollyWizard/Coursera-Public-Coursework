
plot1 <- function() {
  
  #data parsing/caching in separate file
  source("data.access.r")
  data <- getAssignmentData()
  
  #generate histogram
  hist(data[,"Global_active_power"]
       , col="red"
       , main="Global Active Power"
       , xlab="Global Active Power (kilowatts)"
       )
}

plot1png <- function() {
  png(filename="plot1.png",width=480,height=480)
  plot1()
  dev.off()
}