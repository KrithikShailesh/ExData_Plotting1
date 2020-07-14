File <-"./household_power_consumption.txt"
data <- read.table(File,sep = ";",header=T,stringsAsFactors = F,dec=".")
subSet <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

date <- strptime(paste(subSet$Date, subSet$Time,sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subSet$Global_active_power)
png("plot2.png",width=480,height=480)
plot(date,globalActivePower,type = "l",xlab="",ylab = "Global Active Power (kilowatts)")
dev.off()