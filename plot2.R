setwd("C:/Users/LAMSE/Documents/Module4/Assignment1/plot2")
getwd()
library(data.table)
library(lubridate)
dt<-fread("../exdata-data-household_power_consumption/household_power_consumption.txt", na.strings="?")

dt$Date <- as.Date(dt$Date,format="%d/%m/%Y")
dt.filter<-dt[dt$Date=="2007-02-01" | dt$Date=="2007-02-02",]
dt.filter$Global_active_power<-as.numeric(dt.filter$Global_active_power)

dt.filter$DateTime <- as.POSIXct(paste(dt.filter$Date, dt.filter$Time, sep=" "), 
                                 format="%Y-%m-%d %H:%M:%S")

png(filename="plot2.png", width=480, height=480)

plot(dt.filter$DateTime, dt.filter$Global_active_power, typ='l', xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
