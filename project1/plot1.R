#####load the data#####

#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","data.zip")
#unzip("data.zip")
data <- read.csv("household_power_consumption.txt", header=T, sep=';', 
                 na.strings="?", stringsAsFactors=F, quote='\"')
colnames(data) = tolower(colnames(data))
data$date <- as.Date(data$date, format="%d/%m/%Y")
data2 = data[which(data$date >= "2007-02-01" & data$date <= "2007-02-02"),]

#####Plot 1#####
hist(data2$global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col=2)
dev.copy(png,"plot1.png")
dev.off()
