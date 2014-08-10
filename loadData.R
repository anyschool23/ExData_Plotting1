loadData<-function() {
  # Download the data file
  datafile<-"household_power_consumption.txt"
  if(!file.exists(datafile)) {
    url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    temp<-tempfile()
    download.file(url,temp,"auto")
    unzip(temp,exdir=".")
    unlink(temp)
  }
  # Loading the Data
  data<-read.csv(
    datafile,
    header=TRUE,
    sep=";",
    colClasses=c("character","character",rep("numeric",7)),
    na.strings=c("?")
  )
  #dt<-paste(data$Date, data$Time)
  #data$Date<-strptime(dt, "%d/%m/%Y %H:%M:%S")
  data$Date<-as.Date(data$Date,format="%d/%m/%Y")
  data2<-subset(data,Date==as.Date("2007/02/01")|Date==as.Date("2007/02/02"))
  dt<-paste(as.character(data2$Date), data2$Time)
  data2$Time = strptime(dt, "%Y-%m-%d %H:%M:%S")
  return(data2)
}