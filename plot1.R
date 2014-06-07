
# load data file
power.data <-read.csv2("./household_power_consumption.txt",na.strings="?")
#pull out 2 dates of interest
feb1 <- power.data[(as.Date(strptime(power.data$Date,"%d/%m/%Y")) - as.Date("2007-02-01") == 0),]
feb2 <- power.data[(as.Date(strptime(power.data$Date,"%d/%m/%Y")) - as.Date("2007-02-02") == 0),]
feb.1st.and.2nd.power.data <- rbind.data.frame(feb1,feb2)
#draw histagram on screen so can see how it looks.
hist(as.numeric(as.character(feb1.2.power.data$Global_active_power)),
     col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
#make histagram as png file
png("./figure/plot1.png",width = 480, height = 480)
hist(as.numeric(as.character(feb1.2.power.data$Global_active_power)),
     col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()