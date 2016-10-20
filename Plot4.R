#Load in data files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Find the SEC code for coal combustion fuels
#Comb through SEC data for all ros that have "Coal" or "Fuel  comb" in it
is.combustion.coal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)

#Apply data to true/false statement for coal
combustion.coal.sources <- SCC[is.combustion.coal,]

#Take out all emsission for coal related sources 
emissions <- NEI[(NEI$SCC %in% combustion.coal.sources$SCC), ]

#Group all data by year 
emissions.by.year <- aggregate(Emissions ~ year, data=emissions, FUN=sum)

#Plot all data 
library(ggplot2)
png("plot4.png")
ggplot(emissions.by.year, aes(x=factor(year), y=Emissions)) +
  geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emissions")) +
  ggtitle("Emissions from coal combustion-related sources")
dev.off()