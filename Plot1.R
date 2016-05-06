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
## If that is not the case, execute "LoadData.R" file included in the repository
powerCon <- read.table("household_power_consumption.txt", 
                       header = TRUE, sep = ";", na.strings = "?")
powerCon <- subset(powerCon, Date %in% c("1/2/2007","2/2/2007"))


plot.new()
png("plot1.png", width=480, height=480)
##Creates histogram
hist(powerCon$Global_active_power, 
     col = "Red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

dev.off()