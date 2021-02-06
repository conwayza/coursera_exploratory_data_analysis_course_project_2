#Question
Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

## Loading in files 

if(!exists("NEI")){NEI <- readRDS("./summarySCC_PM25.txt")}
if(!exists("SCC")){SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")}

##Assigning data to aggregatedTotal
aggregatedTotal <- aggregate(Emissions ~ year, NEI, sum)

##Creating the plot for the aggregatedTotal variable
png('plot1.png')
barplot(height=aggregatedTotal$Emissions, names.arg = aggregatedTotal$year, xlab="Years", ylab=expression('total PM'[2.5]*' Emission'), main=expression('Total PM'[2.5]*'Emissions at Random Years'))
dev.off()
