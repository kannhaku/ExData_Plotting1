# plot1.R - Histogram of Global Active Power



# Read data, convert dates and subset on two days in February 2007
data <- read.table('household_power_consumption.txt', sep=';', header=T, 
                    na.strings='?')
data$DateTime <- strptime(paste(data$Date, data$Time), 
                           "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
Feb2007data <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")



# Open plot1.png
png("plot1.png", height=480, width=480)


# Build histogram
hist(Feb2007data$Global_active_power, col='red', 
      xlab = 'Global Active Power (kilowatts)',
      main = 'Global Active Power')


# Close PNG file     
dev.off()
