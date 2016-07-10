#read data from source

rawdata <- read.csv("./data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

#convert to Date format

rawdata$Date <- as.Date(rawdata$Date, format="%d/%m/%Y")

#subsetting

data <- subset(rawdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#create DateTime column

datetime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(datetime)

#create plot4
par(mfcol=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(data, {
  plot(Global_active_power~DateTime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Sub_metering_1~DateTime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Voltage~DateTime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Global_reactive_power~DateTime, type="l", 
       ylab="Global_reactive_power",xlab="datetime")
})


#copy to png file
dev.copy(png, file = "plot4.png", height=480, width=480)
dev.off()