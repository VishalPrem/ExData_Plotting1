data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE)
data1<-data
data1$Date<-strptime(data1$Date,"%d/%m/%Y")
data1$Date<-as.Date(data1$Date)
date1<-as.Date("2007-02-01")
date2<-as.Date("2007-02-02")
data2<-data1[data1$Date>=date1 & data1$Date<=date2,]
data2$Global_active_power<-as.numeric(as.character(data2$Global_active_power))
hist(data2$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power(kilowatts)")
dev.copy(png,file="plot1.png")