#AGGREGATE THE DATA 
library(tidyverse)
library(lubridate)
library(zoo)

#AGGREGATE RAIN TOTALS BY WATER YEAR 
rain_yearly<-rain_full%>%
  group_by(wateryear)%>%
  summarize(total_in=sum(total_in))


#FILTER STORMS FOR THIS WATER YEAR 
today<-today(tzone="US/Pacific")

rain_wateryear<-rain_full%>%
  filter(wateryear==water_year(today,10))

rain_wateryear<-crossing(rain_wateryear,rain_storm)%>% 
  filter(datetime >= eventstart,
         datetime < eventend)%>%
  select(wateryear,storm,datetime,total_in)

#AGGREGATE MONTHLY RAIN TOTALS FOR CURRENT WATER YEAR
rain_monthly<-rain_full%>%
  filter(wateryear==water_year(today,10))%>%
  group_by(monthyear=as.yearmon(datetime))%>%
  summarize(total_in=sum(total_in))%>%
  mutate(month=month(monthyear,label= TRUE))

#AGGREGATE AVERAGE MONTHLY RAIN TOTALS 
rain_month_avg<-rain_full%>%
  group_by(month = as.yearmon(datetime))%>%
  summarize(sum_in =sum(total_in))%>%
  group_by(month=month(month,label=TRUE))%>%
  summarize(avg_in=mean(sum_in))

#COMBINE MONTHLY AVERAGE WTIH RAIN TOTALS 
rain_monthly<-merge(rain_monthly,
                    rain_month_avg,
                    by.x = "month")
#CLEAN UP DATA FRAME
rain_month_avg<-NULL

rain_monthly<-rain_monthly%>%
  select(monthyear,total_in,avg_in)%>%
  gather(key=statistic,value=precipitation,2:3)%>%
  arrange(statistic,monthyear)










