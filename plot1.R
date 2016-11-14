data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
subset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
datetime <-strptime(paste(subset$Date, subset$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
subset <- cbind(datetime, subset)
hist(subset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
cat("Plot1.png has been saved in", getwd())