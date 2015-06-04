## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.
## assumes NEI & SCC data sets are loaded (actual variable names are "NEI" & "SCC")
## open the png graphics device
png("plot3.png", width=480, height=480)
## get the index array for the subset Baltimore & date range
baltimore <- which(NEI$fips == "24510" & NEI$year >= 1999 & NEI$year <= 2008)
## subset the df to baltimore using the index array
NEI_balt <- NEI[baltimore,]
## make a new data set summarized by sum of emissions for year and type
library(plyr)
plot_data <- ddply(NEI_balt,.(type,year),summarize, sum(Emissions))
names(plot_data)[3] <- "Emissions"
## plot it
library(ggplot2)
## set the qplot to variable so we can apply theme
tmp <- qplot(Emissions,type,data=plot_data, facets=year~.,main="Total Emissions for Baltimore by Type by Year",ylab="",color=type,size=10,shape=type)
## remove the superflous and confusing legends
tmp + theme(legend.position="none")
dev.off()
## clean up
#dev.copy(png, file="plot3.png")
rm("NEI_balt","baltimore","plot_data",tmp)
