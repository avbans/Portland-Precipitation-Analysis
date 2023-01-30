library(tidyverse)
library(lubridate)
library(zoo)

water_year<-function(date,Y){
  x<-as.character(ifelse(month(date)<Y,year(date), year(date)+1))
  x<-paste0((as.numeric(str_sub(x,1))-1),"-",str_sub(x, 1))
}

#IMPORT DATA AND CLEAN 
rain_raw<-read_table("01_Input/gresham_rain.txt",
                     skip=9)%>%
  filter(!row_number()%in% c(1))%>% 
  select(-c("Total"))

rain_full<-rain_raw%>%
  gather(time,value=tips,2:25)%>%
  na.omit()%>%
  rename(date=Date)%>%
  mutate(total_in = (tips*.01))%>%
  select(date,time,total_in)

#FORMAT TIMES
rain_full<-rain_full%>%
  mutate(time=(as.double(time)))%>%
  mutate(time=time*3600)%>%
  mutate(time=as.period(time,units="second"))%>%
  mutate(time=seconds_to_period(time))%>%
  mutate(time=sprintf('%02d:%02d',hour(time),minute(time),second(time)))

#FORMAT DATESTIMES, ADD WATER YEAR, AND FILTER INCOMPLETE YEAR
rain_full<-rain_full%>%
  mutate(datetime= dmy_hm(paste(date,time)))%>%
  mutate(wateryear = water_year(datetime,10))%>%
  filter(wateryear>'1997-1998')%>%
  select(wateryear,datetime,total_in)

#AGGREGATE DAILY RAIN TOTALS FOR CURRENT WATER YEAR FOR LAST MONTH
today<-today(tzone="US/Pacific")
lastmonth<- (today %m-% months(1))

rain_daily<-rain_full%>%
  filter(wateryear==water_year(today,10))%>%
  filter(datetime >lastmonth)

#AGGREGATE MONTHLY RAIN TOTALS FOR CURRENT WATER YEAR
rain_monthly<-rain_full%>%
  filter(wateryear==water_year(today,10))%>%
  group_by(month=as.yearmon(datetime))%>%
  summarize(total_in=sum(total_in))

#AGGREGATE RAIN TOTALS BY WATER YEAR 
rain_yearly<-rain_full%>%
  group_by(wateryear)%>%
  summarize(total_in=sum(total_in))

ggplot(rain_daily,aes(x=datetime,y=total_in))+
  geom_line()+
  theme_bw()















