
# check if data file present, if not download.
if(!file.exists("./household_power_consumption.txt")){
  url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 
  download.file(url,destfile="./household_power_consumption.zip",method="curl") 
  unzip("./household_power_consumption.zip")
}
# load data file
power.data <-read.csv2("./household_power_consumption.txt",na.strings="?")
#pull out 2 dates of interest
feb1 <- power.data[(as.Date(strptime(power.data$Date,"%d/%m/%Y")) - as.Date("2007-02-01") == 0),]
feb2 <- power.data[(as.Date(strptime(power.data$Date,"%d/%m/%Y")) - as.Date("2007-02-02") == 0),]
feb.1st.and.2nd.power.data <- rbind.data.frame(feb1,feb2)

#make graph as png file, use default white background
png("./figure/plot4.png",width = 480, height = 480)
#set 2x2 plot grid
par(mfcol=c(2,2))
#first graph
plot(as.numeric(as.character(feb.1st.and.2nd.power.data$Global_active_power)),
     ylab="Global Active Power",type="l", xlab="", xaxt="n")
#add x-axis
axis(at=c(1,1440,2880),side=1,labels=c("Thu","Fri","Sat"))

#second graph

plot(as.numeric(as.character(feb.1st.and.2nd.power.data$Sub_metering_1)),
     ylab="Enegy sub metering",type="l", xlab="", xaxt="n")
#add x-axis
axis(at=c(1,1440,2880),side=1,labels=c("Thu","Fri","Sat"))
#add second data set
points(as.numeric(as.character(feb.1st.and.2nd.power.data$Sub_metering_2)),type="l",col="red")
#add third data set
points(as.numeric(as.character(feb.1st.and.2nd.power.data$Sub_metering_3)),type="l",col="blue")
legend("topright",lwd=1,col=c("black","red","blue"),bty="n",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 


#graph 3
plot(as.numeric(as.character(feb.1st.and.2nd.power.data$Voltage)),
     ylab="Voltage",type="l", xlab="datetime", xaxt="n")
#add x-axis
axis(at=c(1,1440,2880),side=1,labels=c("Thu","Fri","Sat"))

#graph 4
plot(as.numeric(as.character(feb.1st.and.2nd.power.data$Global_reactive_power)),
     ylab="Global_reactive_power",type="l", xlab="datetime", xaxt="n")
#add x-axis
axis(at=c(1,1440,2880),side=1,labels=c("Thu","Fri","Sat"))
dev.off()