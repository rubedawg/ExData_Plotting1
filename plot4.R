## JHU 'Exploratory Data Analysis Course'
## Week 1 Project
## Ruben Jongstra
## April 1, 2017
## Plot 4/4

# Read Data into R, format and subset to extract only the data needed to create desired graphic
file <- "./household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
finalData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Reformat Date data is in the right format
finalData$Date <- as.Date(finalData$Date, format="%d/%m/%Y")
tempData <- paste(as.Date(finalData$Date), finalData$Time)
finalData$Datetime <- as.POSIXct(tempData)
rm(tempData)

# Create four plots
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(finalData, {
        plot(Global_active_power~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~Datetime, type="l", 
             ylab="Voltage (volt)", xlab="")
        plot(Sub_metering_1~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l", 
             ylab="Global Rective Power (kilowatts)",xlab="")
})

# Save histogram as "plot4.png" file
dev.copy(png, file = "plot4.png")

dev.off()