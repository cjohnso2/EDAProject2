#Load in data files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset all Baltimore city data 
Baltimore.emissions <- NEI[NEI$fips=="24510",]

#Then group the emission by year
Baltimore.emissions.by.year <- aggregate(Emissions ~ year, Baltimore.emissions, sum)

#Then plot the data to answer the question 
png('plot2.png')
barplot(height=Baltimore.emissions.by.year$Emissions,
        names.arg=Baltimore.emissions.by.year$year,
        xlab="years", ylab=expression('total PM'[2]*' emission'),
        main=expression('Total PM'[2]*' emissions in Baltimore City, '*
                          'Maryland at various years'))
dev.off()