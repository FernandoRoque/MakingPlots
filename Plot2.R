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
#   PLOT 2
#
###########################################################################

png(file = "plot3.png", width = 480, height = 480)

with(hous2, plot(gap, type="l", xaxt='n', ylab="Global Active Power (kilowats)",xlab=""))
axis(1,0:2*dim(hous2)[1]/2,c("Thu","Fri","Sat"))

dev.off()
