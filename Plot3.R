#Load in data files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Group data by Year and type for Baltimore 
Baltimore.emissions.aggr <- aggregate(Emissions ~ year + type,
                                      data=Baltimore.emissions,
                                      FUN=sum)

#Load necceasry library for plotting 
library(ggplot2)

#Using ggplot, plot 
png("plot3.png", height=480, width=680)
ggplot(Baltimore.emissions.aggr, aes(x=factor(year), y=Emissions, fill=type)) +
  geom_bar(stat="identity") +
  facet_grid(. ~ type) +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emission")) +
  ggtitle(expression("PM"[2.5]*paste(" emissions in Baltimore ",
                                     "City by various source types", sep="")))
dev.off()