data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ';', stringsAsFactors = FALSE, na.strings = "?")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

date_time <- paste(data$Date, data$Time)

date_time <- strptime(date_time, format = "%d/%m/%Y %H:%M:%S", tz = "")

data <- cbind(date_time, data[, c(-1,-2)])

#2
with(data, plot(date_time, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l"))

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
