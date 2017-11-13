plot4 <- function(...){
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
     png(filename = "plot4.png")
     #insert plot commands here
     par(mfcol=c(2,2))
     plot(datasub$DateTime, datasub$Global_active_power, type="l", xlab="", ylab="Global Active Power")
     plot(datasub$DateTime, datasub$Sub_metering_1, type="l", xlab="", ylab="Global Active Power(kilowatts)")
     lines(datasub$DateTime, datasub$Sub_metering_2, col="red")
     lines(datasub$DateTime, datasub$Sub_metering_3, col="blue")
     legend("topright", lty=1, lwd=2, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     plot(datasub$DateTime, datasub$Voltage, type="l", xlab="datetime", ylab="Voltage")
     plot(datasub$DateTime, datasub$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
     dev.off()
}