##Question
How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

## Loading in files to assign information needed as well as the ggplot2 library
library(ggplot2)
if(!exists("NEI")){NEI <- readRDS("./summarySCC_PM25.txt")}
if(!exists("SCC")){SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")}
if(!exists("NEISCC")){NEISCC <- merge(NEI, SCC, by="SCC")}

#Creating the variables needed for the plot. Looking for the on-road type in the NEI file
subsetNei <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD", ]
aggregatedTotal <- aggregate(Emissions ~ year, subsetNei, sum)

#Creating the fifth plot with the information above
png("plot5.png", width=640, height=480)
gPlot <- ggplot(aggregatedTotal, aes(factor(year), Emissions))
gPlot <- gPlot + geom_bar(stat="identity") + xlab("Year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(gPlot)
dev.off()
