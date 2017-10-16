setwd("~/Rene/Coursera/Course4 - Exploratory Data Analysis/week1/assignment 1")

# check if data directory exists, if not download file and unzip

if(!file.exists("./household_power_consumption.zip")){
  
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                
                destfile = "./household_power_consumption.zip")
  
  unzip("household_power_consumption.zip")
  
}

data_all <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# filter data
data1 <- subset(data_all, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

# plot1
hist(data1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()