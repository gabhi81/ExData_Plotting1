householdPowerConData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
householdPowerConData$Time <- as.POSIXct(paste(householdPowerConData$Date, householdPowerConData$Time),format="%d/%m/%Y %H:%M:%S")

householdPowerConData$Date <- as.Date(householdPowerConData$Date,"%d/%m/%Y")

fromDate <- as.Date("01/02/2007", "%d/%m/%Y") 
toDate <- as.Date("02/02/2007", "%d/%m/%Y") 
householdPowerConDataForDates <- subset(householdPowerConData, householdPowerConData$Date == fromDate | householdPowerConData$Date == toDate)

householdPowerConDataForDates$Global_active_power <- as.character(householdPowerConDataForDates$Global_active_power)
householdPowerConDataForDates <- householdPowerConDataForDates[householdPowerConDataForDates$Global_active_power != "?",]

householdPowerConDataForDates$Global_active_power <- as.numeric(householdPowerConDataForDates$Global_active_power)

png(filename = "plot2.png",  width = 480, height = 480, units = "px")
with(householdPowerConDataForDates, plot(householdPowerConDataForDates$Time, householdPowerConDataForDates$Global_active_power,
                                          type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()