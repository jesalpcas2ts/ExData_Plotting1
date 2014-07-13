consumption <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?") ## Reads the raw data file
with (consumption,
    hist(Global_active_power[Date == "1/2/2007" |Date == "2/2/2007"],col="red",xlab = "Global Active Power (Kilowatts)", main = "Global Active Power") 
) ## Draw plot1 for the required date range
dev.copy(png, file = "plot1.png") ## Copy plot1 to a PNG file,no need to difine size as 480X480 is the default
dev.off() ## close the graphic device to save the file