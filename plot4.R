# This code generates the fourth plot of the ExData_Plotting1 project

# Read the data from the text file while replacing the "?" with NA
hPowerConsumption<- read.table("household_power_consumption.txt",
            		      		sep = ";",
                          		header = TRUE,
                          		na.strings = "?")

# Select the data for the two dates (2007-02-01 and 2007-02-02)
selected_data <- hPowerConsumption[hPowerConsumption$Date %in% c("1/2/2007","2/2/2007"),]

# Create a new date column which combines date and time 
selected_data$timestamp <- strptime(paste(selected_data$Date, selected_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# Create a vector to represent the colours of the lines for the submeters
columnlines <- c("black", "red", "blue")

# Create a vector of submeters labeld
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Create a graphics device for the file
png(file = "plot4.png", width = 500, height = 500)

# Set the number of graphs to 4
par(mfrow=c(2,2))

# Graph 1
plot(selected_data$timestamp, selected_data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
# Graph 2
plot(selected_data$timestamp, selected_data$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")

# Graph 3
plot(selected_data$timestamp, selected_data$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")

# Add the lines for the other two submeters
lines(selected_data$timestamp, selected_data$Sub_metering_2, col=columnlines[2])
lines(selected_data$timestamp, selected_data$Sub_metering_3, col=columnlines[3])

# Graph 4
plot(selected_data$timestamp, selected_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# Close the device
dev.off()