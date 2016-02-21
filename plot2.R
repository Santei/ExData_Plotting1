# This code generates the second plot of the ExData_Plotting1 project

# Read the data from the text file while replacing the "?" with NA
hPowerConsumption<- read.table("household_power_consumption.txt",
            		      		sep = ";",
                          		header = TRUE,
                          		na.strings = "?")

# Select the data for the two dates (2007-02-01 and 2007-02-02)
selected_data <- hPowerConsumption[hPowerConsumption$Date %in% c("1/2/2007","2/2/2007"),]

# Create a new date column which combines date and time 
selected_data$timestamp <- strptime(paste(selected_data$Date, selected_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# Create a graphics device for the file
png(file = "plot2.png", width = 500, height = 500)

# Plot the graph
plot(selected_data$timestamp , selected_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Close the device
dev.off()