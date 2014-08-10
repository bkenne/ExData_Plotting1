##Generates Plot 1 for Exploratory Data Analysis Project 1

##Read in Data
house<-fread("household_power_consumption.txt", sep=";", header="auto",na.strings=c("?"))

##Subset Data
housesub<-house[house$Date=="1/2/2007" | house$Date=="2/2/2007"]

##Remove house to save memory
house <- NULL

##Generate Histogram
hist(as.numeric(housesub$Global_active_power),col = "red",main="Global Active Power", xlab = "Global Active Power (kilowatts)")

##copy to png file
dev.copy(png, file = "plot1.png", width=480, height=480)

##close device
dev.off()