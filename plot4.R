# Loading the full dataset 
fullset <- read.csv("household_power_consumption.txt",sep=";",header=TRUE) 

 
# Filtering on the dates 
filteredset <- subset(fullset,fullset$Date %in% c("1/2/2007","2/2/2007")) 
 
# In place data conversions 
filteredset$Time <- strptime(paste(filteredset$Date,filteredset$Time,sep = " "), "%d/%m/%Y %H:%M:%S") 
filteredset$Date <- strptime(filteredset$Date,"%d/%m/%Y") 
filteredset$Global_active_power <- as.numeric(as.character(filteredset$Global_active_power)) 
filteredset$Voltage <- as.numeric(as.character(filteredset$Voltage)) 
filteredset$Global_reactive_power <- as.numeric(as.character(filteredset$Global_reactive_power)) 
filteredset$Sub_metering_1 <- as.numeric(as.character(filteredset$Sub_metering_1)) 
filteredset$Sub_metering_2 <- as.numeric(as.character(filteredset$Sub_metering_2)) 
filteredset$Sub_metering_3 <- as.numeric(as.character(filteredset$Sub_metering_3)) 
 
 
# Plot drawing 
png("Plot4.png",width= 480, height = 480,  units= "px") 
par(mfrow = c(2,2)) 

plot(x = filteredset$Time, y = filteredset$Global_active_power, type = "l", xlab="",ylab="Global Active Power (kilowatts)") 
plot(x = filteredset$Time, y = filteredset$Voltage, type = "l", xlab="datetime",ylab="Voltage") 
plot(x = filteredset$Time, y = filteredset$Sub_metering_1, col ="black", type = "l", xlab="",ylab="Energy sub metering") 
lines(x = filteredset$Time, y = filteredset$Sub_metering_2, col ="red") 
lines(x = filteredset$Time, y = filteredset$Sub_metering_3, col ="blue") 
legend("topright", lwd = 1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")) 
plot(x = filteredset$Time, y = filteredset$Global_reactive_power, type = "l", xlab="datetime",ylab="Global_Reactive_Power") 
dev.off() 
