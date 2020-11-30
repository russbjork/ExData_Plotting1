##
## Read the data for Plot 1
##
##  setwd("C:/Users/bjorkr.DARTIPC1/Desktop/DataScienceCoursera/GIT/ExData_Plotting1")

## data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', 
##     na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, 
##     comment.char="", quote='\"')

## Pull in the raw data
data_sub <- subset(read.csv("household_power_consumption.txt", header=T, sep=';', 
    na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, 
    comment.char="", quote='\"'), Date %in% c("1/2/2007","2/2/2007"))

data_sub$Date <- as.Date(data_sub$Date, format="%d/%m/%Y")

## Draw Plot 1
hist(data_sub$Global_active_power, main="Global Active Power", 
    xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving Plot 1 to file
dev.copy(png("plot1.png", width=480, height=480))
dev.off()
