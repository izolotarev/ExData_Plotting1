data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ';', stringsAsFactors = FALSE, na.strings = "?")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

date_time <- paste(data$Date, data$Time)

date_time <- strptime(date_time, format = "%d/%m/%Y %H:%M:%S", tz = "")

data <- cbind(date_time, data[, c(-1,-2)])

#3
with(data, plot(date_time, Sub_metering_1, ylab = "Energy sub metering", type = "l", xlab = ""))
with(data, points(date_time, Sub_metering_2, col = "red", type = "l"))
with(data, points(date_time, Sub_metering_3, col = "blue", type = "l"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1))

dev.copy(png, file = "plot3.png", width = 540, height = 480)
dev.off()
