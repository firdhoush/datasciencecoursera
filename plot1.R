## Plot1
## Household_power_consumption data would be read from current directory for the period of
## 2007-02-01 and 2007-02-02 using read.table into the variable "data"
data<-read.table("./household_power_consumption.txt",header=FALSE,sep=";",na.strings=c("?"),skip=66637,nrow=2881)

## Since I want my plot1 graph to be in png format I am opening plot1.png file in my current
## working directory
png(file="plot1.png", width=480,height=480)

## A base graph would be plot using histogram function from "data" with "Global Active Power(Kilowatts)"
## in x-axis and "frequency" over y-axis and this would be send to file plot1.png
hist(data$V3,col="red",xlab="Global Active Power(Kilowatts)",main="Global Active Power")

dev.off()  ## close the png file device.