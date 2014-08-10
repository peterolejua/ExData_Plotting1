# Read the data assuming the file "household_power_consumption.txt" is in
# your working directory
HPC <- read.csv("household_power_consumption.txt", 
                sep=";", 
                na.strings="?")

# Take a look at the data
summary(HPC)
str(HPC)

# Change HPC$Date to date format
HPC$Date <- as.Date(x = HPC$Date, format = "%d/%m/%Y")

# We will only be using data from the dates 2007-02-01 and 2007-02-02.
HPC2 <- subset(x = HPC,subset = Date>="2007-02-01" & Date<="2007-02-02")

# Change HPC2$Time to time format
x <- strptime(paste(HPC2$Date,HPC2$Time),format="%Y-%m-%d %H:%M:%S")

# For days in English
Sys.setlocale("LC_TIME", "en_US.UTF-8")

# Make the plot
with(HPC2,plot(x,Global_active_power,
               type="l",
               xlab="",
               ylab="Global Active Power (kilowatts)")
     )

# Copy to png
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
