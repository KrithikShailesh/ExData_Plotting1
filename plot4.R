File <- "./household_power_consumption.txt"
data <- read.table(File,sep=";",stringsAsFactors = F,header = T,dec = ".")
subset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

date <- strptime(paste(subset$Date,subset$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subset$Global_active_power)
globalreactivepower <- as.numeric(subset$Global_reactive_power)
voltage <-as.numeric(subset$Voltage)
submetering1 <- as.numeric(subset$Sub_metering_1)
submetering2 <- as.numeric(subset$Sub_metering_2)
submetering3 <- as.numeric(subset$Sub_metering_3)

png("plot4.png",width = 480,height = 480)

par(mfrow=c(2,2))

plot(date, globalActivePower, type = "l", xlab = "",ylab = "Global Active Power")

plot(date,voltage,type="l",xlab="datetime",ylab="Voltage")

plot(date, submetering1,type="l",xlab = "",ylab = "Energy sub metering")
lines(date,submetering2,type="l",col="red")
lines(date,submetering3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,lwd = 2,col = c("black","red","blue"),bty = "o")

plot(date,globalreactivepower,type = "l",xlab = "datetime",ylab = "Global_reactive_power")

dev.off()
