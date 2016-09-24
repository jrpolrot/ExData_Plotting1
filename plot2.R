
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
png("Plot2.png",width= 480, height = 480,  units= "px") 
plot(x = filteredset$Time, y = filteredset$Global_active_power, type = "l", xlab="",ylab="Global Active Power (kilowatts)") 
dev.off() 
