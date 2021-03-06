data <- read.table("household_power_consumption.txt",header = TRUE, sep =";",na.strings = "?")
data <- subset(data,as.Date(data$Date, "%d/%m/%Y") >= as.Date("2007-2-1") & as.Date(data$Date, "%d/%m/%Y") <= as.Date("2007-2-2"))
dateandtime <- strptime(paste(data$Date,data$Time,sep=" "), "%d/%m/%Y %H:%M:%S")
data <- cbind(dateandtime,data)
par(mfrow = c(2,2))
plot(data$Global_active_power~data$dateandtime,type = "l",ylab= "global active power(KW)")
plot(data$Voltage~data$dateandtime,type = "l",ylab= "Voltage(volts)")
plot(data$Sub_metering_1~data$dateandtime,type="l", ylab="Energy sub metering",xlab="")
lines(data$Sub_metering_2~data$dateandtime,type="l",col = "red")
lines(data$Sub_metering_3~data$dateandtime,type="l",col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"), lwd=c(1,1,1))
plot(data$Global_reactive_power~data$dateandtime,type = "l",ylab= "global reactive power(KW)")
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()