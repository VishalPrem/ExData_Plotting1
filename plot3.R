data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE)
data1<-data
data1$Date<-strptime(data1$Date,"%d/%m/%Y")
data1$Date<-as.Date(data1$Date)
date1<-as.Date("2007-02-01")
date2<-as.Date("2007-02-02")
data2<-data1[data1$Date>=date1 & data1$Date<=date2,]
data2$Global_active_power<-as.numeric(as.character(data2$Global_active_power))
data3<-cbind(data2,actual=strptime(paste(data2$Date, data2$Time), "%Y-%m-%d %H:%M:%S"))
data3$Sub_metering_1<-as.numeric(data3$Sub_metering_1)
data3$Sub_metering_2<-as.numeric(data3$Sub_metering_2)
data3$Sub_metering_3<-as.numeric(data3$Sub_metering_3)
plot(data3$Sub_metering_1~data3$actual,type="l",xlab=NA,ylab="Energy sub metering")
lines(data3$Sub_metering_2~data3$actual,col="red")
lines(data3$Sub_metering_3~data3$actual,col="blue")

legend("topright",pch="--",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="plot3.png")
dev.off()