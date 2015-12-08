
## Read in power consumption dataset
ep<-read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)

## Add date/time combo field to dataset
ep$DateTm<-strptime(paste(ep[,1],ep[,2],sep=":"),"%d/%m/%Y:%H:%M:%S")

## Subset on only the dates we want
ep201_2<-ep[as.Date(ep$Date,"%d/%m/%Y")==as.Date("2007-02-01")|as.Date(ep$Date,"%d/%m/%Y")==as.Date("2007-02-02"),]

## Convert Global Active Power string to numeric
ep201_2[,3]=as.numeric(ep201_2[,3])


## Open png device for plotting
png("plot4.png")

## Set up 2 by 2 plot area
par(mfrow=c(2,2))

## Set the margins
par(mar=c(5.1,4.1,2.1,2.1))

## Plot the four line graphs
with(ep201_2, {
  plot(DateTm,Global_active_power,xlab="",ylab="Global Active Power",type="n")
  lines(DateTm,Global_active_power)
  
  plot(DateTm,Voltage,xlab="datetime",ylab="Voltage",type="n")
  lines(DateTm,Voltage)
  
  plot(ep201_2$DateTm,ep201_2$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  lines(ep201_2$DateTm,ep201_2$Sub_metering_1)
  lines(ep201_2$DateTm,ep201_2$Sub_metering_2,col="red")
  lines(ep201_2$DateTm,ep201_2$Sub_metering_3,col="blue")
  legend("topright",lty=c(1,1),col=c("black","red","blue"), bty="n",
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  plot(DateTm,Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="n")
  lines(DateTm,Global_reactive_power)
})
dev.off() ## Close the device
