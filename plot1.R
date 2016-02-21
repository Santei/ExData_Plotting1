# This code generates the first plot of the ExData_Plotting1 project

# Read the data from the text file while replacing the "?" with NA
hPowerConsumption<- read.table("household_power_consumption.txt",
            		      		sep = ";",
                          		header = TRUE,
                          		na.strings = "?")

# Select the data for the two dates (2007-02-01 and 2007-02-02)
selected_data <- hPowerConsumption[hPowerConsumption$Date %in% c("1/2/2007","2/2/2007"),]

# Disable scientific notation in R
options(scipen = 999)
# Create a graphics device for the plot
png(file = "plot1.png", width = 500, height = 500, units = "px")

# Plot the hist
hist(selected_data$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
 # Close the png file device
dev.off()


