setwd("~/R Programming/Exploratory Data Week 1")
dt <- read.csv("household_power_consumption.txt",header=T,sep=';',na.strings='?'
               ,nrows=2075259,check.names=F,stringsAsFactors = F,comment.char=""
               ,quote='\"')
dt1 <- subset(dt,Date %in% c("1/2/2007","2/2/2007"))
dt1$Date <- dt1$Date <- as.Date(dt1$Date, format = "%d/%m/%Y")
hist(dt1$Global_active_power,col='red',xlab= "Global Active Power (kilowatts)"
     ,ylab="Frequency",main="Global Active Power")
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
