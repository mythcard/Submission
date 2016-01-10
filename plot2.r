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

##as.Date(data1$Date)

strptime(data1$Time,'h:m:s')

#create a subset of date_time and globalActivePower from data1
date_time <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data1$Global_active_power)
png("plot2.png", width=480, height=480)
plot(date_time, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()