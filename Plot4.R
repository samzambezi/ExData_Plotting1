setwd("C:/Users/zambezis/Desktop/Data Science Coursera/Exploratory Analysis")

my_data <- file("./exdata-data-household_power_consumption (1)/household_power_consumption.txt")
plot_data <- read.table(text = grep("^[1,2]/2/2007", readLines(my_data), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
plot_data$x <- paste(plot_data$Date,plot_data$Time)
library(lubridate)

plot_data$x <- dmy_hms(as.factor(plot_data$x))

par(mfco1 = c(2,2))
## plot 2
plot_2 <- with(plot_data,plot(x,Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)"))
## plot 3
Sub_metering_1 <- with(plot_data,plot(x,Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
Sub_metering_2 <- lines(plot_data$x,plot_data$Sub_metering_2, type = "l", col = "red")
Sub_metering_3 <- lines(plot_data$x,plot_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty=1, cex = 0.7)
## plot4
plot_4 <- with(plot_data,plot(x,Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
plot_5 <- with(plot_data,plot(x,Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
## Save plot
dev.copy(png, file = "Plot4.png")
dev.off()
