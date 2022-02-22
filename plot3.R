setwd('/home/dev16/Data Science Coursera/Data Science in R/Coursera-Data-Science/Exploratory Data Analysis/exdata_data_household_power_consumption')
df=read.delim('household_power_consumption.txt',header = TRUE,sep=';')

# Since we want data from specific dates we are going to create a subset

df$Date=as.Date(df$Date,format="%d/%m/%Y")
df=subset(df,df['Date']>="2007-02-01" & df['Date']<='2007-02-02')
head(df)
datetime<-paste(as.Date(df$Date),df$Time)
head(datetime)
datetime<-as.POSIXct(datetime)

global_active_power=as.numeric(unlist(df['Global_active_power']))

with(df,{
  plot(Sub_metering_1~datetime,type='l',col='black',
       ylab="Energy sub metering",xlab="")
  lines(Sub_metering_2~datetime,col='red')
  lines(Sub_metering_3~datetime,col='blue')
})
legend("topright",col=c('black','blue','red'),lty=1,lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

setwd('/home/dev16/Data Science Coursera/Data Science in R/Coursera-Data-Science/Exploratory Data Analysis/WEEK 1 Assignment')
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()