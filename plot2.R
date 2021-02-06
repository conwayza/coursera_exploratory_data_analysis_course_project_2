##Question 
Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips == "24510") from 1999 to 2008?
Use the base plotting system to make a plot answering this question.

##Loading the information needed to assign a subset and a variable
if(!exists("NEI")){NEI <- readRDS("./summarySCC_PM25.txt")}
if(!exists("SCC")){SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")}

##Creating a subset and a variable to be later plotted
subsetNEI <- NEI[NEI$fips=="24510", ]
aggregatedTotal <- aggregate(Emissions ~ year, subsetNEI, sum)

##Plotting the information in the second plot
png('plot2.png')
barplot(height=aggregatedTotal$Emissions, names.arg=aggregatedTotal$year, xlab="Years", ylab=expression('Total PM'[2.5]*' Emission'), main=expression('Total PM'[2.5]*' in the Baltimore City, MD Emissions at various years'))
dev.off()
