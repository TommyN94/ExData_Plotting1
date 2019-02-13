data = read.csv2("../data/household_power_consumption.txt", dec = ".",
                  na.strings = "?", stringsAsFactors = FALSE)

data$Date = as.Date(data$Date, format = "%d/%m/%Y")
data = data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"), ] 

png("plot1.png")
hist(data$Global_active_power, col = "red", bty = "n", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
