## Objective:
##
##  Across the United States, how have emissions from coal 
##  combustion-related sources changed from 1999-2008?
##
plot4 <- function() {
  
  plotData <- getPlotData();
  
  library(ggplot2)
  plot <- qplot(  data = plotData
        , x=year
        , y=Emissions
        , geom="point"
        , main="Emmissions per Year (Coal Combustion)"
        )
  print(plot)
}

getPlotData <- function() {
  if (exists("plot4data") ) {
    print("loading cached data")
    plot4data
  }
  else loadPlotData()
}

loadPlotData <- function() {
  print("caluclating plot data");
  
  # filter data set to values for plot
  indexes <- which(summaries()$year %in% c(1999,2002,2005,2008))
  filtered <- summaries()[indexes,]
  
  
  #get SCC codes "comb" and "coal"
  combustionCodes <- classifications() [
    grep("comb.*coal",classifications()$Short.Name, value=F, ignore.case=T) 
  ,]
  #filter scc codes in data
  filtered <- filtered[ filtered$SCC %in% combustionCodes$SCC ,];
  
  #transform to aggregate table
  r <- aggregate( c(filtered$Emissions)
                  , by=list(  year=filtered$year)
                  , FUN=sum
  )
  
  #update aggregate table columns
  colnames(r)[length(colnames(r))] <- "Emissions"
  
  #store data in global cache for faster script reuse
  plot4data <<- r
  
  r
}

##
## Calls plot3() in a png graphics device
##
plot4png <- function() {
  png('plot4.png', 800,480)
  plot4();
  dev.off();
}

## live graph the plot when script is loaded
plot4()