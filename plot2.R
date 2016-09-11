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

png(file = "plot2.png", width=480, height=480)
plot(datetime, subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()