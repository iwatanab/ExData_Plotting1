# Read data from household_power_consumption.txt
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character","character","double","double","double","double","double","double","double"), na.strings = "?")

data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXlt(data$DateTime, format="%d/%m/%Y %H:%M:%S")

data <- subset(data, DateTime$year == 107 & DateTime$mon == 1 & (DateTime$mday == 1 | DateTime$mday == 2))

png(file = "plot2.png")
with(data,plot(x=DateTime, y=Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab ="" ))
dev.off()