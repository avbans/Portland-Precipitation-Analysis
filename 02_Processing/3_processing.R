#THIS SCRIPT CLEANS DATA UP
library(tidyverse)
#import txt file and remove junk rows 
rain_raw <- read_csv(
  "C:\\Users\\Alex's computer\\Desktop\\Portland Rain\\01_Input\\gresham_rain.txt",
                     skip = 8)
rain_raw<-rain_raw[-c(1:2),] 

#separate day, month, year and total tips
rain<-rain_raw%>%separate(`Daily  Hourly data -->`,
                          c("day",
                            "month",
                            "year", 
                            "total"))
#combine day, month, and year and setting as a date 
rain<-rain%>%unite('day',day:year,sep="-")
library(lubridate)
rain$day<-dmy(rain$day)

#rename total to tips total 
colnames(rain)[2]="total_tips"

#total rain in inches 
rain$total_in<-as.numeric(rain$total_tips)*.01

View(rain)