## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
## assumes NEI & SCC data sets are loaded (actual variable names are "NEI" & "SCC")
## open the png graphics device
#png("plot2.png", width=480, height=480)
## subset Baltimore by year
baltimore1 <- which(NEI$fips == "24510" & NEI$year == 1999)
baltimore2 <- which(NEI$fips == "24510" & NEI$year == 2002)
baltimore3 <- which(NEI$fips == "24510" & NEI$year == 2005)
baltimore4 <- which(NEI$fips == "24510" & NEI$year == 2008)
## make an empty matrix with the structure we want
years <- matrix(data=NA,nrow=1,ncol=4,dimnames=list(c("Sum"),c("1999","2002","2005","2008")))
## set the values in the array with the sums from the data set
years[,1] <- sum(NEI[baltimore1,]$Emissions)
years[,2] <- sum(NEI[baltimore2,]$Emissions)
years[,3] <- sum(NEI[baltimore3,]$Emissions)
years[,4] <- sum(NEI[baltimore4,]$Emissions)
## plot it
boxplot(years,xlab="Year",ylab="Total PM2.5 From Baltimore City, Maryland",main="Total PM2.5 From Baltimore City, Maryland Per Year")
#dev.off()
## clean up
rm("years","baltimore1","baltimore2","baltimore3","baltimore4")
