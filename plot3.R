### read in data
file<- "household_power_consumption.txt"
data<- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

### subset of data from required dates
dataneeded<-data[data$Date %in% c("1/2/2007","2/2/2007") ,]

### prepping required variables
datetime <- strptime(paste(dataneeded$Date, dataneeded$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(dataneeded$Global_active_power)
sm1<- as.numeric(dataneeded$Sub_metering_1)
sm2<- as.numeric(dataneeded$Sub_metering_2)
sm3<- as.numeric(dataneeded$Sub_metering_3)

##creating plot
png("plot3.png", width=480, height=480)
plot(datetime, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sm2, type="l", col="red")
lines(datetime, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
