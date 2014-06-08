
plot2 <- function() {
  
  #data parsing/caching in separate file
  source("data.access.r")
  data <- getAssignmentData()
    
  with(data,
    {
      formula <- Global_active_power ~ DateTime
      
      #layout 
      plot(formula, type="n", ylab="Global Active Power (kilowatts)", xlab="")
      
      #plot lines
      lines(formula)
    }
  )
}

plot2png <- function() {
  png(filename="plot2.png",width=480,height=480)
  plot2()
  dev.off()
}