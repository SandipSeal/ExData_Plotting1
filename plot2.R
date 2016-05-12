hpc = read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")
hpc_st = hpc[((hpc$Date == "1/2/2007")|(hpc$Date == "2/2/2007")),]
hpc_st$DT = paste(hpc_st$Date,hpc_st$Time, sep = " ")
hpc_st$Dttm = strptime(hpc_st$DT,"%d/%m/%Y  %H:%M:%S" )
par(mfrow = c(1,1), mar = c(4,6,4,2))
plot(hpc_st$Dttm,as.numeric(hpc_st$Global_active_power), col = "blue",type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(hpc_st$Dttm,hpc_st$Global_active_power,lwd = 1)
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()