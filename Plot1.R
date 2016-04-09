setwd("C:/Users/Fernando/Documents/Material/Coursera/DataScience/Exploratory Data Analysis")
hous <- read.table("household_power_consumption.txt", sep=";",header=TRUE, stringsAsFactor=FALSE)

hous1 <- subset(hous, Date=="1/2/2007" | Date=="2/2/2007")
hous2 <- with(hous1,data.frame(date = Date, 
                               time = Time, 
                               gap  = as.numeric(Global_active_power),
                               grp  = as.numeric(Global_reactive_power),
                               volt = as.numeric(Voltage),
                               gi   = as.numeric(Global_intensity),
                               sub1 = as.numeric(Sub_metering_1),
                               sub2 = as.numeric(Sub_metering_2),
                               sub3 = as.numeric(Sub_metering_3)
))

###########################################################################
#
#   PLOT 1
#
###########################################################################

png(file = "plot1.png", width = 480, height = 480)

with(hous2, hist(gap, col="red", 
                 main="Global Active Power", 
                 xlab="Global Active Powe (kilowats)", 
                 ylab="Frequency",
                 xlim=c(0,8)))

dev.off()
