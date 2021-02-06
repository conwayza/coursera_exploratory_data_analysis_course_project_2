##Question
Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

##Loading the information needed to assign a subset and a variable as well as merging the two sets of data for this question
library(ggplot2)
if(!exists("NEI")){NEI <- readRDS("./summarySCC_PM25.txt")}
if(!exists("SCC")){SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")}
if(!exists("NEISCC")){NEISCC <- merge(NEI, SCC, by="SCC")}


#Assigning information to variables to create plots later on 
coal <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coal, ]
aggregatedTotal <- aggregate(Emissions ~ year, subsetNEISCC, sum)

#Plotting the fourth plot
png("plot4.png", width=640, height=480)
gPlot <- ggplot(aggregatedTotal, aes(factor(year), Emissions))
gplot <- gPlot + geom_bar(stat="identity") + xlab("Year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(gPlot)
dev.off()
