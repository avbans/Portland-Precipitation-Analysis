#THIS SCRIPT DOWNLOADS HYDRA RAIN DATA AND PROCESSES IT FOR ANALYSIS
#ACTIVATE PACKAGES
library(tidyverse)
library(lubridate)

#WATER YEAR FUNCTION
water_year<-function(date,Y){
  x<-as.character(ifelse(month(date)<Y,year(date), year(date)+1))
  x<-paste0((as.numeric(str_sub(x,1))-1),"-",str_sub(x, 1))
}


rain_raw<-read_table(url('https://or.water.usgs.gov/non-usgs/bes/gresham.rain'),skip=9)%>%
  filter(!row_number()%in% c(1))%>% 
  select(-c("Total"))

#IMPORT DATA AND CLEAN 

rain_full<-rain_raw%>%
  gather(time,value=tips,2:25)%>%
  na.omit()%>%
  rename(date=Date)%>%
  mutate(depth_in = (tips*.01))%>%
  select(date,time,depth_in)

#FORMAT INTERVALS INTO TIME BY FIRST COAXING INTERVALS INTO SECONDS
rain_full<-rain_full%>%
  mutate(time=(as.double(time)))%>%
  mutate(time=time*3600)%>%
  mutate(time=as.period(time,units="second"))%>%
  mutate(time=seconds_to_period(time))%>%
  mutate(time=sprintf('%02d:%02d',hour(time),minute(time)))


#FORMAT DATESTIMES, ADD WATER YEAR, AND FILTER INCOMPLETE YEAR
rain_full<-rain_full%>%
  mutate(datetime= dmy_hm(paste(date,time)))%>%
  mutate(wateryear = water_year(datetime,10))%>%
  filter(wateryear>'1997-1998')%>%
  select(wateryear,datetime,depth_in)










