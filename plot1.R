Dat <- read.table("./household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?")
head(Dat)
Dat$Date <- as.Date(Dat$Date,format = "%d/%m/%Y")
subData <- subset(Dat, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
head(subData)
png("plot1.png", width = 480, height = 480) ##open png device
##create plot and send to a file 
hist(subData$Global_active_power,xlab = "Blobal Active Power(kilowatts)",ylab = "Frequency", col = "red",
     main = "Global Active Power")
dev.off() ##close the pdf file device
