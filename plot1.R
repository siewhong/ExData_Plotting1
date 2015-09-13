setwd("C:/Users/LAMSE/Documents/Module4/Assignment1/plot1")
getwd()

library(data.table)
dt<-fread("../exdata-data-household_power_consumption/household_power_consumption.txt", na.strings="?")

dt$strDate <- as.Date(dt$Date,"%d/%m/%Y")
dt.filter<-dt[dt$strDate=="2007-02-01" | dt$strDate=="2007-02-02",]
dt.filter$Global_active_power<-as.numeric(dt.filter$Global_active_power)

png(filename="plot1.png", width=480, height=480)
hist(dt.filter$Global_active_power, 
     col="red", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()