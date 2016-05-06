#-----------------------------------------------------------------------------
# Exploratory Data Analysis Project 1
# Author: Luis Quesada
# 2016-05-05
#-----------------------------------------------------------------------------

#Clean workspace
rm(list = ls())

fileName <- "exdata-data-household_power_consumption.zip"

## If not already in the working directory, download the dataset
if (!file.exists(fileName))
{
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, fileName)
} 

## if not unzipped, unzip the data set
if (!file.exists("household_power_consumption.txt"))
{
  unzip(fileName, overwrite = TRUE)
}