## Objective:
##
##  Have total emissions from PM2.5 decreased 
##  in the United States from 1999 to 2008? 
##
##  Using the base plotting system, 
##  make a plot showing the total PM2.5 emission 
##  from all sources for each of the years 
##  1999, 2002, 2005, and 2008. 
##

plot1 <- function() {
  
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
  
  
  #generate table with plot data
  plotTable <- tapply(filtered$Emissions, filtered$year, sum)
  
  #plot
  barplot(plotTable, main="Emmissions per Year")
}

##
## Calls plot1() in a png graphics device
##
plot1png <- function() {
  png('plot1.png', 480,480)
  plot1();
  dev.off();
}

## live graph the plot when script is loaded
plot1()