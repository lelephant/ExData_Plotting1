### read in data
file<- "household_power_consumption.txt"
data<- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

### subset of data from required dates
dataneeded<-data[data$Date %in% c("1/2/2007","2/2/2007") ,]

###subestting the required variable
GAP <- as.numeric(dataneeded$Global_active_power)

###creating plot
png("plot1.png", width=480, height=480)
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()