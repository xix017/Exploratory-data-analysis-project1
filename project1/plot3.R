#####load the data#####

#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","data.zip")
#unzip("data.zip")
data = read.csv("household_power_consumption.txt", header=T, sep=';', 
                 na.strings="?", stringsAsFactors=F, quote='\"')
colnames(data) = tolower(colnames(data))
data$date = as.Date(data$date, format="%d/%m/%Y")
data2 = data[which(data$date >= "2007-02-01" & data$date <= "2007-02-02"),]

#####Plot 3#####
datetime = paste(data2$date, data2$time)
data2$datetime <- as.POSIXct(datetime)

plot(data2$sub_metering_1~data2$datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
lines(data2$sub_metering_2~data2$datetime,col='Red')
lines(data2$sub_metering_3~data2$datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png,"plot3.png")
dev.off()
