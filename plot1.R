#read data from source

rawdata <- read.csv("./data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

#convert to Date format

rawdata$Date <- as.Date(rawdata$Date, format="%d/%m/%Y")

#subsetting

data <- subset(rawdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#create DateTime column

datetime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(datetime)

#create histogramm
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

#copy to png file
dev.copy(png, file = "plot1.png", height=480, width=480)
dev.off()