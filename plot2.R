
# check if data file present, if not download.
if(!file.exists("./household_power_consumption.txt")){
  url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 
  download.file(url,destfile="./household_power_consumption.zip",method="curl") 
  unzip("./household_power_consumption.zip")
}
#laod data
power.data <-read.csv2("./household_power_consumption.txt",na.strings="?")
#pull out 2 dates of interest
feb1 <- power.data[(as.Date(strptime(power.data$Date,"%d/%m/%Y")) - as.Date("2007-02-01") == 0),]
feb2 <- power.data[(as.Date(strptime(power.data$Date,"%d/%m/%Y")) - as.Date("2007-02-02") == 0),]
feb.1st.and.2nd.power.data <- rbind.data.frame(feb1,feb2)
 
#make graph as png file,  use default white background
png("./figure/plot2.png",width = 480, height = 480)
plot(as.numeric(as.character(feb.1st.and.2nd.power.data$Global_active_power)),
     ylab="Global Active Power (kilowatts)",type="l", xlab="", xaxt="n")
#add x-axis
axis(at=c(1,1440,2880),side=1,labels=c("Thu","Fri","Sat"))
dev.off()