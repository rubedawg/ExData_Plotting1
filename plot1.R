## JHU 'Exploratory Data Analysis Course'
## Week 1 Project
## Ruben Jongstra
## April 1, 2017
## Plot 1/4

# Read Data into R, format and subset to extract only the data needed to create desired graphic
file <- "./household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
finalData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Reformat data in Global_active_power column as numeric
finalData$Global_active_power <- as.numeric(as.character(finalData$Global_active_power))

# Create histogram of Global_active_power as per project directions
hist(finalData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

# Save histogram as "plot1.png" file
dev.copy(png, file = "plot1.png")

dev.off()