file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file_url, destfile = "./power_consumption.zip")
unzip("./power_consumption.zip")

data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ';', stringsAsFactors = FALSE, na.strings = "?")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

date_time <- paste(data$Date, data$Time)

date_time <- strptime(date_time, format = "%d/%m/%Y %H:%M:%S", tz = "")

data <- cbind(date_time, data[, c(-1,-2)])

#1
par(mfrow= c(1,1), mar = c(4,4,2,1), oma = c(0,0,2,0))

hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()



'Sys.setlocale("LC_ALL","English")
'Sys.setlocale("LC_MESSAGES", 'en_GB.UTF-8')
'Sys.setenv(LANG = "en_US.UTF-8")