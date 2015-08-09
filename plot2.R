newdata <- read.table('household_power_consumption.txt', header = TRUE, sep =";")

newdata$DateTime <- paste(newdata$Date, newdata$Time)
newdata$DateTime <- strptime(newdata$DateTime, format = "%d/%m/%Y %H:%M:%S")

library(dplyr)
subdata <- subset(newdata, DateTime >= as.POSIXct('2007-02-01 00:00:00') & DateTime <= as.POSIXct('2007-02-02 23:59:59'))
png(filename = "plot2.png",width = 480, height = 480)
plot(subdata$DateTime,subdata$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()