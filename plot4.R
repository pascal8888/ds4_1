## Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
## assumes NEI & SCC data sets are loaded (actual variable names are "NEI" & "SCC")
## open the png graphics device
png("plot4.png", width=480, height=480)
## make index of SCC data set which SCC codes are used to indicate coal
coal_index <- grep("Coal",SCC$EI.Sector,ignore.case=T)
## make a vector of factors (SCC values for coal)
SCC_factors <- as.vector(unique(SCC[coal_index,1]))
## make an index of rows in NEI that contain any of the SCC factors
NEI_coal_index <- which(NEI$SCC %in% SCC_factors)
## make the subset of our plot data
NEI_coal <- NEI[NEI_coal_index,]
## set the plot data
library(plyr)
plot_data <- ddply(NEI_coal,"year",summarize, sum(Emissions))
names(plot_data)[2] <- "Emissions"
## plot it
tmp <- qplot(year,Emissions,data=plot_data,main="Coal Combustion-Related Emissions for USA by Year",size=6,xlab="Year")
tmp + theme(legend.position="none")
dev.off()
rm("coal_index","SCC_factors","NEI_coal_index","plot_data","NEI_coal","tmp")
