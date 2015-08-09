mydata <- read.table('household_power_consumption.txt', header = TRUE, sep =";")

mydata$DateTime <- paste(mydata$Date, mydata$Time)
mydata$DateTime <- as.Date(mydata$DateTime, format = "%d/%m/%Y %H:%M:%S")

library(dplyr)
subsetted <- filter(mydata, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime <= as.Date("2007-02-02 23:59:59"))
subsetted$DateTime <- strptime(subsetted$DateTime, format = "%d/%m/%Y %H:%M:%S", tz="GMT")
png(filename = "plot1.png",width = 480, height = 480)
hist(as.numeric(as.character(subsetted$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()