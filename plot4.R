setwd('/home/dev16/Data Science Coursera/Data Science in R/Coursera-Data-Science/Exploratory Data Analysis/exdata_data_household_power_consumption')
df=read.delim('household_power_consumption.txt',header = TRUE,sep=';')

# Since we want data from specific dates we are going to create a subset

df$Date=as.Date(df$Date,format="%d/%m/%Y")
df=subset(df,df['Date']>="2007-02-01" & df['Date']<='2007-02-02')
head(df)
datetime<-paste(as.Date(df$Date),df$Time)
head(datetime)
datetime<-as.POSIXct(datetime)

par(mfrow=c(2,2))
with(df, {
  plot(Global_active_power~datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~datetime, type="l", 
       ylab="Global_reactive_power",xlab="datetime")
})
setwd('/home/dev16/Data Science Coursera/Data Science in R/Coursera-Data-Science/Exploratory Data Analysis/WEEK 1 Assignment')
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()