

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

## Plot the histogram and save it to a PNG file

png(file = "plot1.png", width=480, height=480)
hist(subdata$Global_active_power, xlab = "Global Active Power (Kilowatts)", main = "Global Active Power", col = "red")
dev.off()