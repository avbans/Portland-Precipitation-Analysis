#FOR THIS WATER YEAR 
dates$current_water_year

b= rain_storm_summary%>%
  filter(wateryear == dates$current_water_year)%>%
  select(total_depth_in, duration_hr)

#THERE WERE X MANY STORMS
length(b$total_depth_in)

#DEPTH RANGED from x to y inches.   
min(b$total_depth_in)

max(b$total_depth_in)

#Duration RANGED from x to y HOURS   
min(b$duration_hr)

max(b$duration_hr)

#COMPARE TO AVERAGE 
c=  rain_storm_summary%>%
  group_by(wateryear)%>%
  summarize(
    storm_num= n(),
    mean_depth_in = mean(total_depth_in),
    min_depth_in = min(total_depth_in), 
    max_depth_in = max(total_depth_in),
    mean_duration_hr = mean(duration_hr),
    min_duration_hr = min(duration_hr),
    max_duration_hr = max(duration_hr))
#AVERAGE NUMBER OF STORMS PER WATER YEAR 
round(mean(c$storm_num),0)

#DEPTH RANGED from x to y inches.   
mean(c$min_depth_in)

mean(c$max_depth_in)

#Duration RANGED from x to y HOURS   
min(c$min_duration_hr)

max(c$max_duration_hr)

#HOW MUCH IT'S RAINED THIS WATER YEAR 
current_wateryear_rain_total<-round(
  filter(rain_yearly,wateryear==dates$current_water_year)%>%
    select(depth_in)
  ,1)

#AVERAGE ANNUAL RAINFALL 
average_wateryear_rain_total<-round(
  mean(rain_yearly$depth_in,0)
)

