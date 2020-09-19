
initial <- read.table("household_power_consumption.txt", nrows = 100, sep = ';')
classes <- sapply(initial, class)

allhouseholdpowerdata <- read.csv("household_power_consumption.txt", sep = ';',
                                  colClasses = c("character", "character", "character", "character","character" ,"character", "character", "character" ,"character"))

allhouseholdpowerdata$Date <- as.Date(allhouseholdpowerdata$Date, "%d/%m/%Y")
allhouseholdpowerdata$Global_active_power <- as.numeric(allhouseholdpowerdata$Global_active_power)
twodayhouseholdpowerdata <- subset(allhouseholdpowerdata, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

png(filename = "plot2.png", width =480 , height = 480)

twodayhouseholdpowerdata$DateTime <-strptime(  paste(twodayhouseholdpowerdata$Date, twodayhouseholdpowerdata$Time), "%Y-%m-%d%H:%M:%S")
plot(x= twodayhouseholdpowerdata$DateTime, y=twodayhouseholdpowerdata$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()
