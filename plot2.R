##
## Read the data for Plot 2
##
## setwd("C:/Users/bjorkr.DARTIPC1/Desktop/DataScienceCoursera/GIT/ExData_Plotting1")

## data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', 
##     na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, 
##     comment.char="", quote='\"')

## Pull in the raw data
data_sub <- subset(read.csv("household_power_consumption.txt", header=T, sep=';',
    na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, 
    comment.char="", quote='\"'), Date %in% c("1/2/2007","2/2/2007"))

data_sub$Date <- as.Date(data_sub$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$Datetime <- as.POSIXct(datetime)

## Draw Plot 2
with(data_sub, {
  plot(Global_active_power~Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
  })

## Saving Plot 2 to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()