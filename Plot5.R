#Load in data files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Using the SCC data find all SEC codes that have Vehicle in the name 
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)

#Extract the code from the SCC Data 
vehiclesSCC <- SCC[vehicles,]$SCC

#Subset NEI data for all vehicles 
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

#Next subset Baltimore city data 
baltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips==24510,]

#Plot the data 
png("plot5.png")
ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))
dev.off()
