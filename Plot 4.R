projectdata <- read.table("C:/Users/atiq.rehman/Desktop/Data Science Practice/Exploratory data/Project 1/Household Power Consumption/household_power_consumption.txt", skip = 1, sep = ";")
names(projectdata) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
subsetofprojectdata <- projectdata[projectdata$Date %in% c("1/2/2007","2/2/2007") ,]

dateandtime <- strptime(paste(subsetofprojectdata$Date, subsetofprojectdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactivepower <- as.numeric(subsetofprojectdata$Global_active_power)
globalreactivepower <- as.numeric(subsetofprojectdata$Global_reactive_power)
submetering1 <- as.numeric(subsetofprojectdata$Sub_metering_1)
submetering2 <- as.numeric(subsetofprojectdata$Sub_metering_2)
submetering3 <- as.numeric(subsetofprojectdata$Sub_metering_3)
voltage <- as.numeric(subsetofprojectdata$Voltage)

png("plot4.png", width=500, height=500)
par(mfrow = c(2, 2))

plot(dateandtime, globalactivepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(dateandtime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(dateandtime, submetering1, type="l", ylab="Energy Submetering", xlab="")

lines(dateandtime, submetering2, type="l", col="red")
lines(dateandtime, submetering3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dateandtime, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()