data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE)
data1<-data
data1$Date<-strptime(data1$Date,"%d/%m/%Y")
data1$Date<-as.Date(data1$Date)
date1<-as.Date("2007-02-01")
date2<-as.Date("2007-02-02")
data2<-data1[data1$Date>=date1 & data1$Date<=date2,]
data2$Global_active_power<-as.numeric(as.character(data2$Global_active_power))
data3<-cbind(data2,actual=strptime(paste(data2$Date, data2$Time), "%Y-%m-%d %H:%M:%S"))
plot(data3$Global_active_power~data3$actual,type="l",xlab=NA,ylab="Global_active_power(kilowatts)")
dev.copy(png,file="plot2.png")
dev.off()