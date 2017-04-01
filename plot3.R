## JHU 'Exploratory Data Analysis Course'
## Week 1 Project
## Ruben Jongstra
## April 1, 2017
## Plot 3/4

# Read Data into R, format and subset to extract only the data needed to create desired graphic
file <- "./household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
finalData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Reformat Date data is in the right format
finalData$Date <- as.Date(finalData$Date, format="%d/%m/%Y")
tempData <- paste(as.Date(finalData$Date), finalData$Time)
finalData$Datetime <- as.POSIXct(tempData)
rm(tempData)

# Creates graph of date/time as per project directions
with(finalData, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save histogram as "plot3.png" file
dev.copy(png, file = "plot3.png")

dev.off()