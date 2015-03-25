
plot4 <- function() {
  
  #data parsing/caching in separate file
  source("data.access.r")
  data <- getAssignmentData()
  
  par(mfrow=c(2,2))
  with(data,{  
    #set grid panel dimensions
    
    
    #Draw Graphs:
    
    source("plot2.r");  plot2()
    
    plot(DateTime, Voltage, type="l")
    
    source("plot3.r");  plot3()
    
    plot(DateTime, Global_reactive_power, type="l")
  })
  par(mfrow=c(1,1))
}

plot4png <- function() {
  png(filename="plot4.png",width=480,height=480)
  plot4()
  dev.off()
}
