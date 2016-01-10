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

as.Date(data1$Date)

strptime(data1$Time,'h:m:s')

png("plot1.png", width=480, height=480)
hist(data1$Global_active_power, col= "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)", ylab = "Frequency",xlim=c(0, 6))
dev.off()
