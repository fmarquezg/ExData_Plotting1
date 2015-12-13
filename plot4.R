library(dplyr)
library(datasets)
file<- read.table("C:/Users/Lenovo/Documents/GitHub/ExData_Plotting1/household_power_consumption.txt", header=T, sep=";")

file$Date<-as.Date(file$Date, format = "%d/%m/%Y" )
sapply(file,class)

df <- file[file$Date >='2007-02-01',]
df <- df[df$Date <= '2007-02-02',]

df$Global_active_power<-as.numeric(as.character(df$Global_active_power))
df$Sub_metering_1<-as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2<-as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3<-as.numeric(as.character(df$Sub_metering_3))
df$Voltage<-as.numeric(as.character(df$Voltage))
df$Global_reactive_power<-as.numeric(as.character(df$Global_reactive_power))

df <-within(df,{timestamp=format(as.POSIXct(paste(Date,Time)),'%Y-%m-%d %H:%M:%S')})
df$timestamp<-as.POSIXlt(df$timestamp, tz = "")


par(mfrow =c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

  plot(df$timestamp,df$Global_active_power,type='l', xlab = '', ylab='Global Active Power (Kilowatts)')
  plot(df$timestamp,df$Voltage,type='l', xlab = 'datetime', ylab='Voltage')
  #Plot 3
  plot(df$timestamp,df$Sub_metering_1,type='l', xlab = '', ylab='Energy sub metering')
  lines(df$timestamp,df$Sub_metering_2, col='red')
  lines(df$timestamp,df$Sub_metering_3, col='blue')
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col = c("black", "red", "blue"), lwd = 0, bty='n')
  #Plot 4
  plot(df$timestamp,df$Global_reactive_power,type='l', xlab = 'datetime', ylab='Global_reactive_power')

dev.copy(png, file = "C:/Users/Lenovo/Documents/GitHub/ExData_Plotting1/plot4.png",width = 480, height = 480)
dev.off()
