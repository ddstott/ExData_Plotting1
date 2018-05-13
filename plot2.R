setwd("~/R Programming/Exploratory Data Week 1")
dt <- read.csv("household_power_consumption.txt",header=T,sep=';',na.strings='?'
               ,nrows=2075259,check.names=F,stringsAsFactors = F,comment.char=""
               ,quote='\"')
dt1 <- subset(dt,Date %in% c("1/2/2007","2/2/2007"))
dt1$Date <- dt1$Date <- as.Date(dt1$Date, format = "%d/%m/%Y")
dt1time <- paste(as.Date(dt1$Date),dt1$Time)
dt1$Datetime <- as.POSIXct(dt1time)
with(dt1, plot(Global_active_power~Datetime, type='l', 
               ylab= "Global Active Power (kilowatts)",xlab = ""))

dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()