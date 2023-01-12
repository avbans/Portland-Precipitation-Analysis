#THIS SCRIPT CLEANS DATA UP
library(tidyverse)
library(lubridate)

#IMPORTS RAW TXT FILE AND DELETES JUNK ROWS 
rain_raw <- read_csv(
  "C:\\Users\\Alex's computer\\Desktop\\Portland Rain\\01_Input\\gresham_rain.txt",
                     skip = 8)
rain_raw<-rain_raw[-c(1:2),] 

#COMPILES DAY AND TIPS FROM RAW DATA 
rain<-rain_raw%>%separate(`Daily  Hourly data -->`,
                          c("day",
                            "month",
                            "year", 
                            "total_tips"))%>%
  unite('day',day:year,sep="-")

#READ DATE CORRECTLY 
rain$day<-dmy(rain$day)

#CONVERT TIPS TO INCHES
rain$total_in<-as.numeric(rain$total_tips)*.01

View(rain)