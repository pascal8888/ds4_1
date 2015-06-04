## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
## assumes NEI & SCC data sets are loaded (actual variable names are "NEI" & "SCC")
## open the png graphics device
png("plot1.png", width=480, height=480)
## make an index array of each year
y1999 <- which(NEI$year == 1999)
y2002 <- which(NEI$year == 2002)
y2005 <- which(NEI$year == 2005)
y2008 <- which(NEI$year == 2008)
## make an empty matrix with the structure we want
years <- matrix(data=NA,nrow=1,ncol=4,dimnames=list(c("Sum"),c("1999","2002","2005","2008")))
## set the values in the array with the sums from the data set
years[,1] <- sum(NEI$Emissions[y1999],na.rm=T)
years[,2] <- sum(NEI$Emissions[y2002],na.rm=T)
years[,3] <- sum(NEI$Emissions[y2005],na.rm=T)
years[,4] <- sum(NEI$Emissions[y2008],na.rm=T)
## plot it
boxplot(years,xlab="Year",ylab="Total PM25 From All Sources",main="Total PM2.5 From All Sources Per Year")
dev.off()
## clean up
rm("y1999","y2002","y2005","y2008","years")
