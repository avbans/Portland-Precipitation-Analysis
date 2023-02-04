#AGGREGATE THE DATA 
library(tidyverse)
library(lubridate)
library(zoo)

#AGGREGATE RAIN TOTALS BY WATER YEAR 
rain_yearly<-rain_full%>%
  group_by(wateryear)%>%
  summarize(depth_in=sum(depth_in))

#DETERMINE CURRENT WATER YEAR
today<-today(tzone="US/Pacific")
current_water_year<-water_year(today,10)

#FILTER FULL DATA SET TO THIS WATER YEAR 
rain_wateryear<-rain_full%>%
  filter(wateryear == current_water_year)


#FILTER STORMS FOR THIS WATER YEAR 
rain_storms_wateryear<-crossing(rain_wateryear,rain_storm_summary)%>% 
  filter(datetime >= eventstart,
         datetime < eventend)%>%
  select(wateryear,storm_id,datetime,depth_in)

#AGGREGATE MONTHLY RAIN TOTALS FOR CURRENT WATER YEAR
rain_monthly<-rain_full%>%
  filter(wateryear == current_water_year)%>%
  group_by(monthyear=as.yearmon(datetime))%>%
  summarize(total=sum(depth_in))%>%
  mutate(month=month(monthyear,label= TRUE))












