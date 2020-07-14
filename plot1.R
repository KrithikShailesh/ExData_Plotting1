File <-"./household_power_consumption.txt"
data <- read.table(File,sep = ";",header=T,stringsAsFactors = F,dec=".")
subSet <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

globalActivePower <- as.numeric(subSet$Global_active_power)
png("plot1.png",width=480,height=480)
hist(globalActivePower,col="red",main = "Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()