Dat <- read.table("./household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?")
head(Dat)
Dat$Date <- as.Date(Dat$Date,format = "%d/%m/%Y")
subData <- subset(Dat, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
head(subData)

png("plot4.png", width=480, height=480)
par(mfrow= c(2,2))
#plot on the topleft
plot(dateTime, subData$Global_active_power, xlab = "", ylab="Global Active Power (kilowatts)", type = "l")
#plot on the topright
plot(dateTime, subData$Voltage, xlab = "datetime", ylab="", type = "l")
#plot on the lowerleft
plot(dateTime, subData$Sub_metering_1, xlab = " ", ylab="Energy sub metering", type = "l")
lines(dateTime,subData$Sub_metering_2,type = "l", col = "red")
lines(dateTime,subData$Sub_metering_3,type = "l", col = "blue")
legend("topright",lty = 1, lwd = 2, col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#plot on the lowerright
plot(dateTime, subData$Global_reactive_power, xlab = "datetime", ylab="Global_reactive_power", type = "l")
dev.off()
