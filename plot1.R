hpc = read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")
hpc_st = hpc[((hpc$Date == "1/2/2007")|(hpc$Date == "2/2/2007")),]
hpc_st$Date = as.Date(hpc_st$Date, format = "%d/%m/%Y")
par(mfrow = c(1,1), mar = c(6,6,4,1))
hist(hpc_st$Global_active_power,main = "Global Active Power", col = "red",xlab = "Global Active Power (Kilowatts)",axes = FALSE)
axis(side = 1, at = seq(0,6,2))
axis(side = 2, at = seq(0,1200,200))
dev.copy(png, file = "plot1.png")
dev.off()