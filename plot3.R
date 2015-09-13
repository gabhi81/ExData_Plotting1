householdPowerConData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

householdPowerConData$Time <- as.POSIXct(paste(householdPowerConData$Date, householdPowerConData$Time),format="%d/%m/%Y %H:%M:%S")
householdPowerConData$Date <- as.Date(householdPowerConData$Date,"%d/%m/%Y")

fromDate <- as.Date("01/02/2007", "%d/%m/%Y") 
toDate <- as.Date("02/02/2007", "%d/%m/%Y") 
householdPowerConDataSpecDates <- subset(householdPowerConData, householdPowerConData$Date == fromDate | householdPowerConData$Date == toDate)

householdPowerConDataForDates$Sub_metering_1 <- as.character(householdPowerConDataForDates$Sub_metering_1)
householdPowerConDataForDates <- householdPowerConDataForDates[householdPowerConDataForDates$Sub_metering_1 != "?",]

householdPowerConDataForDates$Sub_metering_2 <- as.character(householdPowerConDataForDates$Sub_metering_2)
householdPowerConDataForDates$Sub_metering_1 <- as.numeric(householdPowerConDataForDates$Sub_metering_1)
householdPowerConDataForDates$Sub_metering_2 <- as.numeric(householdPowerConDataForDates$Sub_metering_2)

png(filename = "plot3.png",  width = 480, height = 480, units = "px")

with(householdPowerConDataForDates, plot(householdPowerConDataForDates$Time, householdPowerConDataForDates$Sub_metering_1,
                                          type = "l", xlab = "", ylab = "Energy sub metering" ))
with(householdPowerConDataForDates, lines(householdPowerConDataForDates$Time, householdPowerConDataForDates$Sub_metering_2, col = "red"))
with(householdPowerConDataForDates, lines(householdPowerConDataForDates$Time, householdPowerConDataForDates$Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)

dev.off()