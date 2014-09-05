#####load the data#####

#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","data.zip")
#unzip("data.zip")
data = read.csv("household_power_consumption.txt", header=T, sep=';', 
                 na.strings="?", stringsAsFactors=F, quote='\"')
colnames(data) = tolower(colnames(data))
data$date = as.Date(data$date, format="%d/%m/%Y")
data2 = data[which(data$date >= "2007-02-01" & data$date <= "2007-02-02"),]

#####Plot 2#####
datetime = paste(data2$date, data2$time)
data2$datetime <- as.POSIXct(datetime)

plot(data2$global_active_power~data2$datetime,type="l",
     main="Global Active Power", 
     xlab="date",ylab="Global Active Power (kilowatts)")
dev.copy(png,"plot2.png")
dev.off()
