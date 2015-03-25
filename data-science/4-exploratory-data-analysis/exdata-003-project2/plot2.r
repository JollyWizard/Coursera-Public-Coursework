## Objective:
##
##  Have total emissions from PM2.5 decreased in the 
##  Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
##
##  Use the base plotting system to make a plot answering this question.
##

plot2 <- function() {
  
  #
  # data set is only loaded 
  # if flag from script is not present
  #
  if (!exists("project.data.access")) {
    print("loading datasets");
    source('project.datasets.r');  
  }
  
  # filter data set to values for plot
  indexes <- which(summaries()$year %in% c(1999,2002,2005,2008))
  
  filtered <- summaries()[indexes,]
  filtered <- filtered[filtered$fips == "24510", ]
  
  
  #generate table with plot data
  plotTable <- tapply(filtered$Emissions, filtered$year, sum)
  
  #plot
  barplot(plotTable, main="Emissions per Year (Baltimore, MD)")
}

##
## Calls plot1() in a png graphics device
##
plot2png <- function() {
  png('plot2.png', 480,480)
  plot2();
  dev.off();
}

## live graph the plot when script is loaded
plot2()