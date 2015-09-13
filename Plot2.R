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

# Graph 2

# Change Date to Date data type, and combine to form variable Date.and.time
# Convert "Date.and.time" from Charicter to POSIXlt
hpc.sub$Date <- as.Date(hpc.sub$Date, "%d/%m/%Y")
Date.and.time = paste(hpc.sub$Date, hpc.sub$Time)
Date.Time = strptime(Date.and.time, format = "%Y-%m-%d %H:%M:%S")

# Add Date.Time to hpc.sub
hpc.sub <- cbind(hpc.sub, Date.Time)

# Plot the graph and save to Plot2.png 
png(filename = "plot2.png")
plot(hpc.sub$Date.Time, hpc.sub$Global_active_power, type = 'l', 
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

