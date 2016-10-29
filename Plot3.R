if(!exists("NEI")){
  NEI <- readRDS("C:\\Users\\winchesters\\Desktop\\coursera\\exploratory\\summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("C:\\Users\\winchesters\\Desktop\\coursera\\exploratory\\Source_Classification_Code.rds")
}

library(ggplot2)
Balti <- NEI[NEI$fips=="24510", ]

TotalByTypeandYear <- aggregate(Emissions ~ year + type, Balti, sum)



png("plot3.png", width=640, height=480)
g <- ggplot(TotalByTypeandYear, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City,from 1999 to 2008')
print(g)
dev.off()