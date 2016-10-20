#Set working directory 
setwd("\\\\cscphome/HOME1/CJOHNSO2/Redir-cjohnso2/Documents/EDA week 4 Project")

#Load in data files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#First we calculate the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
total.emissions <- aggregate(Emissions ~ year, NEI, sum)

#Use the base plot system to do a box plot of total emission data
png('plot1.png')
barplot(height=total.emissions$Emissions, names.arg=total.emissions$year,
        xlab="years", ylab=expression('total PM'[2]*' emission'),
        main=expression('Total PM'[2]*' emissions at various years'))
dev.off()