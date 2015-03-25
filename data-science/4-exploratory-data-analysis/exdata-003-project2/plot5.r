## Objective:
##
##  How have emissions from motor vehicle sources 
##  changed from 1999-2008 in Baltimore City? 

plot5 <- function() {
  getPlotData()
  
  library(ggplot2)
  
  plot <- qplot(x=year, y=emissions, data=plot5data
        , main="Baltimore Vehicle Emissions"
        , geom="point"
        )
  print(plot)
}

getPlotData <- function() {
  if (exists("plot5data") ) {
    print("loading cached data")
    plot5data
  }
  else loadPlotData()
}

loadPlotData <- function() {
  print("caluclating plot data");
  
  # filter data set to values for plot
  indexes <- which(summaries()$year %in% c(1999,2002,2005,2008))
  filtered <- summaries()[indexes,]
  
  #filter for Baltimore Vehicle data
  filtered <- filtered[
    filtered$type=="ON-ROAD" & filtered$fips=="24510"
  ,]
      
  #transform to aggregate table
  r <- aggregate( c(filtered$Emissions)
                  , by=list(  year=filtered$year)
                  , FUN=sum
  )
  
  #update aggregate table columns
  colnames(r)[length(colnames(r))] <- "emissions"
  
  #store data in global cache for faster script reuse
  plot5data <<- r
  
  r
}

##
## Calls plot3() in a png graphics device
##
plot5png <- function() {
  png('plot5.png', 800,480)
  plot5();
  dev.off();
}

## live graph the plot when script is loaded
plot5()