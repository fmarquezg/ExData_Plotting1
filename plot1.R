library(datasets)
file<- read.table("C:/Users/Lenovo/Documents/GitHub/ExData_Plotting1/household_power_consumption.txt", header=T, sep=";")

file$Date<-as.Date(file$Date, format = "%d/%m/%Y" )
sapply(file,class)

df <- file[file$Date >='2007-02-01',]
df <- df[df$Date <= '2007-02-02',]

df$Global_active_power<-as.numeric(as.character(df$Global_active_power))
hist(df$Global_active_power, xlab='Global Active Power (kilowatts)', col='red', main='Global Active Power')
dev.copy(png, file = "C:/Users/Lenovo/Documents/GitHub/ExData_Plotting1/plot1.png",width = 480, height = 480)
dev.off()

