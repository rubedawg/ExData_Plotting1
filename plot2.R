## JHU 'Exploratory Data Analysis Course'
## Week 1 Project
## Ruben Jongstra
## April 1, 2017
## Plot 2/4

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
plot(finalData$Global_active_power~finalData$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab = "")

# Save histogram as "plot2.png" file
dev.copy(png, file = "plot2.png")

dev.off()