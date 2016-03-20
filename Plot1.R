setwd("C:/Users/zambezis/Desktop/Data Science Coursera/Exploratory Analysis")
my_data <- file("./exdata-data-household_power_consumption (1)/household_power_consumption.txt")
library(tidyr)
## Get tidy data

plot_data <- read.table(text = grep("^[1,2]/2/2007", readLines(my_data), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
library(lubridate)
plot_data$Date <- dmy(as.factor(plot_data$Date))
plot_data$Time <- hms(as.factor(plot_data$Time))
plot_1 <- hist(plot_data$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)", ylab = "Frequency",main = "Global Active Power")
dev.copy(png, file = "Plot1.png")
dev.off()
