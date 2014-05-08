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
png(filename="plot1.png", width=480, height=480)
hist(x$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab = "Frequency", main="Global Active Power")
dev.off()