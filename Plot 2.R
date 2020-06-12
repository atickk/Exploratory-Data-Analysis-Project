projectdata <- read.table("C:/Users/atiq.rehman/Desktop/Data Science Practice/Exploratory data/Project 1/Household Power Consumption/household_power_consumption.txt", skip = 1, sep = ";")
names(projectdata) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
subsetofprojectdata <- projectdata[projectdata$Date %in% c("1/2/2007","2/2/2007") ,]
globalactivepower <- as.numeric(subsetofprojectdata$Global_active_power)

subsetofprojectdata$Date <- as.Date(subsetofprojectdata$Date, format = "%d/%m/%Y")
subsetofprojectdata$Time <- strptime(subsetofprojectdata$Time, format = "%H:%M:%S")
subsetofprojectdata[1:1440, "Time"] <- format(subsetofprojectdata[1:1440, "Time"], "2007-02-01 %H:%M:%S")
subsetofprojectdata[1441:2880,"Time"] <- format(subsetofprojectdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png("plot2.png", width=500, height=500)

plot(subsetofprojectdata$Time, globalactivepower, type="l",  xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()