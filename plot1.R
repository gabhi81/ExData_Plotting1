householdPowerConData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

householdPowerConData$Time <- as.POSIXct(paste(householdPowerConData$Date, householdPowerConData$Time),format="%d/%m/%Y %H:%M:%S")
householdPowerConData$Date <- as.Date(householdPowerConData$Date,"%d/%m/%Y")

fromDate <- as.Date("01/02/2007", "%d/%m/%Y") 
toDate <- as.Date("02/02/2007", "%d/%m/%Y") 
householdPowerConDataSpecDates <- subset(householdPowerConData, householdPowerConData$Date == fromDate | householdPowerConData$Date == toDate)

specDatesAsChar <- as.character(householdPowerConDataSpecDates$Global_active_power)
specDatesAsChar <- specDatesAsChar[specDatesAsChar != "?"]
specDatesAsNum <- as.numeric(specDatesAsChar)

png(filename = "plot1.png",  width = 480, height = 480, units = "px")
hist(specDatesAsNum, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()