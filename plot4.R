# plot4.R - Multiplot time series of global active power, voltage,
#           submetering and global reactive power



# Read data, convert dates and subset on two days in February 2007
data <- read.table('household_power_consumption.txt', sep=';', header=T, 
                   na.strings='?')
data$DateTime <- strptime(paste(data$Date, data$Time), 
                          "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
Feb2007data <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")


# Open plot4.png
png("plot4.png", height=480, width=480)

# Configure multiplot
par(mfrow=c(2,2))

# Global Active Power plot
plot(Feb2007data$DateTime, 
     Feb2007data$Global_active_power, 
     pch=NA, 
     xlab="", 
     ylab="Global Active Power ")
lines(Feb2007data$DateTime, Feb2007data$Global_active_power)

# Voltage plot
plot(Feb2007data$DateTime, Feb2007data$Voltage, ylab="Voltage", xlab="datetime", pch=NA)
lines(Feb2007data$DateTime, Feb2007data$Voltage)

# Submetering plot
plot(Feb2007data$DateTime, 
     Feb2007data$Sub_metering_1, 
     pch=NA, 
     xlab="", 
     ylab="Energy sub metering")
lines(Feb2007data$DateTime, Feb2007data$Sub_metering_1)
lines(Feb2007data$DateTime, Feb2007data$Sub_metering_2, col='red')
lines(Feb2007data$DateTime, Feb2007data$Sub_metering_3, col='blue')
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'),
       bty = 'n')

# Global reactive power plot
with(Feb2007data, plot(DateTime, Global_reactive_power, xlab='datetime', pch=NA))
with(Feb2007data, lines(DateTime, Global_reactive_power))

# Close PNG file
dev.off()