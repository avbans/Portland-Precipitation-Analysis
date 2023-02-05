#AGGREGATE THE DATA 

#AGGREGATE RAIN TOTALS BY WATER YEAR 
rain_yearly<-rain_full%>%
  group_by(wateryear)%>%
  summarize(depth_in=sum(depth_in))

#DETERMINE CURRENT WATER YEAR
dates<-list("today"= lubridate::today(tzone="US/Pacific"),
            "current_water_year" = water_year(lubridate::today(tzone="US/Pacific"),10))


#AGGREGATE MONTHLY RAIN TOTALS FOR CURRENT WATER YEAR
rain_monthly<-rain_full%>%
  filter(wateryear == dates$current_water_year)%>%
  group_by(monthyear=as.yearmon(datetime))%>%
  summarize(total=sum(depth_in))%>%
  mutate(month=month(monthyear,label= TRUE))












