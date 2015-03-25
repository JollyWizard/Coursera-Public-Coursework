
plot3 <- function() {
  
  #data parsing/caching in separate file
  source("data.access.r")
  data <- getAssignmentData()
  
  with(data,{  
    # Setup the formulas for each line
    formula1 <- Sub_metering_1 ~ DateTime
    formula2 <- Sub_metering_2 ~ DateTime
    formula3 <- Sub_metering_3 ~ DateTime
    
    #layout graph
    plot(formula1, type="n", ylab="Energy sub metering", xlab="")
    
    #plot lines
    lines(formula1, col="black")
    lines(formula2, col="red")
    lines(formula3, col="blue")
    
    #draw legend
    legend("topright"
           , legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
           , lty=c(1,1,1)
           , col=c("black", "red", "blue")
           )
  })
}

plot3png <- function() {
  png(filename="plot3.png",width=480,height=480)
  plot3()
  dev.off()
}
