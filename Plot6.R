#Load in data files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset Baltimore data 
vehiclesBaltimoreNEI <- vehiclesNEI[vehiclesNEI$fips == 24510,]
#Rename data 
vehiclesBaltimoreNEI$city <- "Baltimore City"

#Subset Los Angles
vehiclesLANEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]
#Rename data 
vehiclesLANEI$city <- "Los Angeles County"

#Combine both datasets 
bothNEI <- rbind(vehiclesBaltimoreNEI,vehiclesLANEI)

#Load proper library 
library(ggplot2)

#Plot 
png("plot6.png")
ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))
dev.off()

