consumption <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?") ## Reads the raw data file

plotdata <-consumption[consumption$Date == "1/2/2007" | consumption$Date == "2/2/2007",] ## save the subset of data we will deal with

with(plotdata,{
    plot(strptime(paste(Date, Time, sep=" "), format="%d/%m/%Y %T", tz=""), 
         Sub_metering_1, 
         type="l",xlab=NA,ylab="Energy sub metering")
    lines(strptime(paste(Date, Time, sep=" "), format="%d/%m/%Y %T", tz=""), Sub_metering_2, col="red")
    lines(strptime(paste(Date, Time, sep=" "), format="%d/%m/%Y %T", tz=""), Sub_metering_3, col="blue")
    legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
}) ## draw the linear plot with the datetime on the X and the Global Active Power on the Y


dev.copy(png, file = "plot3.png") ## Copy plot1 to a PNG file, no need to difine size as 480X480 is the defauld
dev.off() ## close the graphic device to save the file