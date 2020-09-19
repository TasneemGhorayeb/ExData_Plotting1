initial <- read.table("household_power_consumption.txt", nrows = 100, sep = ';')
classes <- sapply(initial, class)

allhouseholdpowerdata <- read.csv("household_power_consumption.txt", sep = ';',
                                  colClasses = c("character", "character", "character", "character","character" ,"character", "character", "character" ,"character"))

allhouseholdpowerdata$Date <- as.Date(allhouseholdpowerdata$Date, "%d/%m/%Y")
allhouseholdpowerdata$Global_active_power <- as.numeric(allhouseholdpowerdata$Global_active_power)
twodayhouseholdpowerdata <- subset(allhouseholdpowerdata, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
twodayhouseholdpowerdata$DateTime <-strptime(paste(twodayhouseholdpowerdata$Date, twodayhouseholdpowerdata$Time), "%Y-%m-%d%H:%M:%S")

png(filename = "plot4.png", width =480 , height = 480)
par(mfrow =c(2,2))

with(twodayhouseholdpowerdata, {
        
plot(x= twodayhouseholdpowerdata$DateTime, y=twodayhouseholdpowerdata$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")
plot(x= twodayhouseholdpowerdata$DateTime, y=twodayhouseholdpowerdata$Voltage, type = "l",xlab = "datetime", ylab = "Voltage")
        

with (twodayhouseholdpowerdata, plot(DateTime,Sub_metering_1 ,type="n", xlab = "", ylab = "Energy sub metering"))
points(twodayhouseholdpowerdata$DateTime,twodayhouseholdpowerdata$Sub_metering_1,col="black", type="l")
points(twodayhouseholdpowerdata$DateTime,twodayhouseholdpowerdata$Sub_metering_2,col="red", type="l")
points(twodayhouseholdpowerdata$DateTime,twodayhouseholdpowerdata$Sub_metering_3,col="blue",type="l")
legend("topright",lty=1 ,bty="n",col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


plot(x= twodayhouseholdpowerdata$DateTime, y=twodayhouseholdpowerdata$Global_reactive_power, type = "l", xlab = "datetime", ylab="Global_reactive_power")

})
dev.off()