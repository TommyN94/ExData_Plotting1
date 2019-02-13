data = read.csv2("../data/household_power_consumption.txt", dec = ".",
                 na.strings = "?", stringsAsFactors = FALSE)

data$Date = as.Date(data$Date, format = "%d/%m/%Y")
data = data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"), ]
data$Date_time = with(data, as.POSIXct(paste(Date, Time)))

png("plot2.png")
with(data, plot(Date_time, Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)"))
dev.off()
