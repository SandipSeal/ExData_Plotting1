hpc = read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")
hpc_st = hpc[((hpc$Date == "1/2/2007")|(hpc$Date == "2/2/2007")),]
hpc_st$DT = paste(hpc_st$Date,hpc_st$Time, sep = " ")
hpc_st$Dttm = strptime(hpc_st$DT,"%d/%m/%Y  %H:%M:%S" )
par(mfrow = c(1,1), mar = c(4,6,4,2))
plot(hpc_st$Dttm,hpc_st$Sub_metering_1, col = "blue",type = "n", xlab = "", ylab = "Energy sub metering")

# variable 1
lines(hpc_st$Dttm,as.numeric(hpc_st$Sub_metering_1),lwd = 1)

# Variable 2
lines(hpc_st$Dttm,as.numeric(hpc_st$Sub_metering_2),lwd = 1, col = "red")

# Variable 3
lines(hpc_st$Dttm,as.numeric(hpc_st$Sub_metering_3),lwd = 1,col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col = c("black","red","blue"), cex = 0.75, y.intersp = 0.5)
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()