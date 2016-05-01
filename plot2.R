Dat <- read.table("./household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?")
head(Dat)
Dat$Date <- as.Date(Dat$Date,format = "%d/%m/%Y")
subData <- subset(Dat, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
head(subData)

dateTime <- strptime(paste(subData$Date,subData$Time),"%Y-%m-%d %H:%M:%S")
head(dateTime)

png("plot2.png", width=480, height=480)
plot(dateTime, subData$Global_active_power, xlab = "", ylab="Global Active Power (kilowatts)", type = "l")
dev.off()
