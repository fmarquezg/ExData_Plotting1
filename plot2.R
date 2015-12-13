library(dplyr)
library(datasets)
file<- read.table("C:/Users/Lenovo/Documents/GitHub/ExData_Plotting1/household_power_consumption.txt", header=T, sep=";")

file$Date<-as.Date(file$Date, format = "%d/%m/%Y" )
sapply(file,class)

df <- file[file$Date >='2007-02-01',]
df <- df[df$Date <= '2007-02-02',]

df$Global_active_power<-as.numeric(as.character(df$Global_active_power))

df <-within(df,{timestamp=format(as.POSIXct(paste(Date,Time)),'%Y-%m-%d %H:%M:%S')})
df$timestamp<-as.POSIXlt(df$timestamp, tz = "")


plot(df$timestamp,df$Global_active_power,type='l', xlab = '', ylab='Global Active Power (Kilowatts)')
dev.copy(png, file = "C:/Users/Lenovo/Documents/GitHub/ExData_Plotting1/plot2.png",width = 480, height = 480)
dev.off()
