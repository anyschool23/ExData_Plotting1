source("loadData.R")
data<-loadData()

png(filename="plot2.png")
plot(data$Time,data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()

# End of File