# setup file path
fileUrl <- "./household_power_consumption.txt"

# Read file
powerDat <- read.csv(fileUrl,  sep=";", na.strings = "?")

#Convert Date column as Date.
powerDat$Date <- as.Date(powerDat$Date, "%d/%m/%Y")

#Keep data for only "2007/02/01",  "2007/02/02"
powerDat <- subset(powerDat, Date >= "2007/02/01" & Date <= "2007/02/02")

#Add new column DateTime by concatinating Date and Time
powerDat$DateTime <- strptime(paste(powerDat$Date, powerDat$Time), format = "%Y-%m-%d %H:%M:%S")

png("plot3.png", width = 480, height = 480)
plot(powerDat$DateTime, powerDat$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
points(powerDat$DateTime, powerDat$Sub_metering_2, type = "l", col = "red")
points(powerDat$DateTime, powerDat$Sub_metering_3, type = "l", col = "blue")
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col = c("black", "red", "blue"), lty = 1)
dev.off
