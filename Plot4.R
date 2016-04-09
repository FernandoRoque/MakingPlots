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
#   PLOT 4
#
###########################################################################

png(file = "plot4.png", width = 480, height = 480)



par(mfrow=c(2,2))

###########################################################################

with(hous2, plot(gap, type="l", xaxt="n", ylab="Global Active Power", xlab=""))
axis(1,0:2*dim(hous2)[1]/2,c("Thu","Fri","Sat"))

###########################################################################

with(hous2, plot(volt, type="l", xaxt="n", ylab="Voltage", xlab="datetime"))
axis(1,0:2*dim(hous2)[1]/2,c("Thu","Fri","Sat"))

###########################################################################

with(hous2,  plot(sub1, type="l", xaxt='n', ylab="Energy sub metering",xlab=""))
with(hous2, lines(sub2, col="red"))
with(hous2, lines(sub3, col="blue"))
axis(1,0:2*dim(hous2)[1]/2,c("Thu","Fri","Sat"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=2,col=c("black","red","blue"), cex=0.5, bty="n")

###########################################################################

with(hous2, plot(grp, type="l", xaxt="n", ylab="Global_Reactive_Power", xlab="datetime"))
axis(1,0:2*dim(hous2)[1]/2,c("Thu","Fri","Sat"))


dev.off()
