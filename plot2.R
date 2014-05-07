##Exploratory Data Analysis; plot2.R for Course Project 1; May 6th, 2014

#set path
setwd("C:\\Users\\yqi\\Documents\\coursera courses\\exploratory data analysis")

#read the data file
tab5rows <- read.table("household_power_consumption.txt",sep=";", header = TRUE, nrows = 5)
classes <- sapply(tab5rows, class)
tabAll <- read.table("household_power_consumption.txt", sep=";",header = TRUE, colClasses = classes, na="?")
tabAll$Date<- as.Date(tabAll[,1], "%d/%m/%Y")
head(tabAll)

#subset the data file
d1<-as.Date("01/02/2007","%d/%m/%Y")
d2<-as.Date("02/02/2007","%d/%m/%Y")
tabsub<-tabAll[which(tabAll$Date==d1|tabAll$Date==d2),]
head(tabsub)

#create "datetime" column
tabsub$datetime<-paste(tabsub$Date,tabsub$Time)
tabsub$datetime<- strptime(tabsub[,"datetime"], "%Y-%m-%d %H:%M:%S")
head(tabsub)

#plot2
png(file = "plot2.png",width=480, height=480, bg = "transparent")
plot(tabsub$datetime,tabsub$Global_active_power,type="l",xlab=" ",
            ylab="Global Active Power (killowatts)")
dev.off()
