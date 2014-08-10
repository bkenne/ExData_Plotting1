##Generates Plot 4 for Exploratory Data Analysis Project 1

##Read in Data
house <- fread("household_power_consumption.txt", sep=";", header="auto",na.strings=c("?"))

##Subset Data
housesub<-house[house$Date=="1/2/2007" | house$Date=="2/2/2007"]

##Create new field and store Date and Time
housesub <- within(housesub, DateTime <- paste(Date, Time, sep=" "))

##Remove house to save memory
house <- NULL

##Remove unnessary fields to save memory
housesub$Date = NULL
housesub$Time = NULL

##Convert DateTime field into true Date and Time Type
housesub$DateTime = as.POSIXct(strptime(housesub$DateTime, format = "%d/%m/%Y %H:%M:%S"))

##Set for multiple plot frames

par(mfrow = c(2, 2))

  ##Plot 1
  plot(housesub$DateTime, as.numeric(housesub$Global_active_power), type="l", ylab="Global Active Power", xlab="")

  ##Plot 2
  plot(housesub$DateTime, as.numeric(housesub$Voltage), type="l", ylab="Voltage", xlab="datetime")
  
  ##Plot 3
  with(housesub, plot(DateTime, as.numeric(Sub_metering_1), type="l", ylab="Energy sub metering", xlab=""))
  with(housesub, lines(DateTime, as.numeric(Sub_metering_2), col="red"))
  with(housesub, lines(DateTime, as.numeric(Sub_metering_3), col="blue"))
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,  col=c("black","red","blue"), bty="n")

  ##Plot 4
  plot(housesub$DateTime, as.numeric(housesub$Global_reactive_power), type="l", ylab="Global_reactive_power", xlab="datetime")

  dev.copy(png, file = "plot4.png", width=480, height=480)
  ##close device
  dev.off()