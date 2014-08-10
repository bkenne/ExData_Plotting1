##Generates Plot 2 for Exploratory Data Analysis Project 1

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

## Generate Plot2
  ##Execute Plot Function
  plot(housesub$DateTime, as.numeric(housesub$Global_active_power), type="l", ylab="Global Active Power (kilowatts)", xlab="")
  ##copy to png file
  dev.copy(png, file = "plot2.png", width=480, height=480)
  ##close device
  dev.off()