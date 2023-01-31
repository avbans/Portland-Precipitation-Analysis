library(tidyverse)
library(lubridate)
library(zoo)


#AGGREGATE THE DATA 
#AGGREGATE DAILY RAIN TOTALS FOR CURRENT WATER YEAR FOR LAST MONTH
today<-today(tzone="US/Pacific")
lastmonth<- (today %m-% months(1))

rain_daily<-rain_full%>%
  filter(wateryear==water_year(today,10))%>%
  filter(datetime >lastmonth)

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

rain_monthly<-merge(rain_monthly,
                    rain_month_avg,
                    by.x = "month")

rain_monthly<-rain_monthly%>%
  select(monthyear,total_in,avg_in)%>%
  gather(key=statistic,value=precipitation,2:3)

#AGGREGATE RAIN TOTALS BY WATER YEAR 
rain_yearly<-rain_full%>%
  group_by(wateryear)%>%
  summarize(total_in=sum(total_in))








