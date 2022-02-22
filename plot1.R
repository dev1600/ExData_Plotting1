setwd('/home/dev16/Data Science Coursera/Data Science in R/Coursera-Data-Science/Exploratory Data Analysis/exdata_data_household_power_consumption')
df<-read.delim('household_power_consumption.txt',header = TRUE,sep=';')

# Since we want data from specific dates we are going to create a subset

df$Date<-as.Date(df$Date,format="%d/%m/%Y")
df<-subset(df,df$Date>="2007-02-01" & df$Date<='2007-02-02')
head(df)

# Because of separators the data is in non numeric form we have to convert to numeric form
# we do so by first unlisting the objects and then convertin them to numeric

global_active_power<-as.numeric(unlist(df['Global_active_power']))
global_active_power
hist(global_active_power,col='red',main="Global Active Power",xlab="Global Active Power(kilowatts)")
png(file='/home/dev16/Data Science Coursera/Data Science in R/Coursera-Data-Science/Exploratory Data Analysis/WEEK 1 Assignment/plot1.png',
    width = 480,height=480)
dev.off()