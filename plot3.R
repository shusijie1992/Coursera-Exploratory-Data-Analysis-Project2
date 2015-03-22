#Read Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Calculate sum of emissions per year in Baltimore
agg <- aggregate(Emissions ~ year * type, data = NEI[NEI$fips == "24510",], FUN = sum)

#Plot the result of sum of emissions on the basis of years by ggplot package
library(ggplot2)
qplot(data = agg, x = agg$year, y = agg$Emissions, facets = .~type, geom = c("line"), main = "PM2.5 Emissions in Baltimore", xlab = "Year", ylab = "Emissions in tons")

#Save the plot as .png file
dev.copy(device = png, file = "plot3.png", width = 480, height = 480)
dev.off()
