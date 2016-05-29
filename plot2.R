##
# Exploratory Data Analysis
# Assingment: Course Project 1 : Plot 2
#
# Done as part of the Coursera course Exploratory Data Analysis
# by Johns Hopkins University
#
# (c) Dave Mackie
##
library(dplyr)

## Dataset
#
# It is assumed that the dataset has been downloaded and unzipped into the current
# working directory and the file is named "household_power_consumption.txt"
##

#Read in the original data
hpc <- read.table("household_power_consumption.txt", sep = ";", quote = "", header = TRUE, na.strings = "?")

#Filter data to only use data from the dates 2007-02-01 and 2007-02-02 
hpc_filtered <- filter(hpc, Date == '1/2/2007' | Date == '2/2/2007')

#create a Date/Time column
hpc_filtered$datetime <- as.POSIXct(paste(hpc_filtered$Date, hpc_filtered$Time), format ='%d/%m/%Y %H:%M:%S')

#Set display device to PNG file
png(file = "plot2.png")

#Plot Histogram
plot(hpc_filtered$Global_active_power ~ hpc_filtered$datetime, type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)")

#save/close file
dev.off()