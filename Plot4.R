#-----------------------------------------------------------------------------
# Exploratory Data Analysis Project 1
# Author: Luis Quesada
# 2016-05-05
#-----------------------------------------------------------------------------

#Clean workspace
rm(list = ls())

## We will only be using data from the dates 2007-02-01 and 2007-02-02.
## The date format in the file is d/m/y
## Asumes the data file is in the working directory. 
## If that is not the case, execute "LoadData.R" file
powerCon <- read.table("household_power_consumption.txt", 
                       header = TRUE, sep = ";", na.strings = "?")
powerCon <- subset(powerCon, Date %in% c("1/2/2007","2/2/2007"))

##Create a vector with the date and time
dateAndTime <- as.POSIXct(paste(powerCon$Date, powerCon$Time), format = "%d/%m/%Y %H:%M:%S")

#Two rows and two columns
plot.new()
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(dateAndTime, powerCon$Global_active_power, type = "l", 
     ylab = "Global Active Power",
     xlab = "")

plot(dateAndTime, powerCon$Voltage, type = "l", 
     ylab = "Voltage",
     xlab = "datetime")

plot(dateAndTime, powerCon$Sub_metering_1, type = "n", 
     xlab = "", ylab = "Energy Sub Metering")
##Add lines
lines(dateAndTime, powerCon$Sub_metering_1, col="Black", type = "l")
lines(dateAndTime, powerCon$Sub_metering_2, col="Red", type = "l")
lines(dateAndTime, powerCon$Sub_metering_3, col="Blue", type = "l")
legend("topright", col=c("Black", "Red", "Blue"), lty=1, lwd=2, bty = "n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


plot(dateAndTime, powerCon$Global_reactive_power, type = "l", 
     ylab = "Global_reactive_power",
     xlab = "datetime")


#If the next option (dev.copy) is used, the legend in sub_metering plot is cut off in the png file
#dev.copy(png, file = "plot4.png", width=480, height=480)

dev.off()