#### My Working Directory 
2 # setwd("~/Documents/GitHub/ExData_Plotting1") 
3 
# Loading the full dataset 
fullset <- read.csv("household_power_consumption.txt",sep=";",header=TRUE)  
 
# Filtering on the dates 
t <- subset(fullset,fullset$Date %in% c("1/2/2007","2/2/2007")) 
 
 
# In place data conversions 
t$Time <- strptime(paste(t$Date,t$Time,sep = " "), "%d/%m/%Y %H:%M:%S") 
t$Date <- strptime(t$Date,"%d/%m/%Y") 
t$Global_active_power <- as.numeric(as.character(t$Global_active_power)) 
t$Voltage <- as.numeric(as.character(t$Voltage)) 
t$Global_reactive_power <- as.numeric(as.character(t$Global_reactive_power)) 
t$Sub_metering_1 <- as.numeric(as.character(t$Sub_metering_1)) 
t$Sub_metering_2 <- as.numeric(as.character(t$Sub_metering_2)) 
t$Sub_metering_3 <- as.numeric(as.character(t$Sub_metering_3)) 

 
# Plot drawing 
png("Plot2.png",width= 480, height = 480,  units= "px") 
plot(x = t$Time, y = t$Global_active_power, type = "l", xlab="",ylab="Global Active Power (kilowatts)") 
dev.off() 
