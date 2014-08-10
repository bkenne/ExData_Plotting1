##Generates Plot 3 for Exploratory Data Analysis Project 1

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

## Generate Plot3
  ##Execute Plot Function within With
  with(housesub, plot(DateTime, as.numeric(Sub_metering_1), type="l", ylab="Energy sub metering", xlab=""))
  with(housesub, lines(DateTime, as.numeric(Sub_metering_2), col="red"))
  with(housesub, lines(DateTime, as.numeric(Sub_metering_3), col="blue"))
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,  col=c("black","red","blue"))
  ##copy to png file
  dev.copy(png, file = "plot3.png", width=480, height=480)
  ##close device
  dev.off()