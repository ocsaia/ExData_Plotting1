#read data from source

rawdata <- read.csv("./data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

#convert to Date format

rawdata$Date <- as.Date(rawdata$Date, format="%d/%m/%Y")

#subsetting

data <- subset(rawdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#create DateTime column

datetime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(datetime)

#create plot3
with(data, {
  plot(Sub_metering_1~DateTime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~DateTime, col="red")
  lines(Sub_metering_3~DateTime, col="blue")
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_meterting_1","Sub_meterting_2","Sub_meterting_3"))


#copy to png file
dev.copy(png, file = "plot3.png", height=480, width=480)
dev.off()