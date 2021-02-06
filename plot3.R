##Question 
Of the four types of sources indicated by the \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) variable, which of these four sources 
have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? 
Use the ggplot2 plotting system to make a plot answer this question.

## Loading in files to assign information needed as well as the ggplot2 library
library(ggplot2)
if(!exists("NEI")){NEI <- readRDS("./summarySCC_PM25.txt")}
if(!exists("SCC")){SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")}


##Creating a subset and a variable to be later plotted
subsetNEI <- NEI[NEI$fips=="24510", ]
aggregatedTotal <- aggregate(Emissions ~ year + type, subsetNEI, sum)

##Creating the plot with the information gathered above. Creating variables for the ggplotting 
png("plot3.png", width=640, height=480)
gPlot <- ggplot(aggregatedTotal, aes(year, Emissions))
gPlot <- gPlot + geom_line() + xlab("Year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions in Baltimore City, MD (fips=="24510") from 1999 to 2008')
print(gPlot)
dev.off()
