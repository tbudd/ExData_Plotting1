
## Read in power consumption dataset
ep<-read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)

## Add date/time combo field to dataset
ep$DateTm<-strptime(paste(ep[,1],ep[,2],sep=":"),"%d/%m/%Y:%H:%M:%S")

## Subset on only the dates we want
ep201_2<-ep[as.Date(ep$Date,"%d/%m/%Y")==as.Date("2007-02-01")|as.Date(ep$Date,"%d/%m/%Y")==as.Date("2007-02-02"),]

## Convert Global Active Power string to numeric
ep201_2[,3]=as.numeric(ep201_2[,3])


## Open png device for plotting, plot the line graphs, close the device (i.e., print the png file)
png("plot3.png")
plot(ep201_2$DateTm,ep201_2$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(ep201_2$DateTm,ep201_2$Sub_metering_1)
lines(ep201_2$DateTm,ep201_2$Sub_metering_2,col="red")
lines(ep201_2$DateTm,ep201_2$Sub_metering_3,col="blue")
legend("topright",pch="-",col=c("black","red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))
dev.off()
