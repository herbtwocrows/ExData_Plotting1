# Setup
setwd("C:\\Users\\Herb i5\\Documents\\Data Science Course\\Exploratory Data Analysis\\Project 1")
library(dplyr)

# Read training data
hpc <- read.table("./household_power_consumption.txt", header = T, 
                  sep = ';', na.strings = '?')

# Date format is day/month/yyyy
# Select rows where date is "01/02/2012" or "02/02/2012"
hpc.sub <- filter(hpc, Date == '1/2/2007' | Date ==  '2/2/2007') 

# Add Date.Time to hpc.sub
hpc.sub <- cbind(hpc.sub, Date.Time)

# Plot the graph and save to Plot2.png 
png(filename = "plot2.png")
plot(hpc.sub$Date.Time, hpc.sub$Global_active_power, type = 'l', xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()

# Graph 4

# Plot the graph and save to Plot4.png 
png(filename = "plot4.png")
par(mfrow = c(2,2)) # Set up a 2 by 2 display, adding by rows
plot(hpc.sub$Date.Time, hpc.sub$Global_active_power, type = 'l', xlab = "", 
     ylab = "Global Active Power")
plot(hpc.sub$Date.Time, hpc.sub$Voltage, 
     type = 'l', xlab = "datetime", ylab = "Voltage")
plot(hpc.sub$Date.Time, hpc.sub$Sub_metering_1, type = 'l', xlab = "", 
     ylab = "Energy sub metering")
lines(hpc.sub$Date.Time, hpc.sub$Sub_metering_2, col = 'red', type = 'l')
lines(hpc.sub$Date.Time, hpc.sub$Sub_metering_3, col = 'blue', type = 'l')
legend('topright', 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c('black', 'red', 'blue'), lty = 1, lwd = 2, bty = 'n')
plot(hpc.sub$Date.Time, hpc.sub$Global_reactive_power, type = 'l', 
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()