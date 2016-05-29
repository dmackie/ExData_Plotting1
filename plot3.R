##
# Exploratory Data Analysis
# Assingment: Course Project 1 : Plot 3
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

#Labels
label_x <- ""
label_y <- "Energy sub metering"

#Find min and max of the three data series
axis_y_max <- with(hpc_filtered, max(Sub_metering_1, Sub_metering_2, Sub_metering_3))
axis_y_min <- with(hpc_filtered, min(Sub_metering_1, Sub_metering_2, Sub_metering_3))

#Set display device to PNG file
png(file = "plot3.png")

#Plot Histogram
with(hpc_filtered, {
    plot(c(min(datetime), max(datetime)), c(axis_y_min,axis_y_max),   type = "n", xlab = label_x, ylab = label_y)
    lines(Sub_metering_1 ~ datetime, type = "l", col = "black")
    lines(Sub_metering_2 ~ datetime, type = "l", col = "red")
    lines(Sub_metering_3 ~ datetime, type = "l", col = "blue")
})

#Add plot legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty=c(1,1,1)
       )

#save/close file
dev.off()