# plot3.R - Time Series of Global Active Power by submeter



# Read data, convert dates and subset on two days in February 2007
data <- read.table('household_power_consumption.txt', sep=';', header=T, 
                   na.strings='?')
data$DateTime <- strptime(paste(data$Date, data$Time), 
                          "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
Feb2007data <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")



# Open plot3.png
png("plot3.png", height=480, width=480)

# Build time series
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
       col = c('black', 'red', 'blue'))

# Close PNG file
dev.off()