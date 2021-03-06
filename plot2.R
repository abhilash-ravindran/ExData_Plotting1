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

png("plot2.png", width = 480, height = 480)
plot(powerDat$DateTime, powerDat$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
dev.off
