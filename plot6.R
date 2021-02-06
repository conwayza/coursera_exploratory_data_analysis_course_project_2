##Question
Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle 
sources in Los Angeles County, California (\color{red}{\verb|fips == "06037"|}fips == "06037").
Which city has seen greater changes over time in motor vehicle emissions?

##Loading the information needed to assign a subset and a variable as well as merging the two sets of data for this question
library(ggplot2)
if(!exists("NEI")){NEI <- readRDS("./summarySCC_PM25.txt")}
if(!exists("SCC")){SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")}
if(!exists("NEISCC")){NEISCC <- merge(NEI, SCC, by="SCC")}

##Creating a complex subset for fips and type on-road
subsetNei <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD", ]
aggregatedTotalYearFips <- aggregate(Emissions ~ year + fips, subsetNei, sum)
aggregatedTotalYearFips$fips[aggregatedTotalYearFips$fips=="24510"] <- "Baltimore, MD"
aggregatedTotalYearFips$fips[aggregatedTotalYearFips$fips=="06037"] <- "Los Angeles, CA"

##Plotting the subset with the information collected above
png("plot6.png", width=1040, height=480)
gPlot <- ggplot(aggregatedTotalYearFips, aes(factor(year), Emissions))
gPlot <- gPlot + facet_grid(. ~ fips)
gPlot <- gPlot + geom_bar(stat="identity") + xlab("Year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions from motor vehicles (type=ON-ROAD) in Baltimore City, MD (fips="24510") vc Los Angeles, CA (fips = "06037") from 1999-2008')
print(gPlot)
dev.off()
