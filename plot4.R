# Set working directory and file name
setwd("/Users/chad/Google Drive/Coursera/Data Science/Exploratory Data Analysis/Project 1")
filename = "household_power_consumption.txt"

# Load data
hpc <- read.table(file=filename, header=TRUE, sep=";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")

# Subset data to relevant dates
x <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

# Create POSIXlt date/time
x$DateTime <- strptime(paste(x$Date, x$Time), "%d/%m/%Y %H:%M:%S")

# Plot
png(filename="plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(x$DateTime, x$Global_active_power, type="l", xlab="", ylab="Global Active Power") 
plot(x$DateTime, x$Voltage, type="l", xlab="datetime", ylab="Voltage") 
plot(x$DateTime, x$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(x$DateTime, x$Sub_metering_2, col="red")
lines(x$DateTime, x$Sub_metering_3, col="blue")
legend("topright", bty = "n", lwd = 1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(x$DateTime, x$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power") 
dev.off()