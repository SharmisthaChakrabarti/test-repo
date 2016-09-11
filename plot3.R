## Download the data in the data folder

if(!file.exists("./data")){dir.create("./data")}
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".", na.string = "?")

# View(data)
# str(data)

## Subsetting the data 
subdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# View(subdata)
# str(subdata)

## Convert the Date and Time variables to Date/Time classes
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Plot and save it to a PNG file

png(file = "plot3.png", width=480, height=480)
plot(datetime,subdata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")   # generate the 1st plot
lines(datetime,subdata$Sub_metering_2, type = "l", col="red")                                # generate the 2nd plot using annotation function "lines"
lines(datetime,subdata$Sub_metering_3, type = "l", col="blue")                               # generate the 3rd plot using annotation function "lines"
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))    # generate the legend

dev.off()