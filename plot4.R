consumption <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?") ## Reads the raw data file
plotdata <- consumption[consumption$Date == "1/2/2007" | consumption$Date == "2/2/2007",] ## saving the range of data to be used to easy reference

par(mfcol = c(2, 2), mar = c(4, 4, 2, 2), oma = c(1, 0, 1, 0))  ## Adjust the margins and define the ploting matrix
    
with(plotdata,{
    plot(strptime(paste(Date,Time ,sep = " "), format="%d/%m/%Y %T", tz=""), Global_active_power,
         type="l",xlab=NA,ylab="Global Active Power")  
    
    
    plot(strptime(paste(Date, Time, sep=" "), format="%d/%m/%Y %T", tz=""), 
         Sub_metering_1, 
         type="l",xlab=NA,ylab="Energy sub metering")
    lines(strptime(paste(Date, Time, sep=" "), format="%d/%m/%Y %T", tz=""), Sub_metering_2, col="red")
    lines(strptime(paste(Date, Time, sep=" "), format="%d/%m/%Y %T", tz=""), Sub_metering_3, col="blue")
    legend("topright", lty = 1, col = c("black","red", "blue"), bty = "n",xjust = 0, yjust = 0, text.width = strwidth("             -----   Sub_metering_1"),
           legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
    
    plot(strptime(paste(Date,Time ,sep = " "), format="%d/%m/%Y %T", tz=""), Voltage,
         type="l",xlab= "datetime",ylab="Voltage")
    
    plot(strptime(paste(Date,Time ,sep = " "), format="%d/%m/%Y %T", tz=""), Global_reactive_power,
         type="l",xlab= "datetime",ylab="Global_reactive_power")
    
    
}) ## draw the linear plots with the datetime on the X and x variables as defined on the assigment

dev.copy(png, file = "plot4.png") ## Copy plot1 to a PNG file, no need to difine size as 480X480 is the defauld
dev.off() ## close the graphic device to save the file