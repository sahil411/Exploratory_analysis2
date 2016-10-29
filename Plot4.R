if(!exists("NEI")){
  NEI <- readRDS("C:\\Users\\winchesters\\Desktop\\coursera\\exploratory\\summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("C:\\Users\\winchesters\\Desktop\\coursera\\exploratory\\Source_Classification_Code.rds")
}

if(!exists("NEISCC")){
  NEISCC <- merge(NEI, SCC, by="SCC")
}

library(ggplot2)
coal <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coal, ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)



png("plot4.png", width=640, height=480)
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("years") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Emissions from coal from 1999 to 2008')
print(g)
dev.off()