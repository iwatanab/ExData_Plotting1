# Read data from household_power_consumption.txt
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character","character","double","double","double","double","double","double","double"), na.strings = "?")

data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXlt(data$DateTime, format="%d/%m/%Y %H:%M:%S")

data <- subset(data, DateTime$year == 107 & DateTime$mon == 1 & (DateTime$mday == 1 | DateTime$mday == 2))


png(file = "plot4.png")
par(mfrow = c(2,2))

with(data,plot(x=DateTime, y=Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab ="" ))

with(data,plot(x=DateTime,y=Voltage,type="l",ylab="Voltage",xlab="datetime"))

with(data,plot(x=DateTime, y=Sub_metering_1, type="l", ylab = "Energy sub metering", xlab ="" ))
lines(x=data$DateTime, y=data$Sub_metering_2, col="red")
lines(x=data$DateTime, y=data$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="l",col=c("black","red","blue"),lwd=2,cex=0.7)

with(data, plot(DateTime, Global_reactive_power, type = "l", main = "", xlab = "datetime"))

dev.off()