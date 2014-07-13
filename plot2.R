consumption <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?") ## Reads the raw data file
with(consumption,
     plot(strptime(paste(Date[Date == "1/2/2007" | Date == "2/2/2007"],
                    Time[Date == "1/2/2007" | Date == "2/2/2007"],sep=" "), format="%d/%m/%Y %T", tz=""),
          Global_active_power[Date == "1/2/2007" | Date == "2/2/2007"],
          type="l",xlab=NA,ylab="Global Active Power (Kilowatts)")
) ## draw the linear plot with the datetime on the X and the Global Active Power on the Y
dev.copy(png, file = "plot2.png") ## Copy plot1 to a PNG file, no need to difine size as 480X480 is the defauld
dev.off() ## close the graphic device to save the file
