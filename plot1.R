
## Read in power consumption dataset
ep<-read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)

## Convert string dates to internal date representation
ep[,1]<-as.Date(ep[,1],"%d/%m/%Y")

## Subset on only the dates we want
ep201_2<-ep[ep$Date==as.Date("2007-02-01")|ep$Date==as.Date("2007-02-02"),]

## Convert Global Active Power string to numeric
ep201_2[,3]=as.numeric(ep201_2[,3])

## Open png device for plotting, plot the histogram, close the device (i.e., print the png file)
png("plot1.png")
hist(ep201_2$Global_active_power,main="Global Active Power", xlab="Global Active Power (kilowatts)",col="red")
dev.off()
