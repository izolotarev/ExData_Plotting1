data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ';', stringsAsFactors = FALSE, na.strings = "?")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

date_time <- paste(data$Date, data$Time)

date_time <- strptime(date_time, format = "%d/%m/%Y %H:%M:%S", tz = "")

data <- cbind(date_time, data[, c(-1,-2)])

#4
par(mfrow= c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

with(data, plot(date_time, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l"))

with(data, plot(date_time, Voltage, ylab = "Voltage", type = "l", xlab = "datetime"))

with(data, plot(date_time, Sub_metering_1, ylab = "Energy sub metering", type = "l", xlab = ""))
with(data, points(date_time, Sub_metering_2, col = "red", type = "l"))
with(data, points(date_time, Sub_metering_3, col = "blue", type = "l"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1))

with(data, plot(date_time, Global_reactive_power, xlab = "datetime", type = "l"))

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
