url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(url, destfile='electric.zip', method='curl')
all<-read.csv2(unz('electric.zip', 'household_power_consumption.txt'), na.strings='?', quote="",
               colClasses=c('factor', 'factor', 'numeric', 'numeric', 'numeric',
                            'numeric', 'numeric', 'numeric', 'numeric'), dec='.')
data<-all[(all$Date=='1/2/2007'|all$Date=='2/2/2007'),]
data$Date<-as.Date(data$Date,format='%d/%m/%Y')
date_time<-paste(data$Date, data$Time, sep=' ')
date_time<-strptime(date_time, format="%Y-%m-%d %H:%M:%S")
png(file='plot2.png', height=480, width=480)
plot(date_time, data$Global_active_power, type='l', xlab='',
     ylab='Global Active Power (kilowats)')
dev.off()