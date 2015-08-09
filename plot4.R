newdata <- read.table('household_power_consumption.txt', header = TRUE, sep =";")

newdata$DateTime <- paste(newdata$Date, newdata$Time)
newdata$DateTime <- strptime(newdata$DateTime, format = "%d/%m/%Y %H:%M:%S")

library(dplyr)
subdata <- subset(newdata, DateTime >= as.POSIXct('2007-02-01 00:00:00') & DateTime <= as.POSIXct('2007-02-02 23:59:59'))
png(filename = "plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
#1 - Global Active Power
plot(subdata$DateTime,subdata$Global_active_power, type="l", ylab = "Global Active Power", xlab = "")

#2 - Voltage
plot(subdata$DateTime,subdata$Voltage, type="l", ylab = "Voltage", xlab = "datetime")

#3 - submetering

with(subdata, plot(subdata$DateTime,subdata$Sub_metering_1, main = "",type = "l", col = "black", ylab = "Energy sub metering", xlab = ""))
with(subdata, points(subdata$DateTime,subdata$Sub_metering_2,type = "l", col = "red"))
with(subdata, points(subdata$DateTime,subdata$Sub_metering_3,type = "l", col = "blue"))
legend("topright",col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lwd="1", lty = c(1,1,1), bty="n")

#4 - Global Reactive Power
plot(subdata$DateTime,as.numeric(as.character(subdata$Global_reactive_power)), type="l",ylab = "Global_reactive_power", xlab = "datetime")

dev.off()