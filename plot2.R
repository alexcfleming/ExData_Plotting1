plot2 <- function(...){
     library(data.table)
     fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
     temp <- tempfile()
     download.file(fileUrl, temp)
     data <- fread(unzip(temp, files = "household_power_consumption.txt"))
     rm(temp)
     data$Date <- as.Date(data$Date, format="%d/%m/%Y")
     datasub <- data[Date %between% c("2007-02-01", "2007-02-02")]
     datasub$DateTime <- as.POSIXct(paste(datasub$Date, datasub$Time))
     datasub$Global_active_power <- as.numeric(datasub$Global_active_power)
     datasub$Global_reactive_power <- as.numeric(datasub$Global_reactive_power)
     datasub$Voltage <- as.numeric(datasub$Voltage)
     datasub$Sub_metering_1 <- as.numeric(datasub$Sub_metering_1)
     datasub$Sub_metering_2 <- as.numeric(datasub$Sub_metering_2)
     datasub$Sub_metering_3 <- as.numeric(datasub$Sub_metering_3)
     png(filename = "plot2.png")
     #insert plot command here
     plot(datasub$DateTime, datasub$Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)")
     dev.off()
}