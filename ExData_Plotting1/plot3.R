## Plot3
## Household_power_consumption data would be read from current directory for the period of
## 2007-02-01 and 2007-02-02 using read.table into the variable "data"
data<-read.table("./household_power_consumption.txt",header=FALSE,sep=";",na.strings=c("?"),skip=66637,nrow=2881)

date_time<-paste(as.character(data$V1),as.character(data$V2))  ## Coercing column V2 from time 
data$V2<-as.POSIXct(strptime(date_time, "%d/%m/%Y %H:%M:%S"))  ## to POSIXct format.

## Since I want my plot3 graph to be in png format I am opening plot3.png file in my current
## working directory
png(file="plot3.png", width=480,height=480)

## A base graph would be plot using plot function from "data" with and weekday over x-axis
## "Energy sub metering" in y-axis  with balck,red and blue color for submeter 1,2 and 3,
## and this would be send to file plot3.png

plot(data$V7~data$V2,type="l",ylab="Energy sub metering",xlab="",xaxt="n")
lines(data$V8~data$V2,col="red")
lines(data$V9~data$V2,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"))
at=format(data$V2,"%H:%M:%S") %in% c("00:00:00") & format(data$V2,"%d") %in% c("01","02","03")
axis(1,at=data$V2[at],labels=format(data$V2[at],"%a"),lwd=0)

dev.off()  ## close the png file device.

