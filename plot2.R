### read in data
file<- "household_power_consumption.txt"
data<- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

### subset of data from required dates
dataneeded<-data[data$Date %in% c("1/2/2007","2/2/2007") ,]

### prepping required variables
datetime <- strptime(paste(dataneeded$Date, dataneeded$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(dataneeded$Global_active_power)

##creating plot
png("plot2.png", width=480, height=480)
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()