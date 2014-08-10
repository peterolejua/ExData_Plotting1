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


# divide the screen into 4
par(mfcol=c(2,2))

# Make the plot a
with(HPC2,plot(x,Global_active_power,
               type="l",
               xlab="",
               ylab="Global Active Power")
)

# plot b
with(HPC2,plot(x,Sub_metering_1,
               type="l",
               xlab="",
               ylab="Energy sub metering")
     )
with(HPC2,lines(x,Sub_metering_2,col="red"))
with(HPC2,lines(x,Sub_metering_3,col="slateblue"))
legend(cex=0.6,"topright",lty=1,col=c("black","red","slateblue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Make the plot c
with(HPC2,plot(x,Voltage,
               type="l",
               xlab="datetime",
               ylab="Voltage")
)

# Make the plot d
with(HPC2,plot(x,Global_reactive_power,
               type="l",
               xlab="datetime",
              )
)
# Copy to png
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
