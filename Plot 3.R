projectdata <- read.table("C:/Users/atiq.rehman/Desktop/Data Science Practice/Exploratory data/Project 1/Household Power Consumption/household_power_consumption.txt", skip = 1, sep = ";")
names(projectdata) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
subsetofprojectdata <- projectdata[projectdata$Date %in% c("1/2/2007","2/2/2007") ,]
globalactivepower <- as.numeric(subsetofprojectdata$Global_active_power)
dateandtime <- strptime(paste(subsetofprojectdata$Date, subsetofprojectdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

submetering1 <- as.numeric(subsetofprojectdata$Sub_metering_1)
submetering2 <- as.numeric(subsetofprojectdata$Sub_metering_2)
submetering3 <- as.numeric(subsetofprojectdata$Sub_metering_3)

png("plot3.png", width=500, height=500)

plot(dateandtime, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateandtime, submetering2, type="l", col="red")
lines(dateandtime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
