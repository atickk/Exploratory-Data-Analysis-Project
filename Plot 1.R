projectdata <- read.table("C:/Users/atiq.rehman/Desktop/Data Science Practice/Exploratory data/Project 1/Household Power Consumption/household_power_consumption.txt", skip = 1, sep = ";")
names(projectdata) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
subsetofprojectdata <- projectdata[projectdata$Date %in% c("1/2/2007","2/2/2007") ,]
globalactivepower <- as.numeric(subsetofprojectdata$Global_active_power)

hist(globalactivepower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
