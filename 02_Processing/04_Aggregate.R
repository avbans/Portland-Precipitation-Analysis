#AGGREGATE THE DATA 

#AGGREGATE RAIN TOTALS BY WATER YEAR 
rain_yearly<-rain_full%>%
  group_by(wateryear)%>%
  summarize(depth_in=sum(depth_in))

#DETERMINE CURRENT WATER YEAR
dates<-list("today"= lubridate::today(tzone="US/Pacific"),
            "current_water_year" = water_year(lubridate::today(tzone="US/Pacific"),10))

#FILTER RAIN FOR THE CURRENT WATER YEAR 
rain_wateryear<-rain_full%>%
  filter(wateryear == dates$current_water_year)

#AGGREGATE MONTHLY RAIN TOTALS FROM CURRENT WATER YEAR
rain_monthly<-rain_wateryear%>%
  group_by(monthyear=as.yearmon(datetime))%>%
  summarize(total=sum(depth_in))%>%
  mutate(month=month(monthyear,label= TRUE))












