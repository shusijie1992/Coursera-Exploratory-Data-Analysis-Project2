#Read Data into R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Calculate sum of emissions per year in whole United States
agg <- aggregate(Emissions ~ year, data = NEI, FUN = sum)

#Plot the result of sum of emissions on the basis of years
plot(agg$year, agg$Emissions, type = "l", xlab = "Year", ylab = "PM2.5 Emissions in tons", main = "United States PM2.5 Pollution")

#Save the plot as .png file
dev.copy(device = png, file = "plot1.png", width = 480, height = 480)
dev.off()
