
initial <- read.table("household_power_consumption.txt", nrows = 100, sep = ';')
classes <- sapply(initial, class)

allhouseholdpowerdata <- read.csv("household_power_consumption.txt", sep = ';',
                                  colClasses = c("character", "character", "character", "character","character" ,"character", "character", "character" ,"character"))

allhouseholdpowerdata$Date <- as.Date(allhouseholdpowerdata$Date, "%d/%m/%Y")
allhouseholdpowerdata$Global_active_power <- as.numeric(allhouseholdpowerdata$Global_active_power)
twodayhouseholdpowerdata <- subset(allhouseholdpowerdata, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

png(filename = "plot1.png", width =480 , height = 480)
hist(twodayhouseholdpowerdata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()