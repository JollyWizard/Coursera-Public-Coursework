## Objective:
##
##  Of the four types of sources indicated by the type 
## (point, nonpoint, onroad, nonroad) variable, which of these 
## four sources have seen decreases in emissions from 1999–2008 
## for Baltimore City? Which have seen increases in emissions 
## from 1999–2008? 
##
## Use the ggplot2 plotting system to make a plot answer this question.
##
plot3 <- function() {
  
  #generate or retrieve table with plot data
  plotTable <- getPlotData()
  
  #plot with ggplot
  library(ggplot2)
  plot <- qplot(year, Emissions, data=plot3data
                , main="Emissions per Year (by Type)"
                , geom=c("point"), facets=.~type)
  print(plot)
}

getPlotData <- function() {
  if (exists("plot3data") ) {
    print("loading cached data")
    plot3data
  }
  else loadPlotData()
}

##
## loads/generates the plot data from scratch
##
loadPlotData <- function() {  
  #
  # data set is only loaded 
  # if flag from script is not present
  #
  if (!exists("project.data.access")) {
    print("loading datasets");
    source('project.datasets.r');  
  }
  
  
  print("caluclating plot data");
  
  # filter data set to values for plot
  indexes <- which(summaries()$year %in% c(1999,2002,2005,2008))
  filtered <- summaries()[indexes,]

  #transform to aggregate table
  r <- aggregate( c(filtered$Emissions)
                  , by=list(  year=filtered$year
                           , type=filtered$type
                           )
                  , FUN=sum
                )
  
  #update aggregate table columns
  colnames(r)[3] <- "Emissions"
  
  #store data in global cache for faster script reuse
  plot3data <<- r
  
  r
}

##
## Calls plot3() in a png graphics device
##
plot3png <- function() {
  png('plot3.png', 800,480)
  plot3();
  dev.off();
}

## live graph the plot when script is loaded
plot3()