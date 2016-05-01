Dat <- read.table("./household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?")
head(Dat)
Dat$Date <- as.Date(Dat$Date,format = "%d/%m/%Y")
subData <- subset(Dat, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
head(subData)

png("plot3.png", width=480, height=480)
plot(dateTime, subData$Sub_metering_1, xlab = "", ylab="Energy sub metering", type = "l")
lines(dateTime,subData$Sub_metering_2,type = "l", col = "red")
lines(dateTime,subData$Sub_metering_3,type = "l", col = "blue")
legend("topright",lty = 1, lwd = 2, col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
