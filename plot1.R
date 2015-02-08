url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(url, destfile='electric.zip', method='curl')
all<-read.csv2(unz('electric.zip', 'household_power_consumption.txt'), na.strings='?', quote="",
               colClasses=c('factor', 'factor', 'numeric', 'numeric', 'numeric',
                            'numeric', 'numeric', 'numeric', 'numeric'), dec='.')
data<-all[(all$Date=='1/2/2007'|all$Date=='2/2/2007'),]
png(file='plot1.png', height=480, width=480)
hist(data$Global_active_power, main='Global Active Power', col='red', 
     xlab='Global Active Power (kilowats)')
dev.off()