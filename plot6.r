## Objective:
##
##  Compare emissions from motor vehicle sources
##  in Baltimore City with emissions from motor 
##  vehicle sources in Los Angeles County,
##  California (fips == "06037"). 
## 
## Which city has seen greater changes over time 
## in motor vehicle emissions?

plot6 <- function() {
  getPlotData()
  
  library(ggplot2)
6
  plot <- qplot(x=year, y=emissions, data=plot6data
                , main="Vehicle Emissions"
                , geom="point"
                , facets=. ~ city
  )
  print(plot)
}

getPlotData <- function() {
  if (exists("plot6data") ) {
    print("loading cached data")
    plot6data
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
       filtered$type=="ON-ROAD" 
       &  filtered$fips %in% c("24510","06037")
    ,]
  
  #transform to aggregate table
  r <- aggregate( c(filtered$Emissions)
                  , by=list(  year=filtered$year
                           ,  fips=filtered$fips
                           )
                  , FUN=sum
  )
  
  #update aggregate table columns
  colnames(r)[length(colnames(r))] <- "emissions"
  
  
  # index by city
  r[r$fips=="24510","city"] <- "Baltimore"
  r[r$fips=="06037","city"] <- "LA"
  r$city <- as.factor(r$city)
    
  #store data in global cache for faster script reuse
  plot6data <<- r
  
  r
}

##
## Calls plot6() in a png graphics device
##
plot6png <- function() {
  png('plot6.png', 800,480)
  plot6();
  dev.off();
}

## live graph the plot when script is loaded
plot6()