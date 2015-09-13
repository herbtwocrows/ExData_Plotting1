# Setup
setwd("C:\\Users\\Herb i5\\Documents\\Data Science Course\\Exploratory Data Analysis\\Project 1")
library(dplyr)

# Read training data
hpc <- read.table("./household_power_consumption.txt", header = T, 
                  sep = ';', na.strings = '?')
head(hpc)

# Date format is day/month/yyyy
# Select rows where date is "01/02/2012" or "02/02/2012"
hpc.sub <- filter(hpc, Date == '1/2/2007' | Date ==  '2/2/2007') 

# Change Date to Date data type, and combine to form variable Date.and.time
# Convert "Date.and.time" from Charicter to POSIXlt
hpc.sub$Date <- as.Date(hpc.sub$Date, "%d/%m/%Y")
Date.and.time = paste(hpc.sub$Date, hpc.sub$Time)
Date.Time = strptime(Date.and.time, format = "%Y-%m-%d %H:%M:%S")

# Add Date.Time to hpc.sub
hpc.sub <- cbind(hpc.sub, Date.Time)

# Graph 3

# Plot the graph and save to Plot3.png 
png(filename = "plot3.png")
plot(hpc.sub$Date.Time, hpc.sub$Sub_metering_1, type = 'l', 
     xlab = "", ylab = "Energy sub metering")
lines(hpc.sub$Date.Time, hpc.sub$Sub_metering_2, col = 'red', type = 'l')
lines(hpc.sub$Date.Time, hpc.sub$Sub_metering_3, col = 'blue', type = 'l')
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c('black', 'red', 'blue'), lty = 1, lwd = 2)
dev.off()