#read data fron source

rawdata <- read.csv("./data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

#convert to Date format

rawdata$Date <- as.Date(rawdata$Date, format="%d/%m/%Y")

#Subsetting

data <- subset(rawdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#create DateTime column

datetime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(datetime)

#create plot2
plot(data$Global_active_power~data$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#copy to png file
dev.copy(png, file = "plot2.png", height=480, width=480)
dev.off()