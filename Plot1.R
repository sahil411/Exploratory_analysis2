if(!exists("NEI")){
  NEI <- readRDS("C:\\Users\\winchesters\\Desktop\\coursera\\exploratory\\summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("C:\\Users\\winchesters\\Desktop\\coursera\\exploratory\\Source_Classification_Code.rds")
}
TotalEmissionPerYear <- aggregate(Emissions ~ year, NEI,sum)

png("Plot1.png")

barplot(height = TotalEmissionPerYear$Emissions,
        names.arg = TotalEmissionPerYear$year,
        xlab = "years",
        ylab = expression("Total PM[2.5] multiply by emission"),
        main = expression("PM[2.5] in different years"))

dev.off()
