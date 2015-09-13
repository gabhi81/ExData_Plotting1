householdPowerConData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

householdPowerConData$Time <- as.POSIXct(paste(householdPowerConData$Date, householdPowerConData$Time),format="%d/%m/%Y %H:%M:%S")
householdPowerConData$Date <- as.Date(householdPowerConData$Date,"%d/%m/%Y")

fromDate <- as.Date("01/02/2007", "%d/%m/%Y") 
toDate <- as.Date("02/02/2007", "%d/%m/%Y") 
householdPowerConDataForDates <- subset(householdPowerConData, householdPowerConData$Date == fromDate | householdPowerConData$Date == toDate)

##############
png(filename = "plot4.png",  width = 480, height = 480, units = "px")
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

householdPowerConDataForDates$Global_active_power <- as.character(householdPowerConDataForDates$Global_active_power)
householdPowerConDataForDates <- householdPowerConDataForDates[householdPowerConDataForDates$Global_active_power != "?",]
householdPowerConDataForDates$Global_active_power <- as.numeric(householdPowerConDataForDates$Global_active_power)
with(householdPowerConDataForDates, plot(householdPowerConDataForDates$Time, householdPowerConDataForDates$Global_active_power,
                                          type = "l", xlab = "", ylab = "Global Active Power" ))

################
householdPowerConDataForDates$Voltage <- as.character(householdPowerConDataForDates$Voltage)
householdPowerConDataForDates <- householdPowerConDataForDates[householdPowerConDataForDates$Voltage != "?",]
householdPowerConDataForDates$Voltage <- as.numeric(householdPowerConDataForDates$Voltage)
with(householdPowerConDataForDates, plot(householdPowerConDataForDates$Time, householdPowerConDataForDates$Voltage,
                                          type = "l", xlab = "datetime", ylab = "Voltage" ))

################
householdPowerConDataForDates$Sub_metering_1 <- as.character(householdPowerConDataForDates$Sub_metering_1)
householdPowerConDataForDates <- householdPowerConDataForDates[householdPowerConDataForDates$Sub_metering_1 != "?",]
householdPowerConDataForDates$Sub_metering_2 <- as.character(householdPowerConDataForDates$Sub_metering_2)
householdPowerConDataForDates$Sub_metering_1 <- as.numeric(householdPowerConDataForDates$Sub_metering_1)
householdPowerConDataForDates$Sub_metering_2 <- as.numeric(householdPowerConDataForDates$Sub_metering_2)
with(householdPowerConDataForDates, plot(householdPowerConDataForDates$Time, householdPowerConDataForDates$Sub_metering_1,
                                          type = "l", xlab = "", ylab = "Energy sub metering" ))
with(householdPowerConDataForDates, lines(householdPowerConDataForDates$Time, householdPowerConDataForDates$Sub_metering_2, col = "red"))
with(householdPowerConDataForDates, lines(householdPowerConDataForDates$Time, householdPowerConDataForDates$Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, bty = "n")

################
householdPowerConDataForDates$Global_reactive_power <- as.character(householdPowerConDataForDates$Global_reactive_power)
householdPowerConDataForDates <- householdPowerConDataForDates[householdPowerConDataForDates$Global_reactive_power != "?",]
householdPowerConDataForDates$Global_reactive_power <- as.numeric(householdPowerConDataForDates$Global_reactive_power)
with(householdPowerConDataForDates, plot(householdPowerConDataForDates$Time, householdPowerConDataForDates$Global_reactive_power,
                                          type = "l", xlab = "datetime", ylab = "Global_reactive_power" ))

dev.off()