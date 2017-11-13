plot1 <- function(...){
     library(data.table)
     fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
     temp <- tempfile()
     download.file(fileUrl, temp)
     data <- fread(unzip(temp, files = "household_power_consumption.txt"))
     rm(temp)
     data$Date <- as.Date(data$Date, format="%d/%m/%Y")
     datasub <- data[Date %between% c("2007-02-01", "2007-02-02")]
     datasub$Global_active_power <- as.numeric(datasub$Global_active_power)
     png(filename = "plot1.png")
     hist(datasub$Global_active_power, breaks=12, xlab="Global Active Power(kilowatts)", col="red", main="Global Active Power")
     dev.off()
}