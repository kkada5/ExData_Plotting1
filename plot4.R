data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
subset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
datetime <-strptime(paste(subset$Date, subset$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
subset <- cbind(datetime, subset)
par(mfrow = c(2,2))
plot(subset$datetime, subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(subset$datetime, subset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(subset$datetime, subset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(subset$datetime, subset$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", 
    col = "red")
points(subset$datetime, subset$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
    "Sub_metering_2", "Sub_metering_3"))
plot(subset$datetime, subset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
cat("Plot4.png has been saved in", getwd())

