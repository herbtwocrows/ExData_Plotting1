# Setup
setwd("C:\\Users\\Herb i5\\Documents\\Data Science Course\\Exploratory Data Analysis\\Project 1")
library(dplyr)

# Read training data
hpc <- read.table("./household_power_consumption.txt", header = T, 
                  sep = ';', na.strings = '?')

# Date format is day/month/yyyy
# Select rows where date is "01/02/2012" or "02/02/2012"
hpc.sub <- filter(hpc, Date == '1/2/2007' | Date ==  '2/2/2007') 

# Graph 1

png(filename = "plot1.png")
hist(hpc.sub$Global_active_power, col = 'red', 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

