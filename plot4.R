hpc = read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")
hpc_st = hpc[((hpc$Date == "1/2/2007")|(hpc$Date == "2/2/2007")),]
hpc_st$DT = paste(hpc_st$Date,hpc_st$Time, sep = " ")
hpc_st$Dttm = strptime(hpc_st$DT,"%d/%m/%Y  %H:%M:%S" )
par(mfcol = c(2,2), mar = c(4,4,2,2))

# Plot 1
plot(hpc_st$Dttm,as.numeric(hpc_st$Global_active_power), col = "blue",type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(hpc_st$Dttm,hpc_st$Global_active_power,lwd = 1)

# Plot 2
plot(hpc_st$Dttm,as.numeric(hpc_st$Sub_metering_1), col = "blue",type = "n", xlab = "", ylab = "Energy sub metering")
lines(hpc_st$Dttm,as.numeric(hpc_st$Sub_metering_1),lwd = 1)
lines(hpc_st$Dttm,as.numeric(hpc_st$Sub_metering_2),lwd = 1, col = "red")
lines(hpc_st$Dttm,as.numeric(hpc_st$Sub_metering_3),lwd = 1,col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col = c("black","red","blue"), cex = 0.9, x.intersp = 0.75,y.intersp = 0.3, bty = "n", xjust = 1,yjust = 1)

# Plot 3
plot(hpc_st$Dttm,as.numeric(hpc_st$Voltage), col = "blue",type = "n", xlab = "datetime", ylab = "Voltage")
lines(hpc_st$Dttm,as.numeric(hpc_st$Voltage),lwd = 1)

# Plot 4
plot(hpc_st$Dttm,as.numeric(hpc_st$Global_reactive_power), col = "blue",type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(hpc_st$Dttm,as.numeric(hpc_st$Global_reactive_power),lwd = 1)


dev.copy(png, file = "plot4.png")
dev.off()