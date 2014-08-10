# Read the data assuming the file "household_power_consumption.txt" is in
# your working directory
HPC <- read.csv("household_power_consumption.txt", 
                sep=";", 
                na.strings="?")

# Take a look at the data
summary(HPC)
str(HPC2)

# Change HPC$Date to date format
HPC$Date <- as.Date(x = HPC$Date, format = "%d/%m/%Y")

# We will only be using data from the dates 2007-02-01 and 2007-02-02.
HPC2 <- subset(x = HPC,subset = Date>="2007-02-01" & Date<="2007-02-02")

# Change HPC2$Time to time format
HPC2$Time <- strptime(HPC2$Time,format="%H:%M:%S")

# Make the plot
with(HPC2,hist(Global_active_power,
               main = "Global Active Power",
               xlab = "Global Active Power (kilowatts)",
               col = "red")
     )

# Copy to png
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
