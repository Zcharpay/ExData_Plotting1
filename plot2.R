########## Script to create a chart of Global active power (kW) for data
########## on 1st and 2nd Feb 2007

## Load dependencies
library(lubridate)

## Read in data from txt file. The file is large, so only read in the required rows
data_names <- read.table("household_power_consumption.txt", header=FALSE,nrows = 1, 
                         stringsAsFactors = FALSE,sep=";")
data_input <- read.table("household_power_consumption.txt", header=TRUE,skip = 66636,
                         nrows = 2880,na.strings = "?", stringsAsFactors = FALSE,
                         col.names = data_names,sep=";")

## convert the date-time fields in the data from character type
data_input$datetime <- dmy_hms(with(data_input, paste(Date,Time)))

## plot the chart to PNG file
png(filename="plot2.png",width=480, height=480)
with(data_input, plot(datetime,Global_active_power, type="l", xlab="",
                      ylab = "Global Active Power (kilowatts)"))
dev.off()