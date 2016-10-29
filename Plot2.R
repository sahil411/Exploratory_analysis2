if(!exists("NEI")){
  NEI <- readRDS("C:\\Users\\winchesters\\Desktop\\coursera\\exploratory\\summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("C:\\Users\\winchesters\\Desktop\\coursera\\exploratory\\Source_Classification_Code.rds")
}
BaltimoreCity <- NEI[NEI$fips == "24510",]

DecreaseInMaryland <- aggregate(Emissions ~ year, BaltimoreCity, sum)

png("Plot2.png")

barplot(height = DecreaseInMaryland$Emissions,
        names.arg = DecreaseInMaryland$year,
        xlab = "years",
        ylab = expression("Total PM[2.5] multiply by emission"),
        main = expression("does PM[2.5] Decreased in Baltimore?"))

dev.off()
