########## Script to create a chart of energy sub metering for data
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
png(filename="plot3.png",width=480, height=480)
with(data_input,plot(datetime, Sub_metering_1, type="n", xlab="", 
                     ylab="Energy sub metering"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1)
with(data_input,points(datetime, Sub_metering_1, type="l", col="black"))
with(data_input,points(datetime, Sub_metering_2, type="l", col="red"))
with(data_input,points(datetime, Sub_metering_3, type="l", col="blue"))
dev.off()