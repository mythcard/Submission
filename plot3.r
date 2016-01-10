colNames <- names(read.table("household_power_consumption.txt", nrow=1, header=TRUE, sep=";"))

###command to selectively fetch the data
data1 <- read.table("household_power_consumption.txt",
na.strings = "?",
sep = ";",
header = FALSE,
col.names = colNames,
skip = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"))-1,
nrow = 2879
)

date_time <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data1$Global_active_power)
sub_Metering1 <- as.numeric(data1$Sub_metering_1)
sub_Metering2 <- as.numeric(data1$Sub_metering_2)
sub_Metering3 <- as.numeric(data1$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(date_time, sub_Metering1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, sub_Metering2, type="l", col="red")
lines(date_time, sub_Metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()