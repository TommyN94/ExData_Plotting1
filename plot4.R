data = read.csv2("../data/household_power_consumption.txt", dec = ".",
                 na.strings = "?", stringsAsFactors = FALSE)

data$Date = as.Date(data$Date, format = "%d/%m/%Y")
data = data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"), ]
data$Date_time = with(data, as.POSIXct(paste(Date, Time)))

png("plot4.png")
par(mfrow = c(2, 2))
with(data, {
  plot(Date_time, Global_active_power, type = "l", xlab = "",
       ylab = "Global Active Power")

  plot(Date_time, Voltage, type = "l", xlab = "datetime")
  
  plot(Date_time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(Date_time, Sub_metering_2, col = "red")
  lines(Date_time, Sub_metering_3, col = "blue")
  legend("topright", legend = grep("^Sub", colnames(data), value = TRUE), lty = 1,
         col = c("black", "red", "blue"), bty = "n")
  
  plot(Date_time, Global_reactive_power, type = "l", xlab = "datetime")
  
})
dev.off()
