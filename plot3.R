setwd("~/R Programming/Exploratory Data Week 1")
dt <- read.csv("household_power_consumption.txt",header=T,sep=';',na.strings='?'
               ,nrows=2075259,check.names=F,stringsAsFactors = F,comment.char=""
               ,quote='\"')
dt1 <- subset(dt,Date %in% c("1/2/2007","2/2/2007"))
dt1$Date <- dt1$Date <- as.Date(dt1$Date, format = "%d/%m/%Y")
dt1time <- paste(as.Date(dt1$Date),dt1$Time)
dt1$Datetime <- as.POSIXct(dt1time)

with(dt1,{
        plot(Sub_metering_1~Datetime,type='l',ylab="Global Active Power (kilowatts)"
             ,xlab="")
        lines(Sub_metering_2~Datetime,col='red')
        lines(Sub_metering_3~Datetime,col='blue')
})
legend("topright", col=c('black','red','blue'),lty=1,lwd=2,
       legend =c("Sub_metering_1",'Sub_metering_2','Sub_metering_3'))

dev.copy(png,file="plot3.png",width=480,height=480)
dev.off