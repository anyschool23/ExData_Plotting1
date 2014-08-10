source("loadData.R")
data<-loadData()

png(filename="plot4.png")
par(mfrow=c(2,2))

plot(data$Time,data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

plot(data$Time, data$Voltage,xlab='datetime', ylab='Voltage', type='l')

with(data,plot(Time,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(data,points(Time,Sub_metering_2,type="l",col="red"))
with(data,points(Time,Sub_metering_3,type="l",col="blue"))
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty="solid",bty="n")

plot(data$Time, data$Global_reactive_power,xlab='datetime', ylab='Global_reactive_power', type='l') 

dev.off()
# End of File