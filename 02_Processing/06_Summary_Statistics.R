#CALCULATE SUMMARY STATISTICS

#DEPTH AND DURATION FOR CURRENT WATER YEAR 
rain_storm_wateryear<- rain_storm_full%>%
  filter(wateryear == dates$current_water_year)%>%
  select(total_depth_in, duration_hr)

#DEPTH AND DURATION FOR AVERAGE WATER YEAR 
rain_storm_avg <-rain_storm_full%>%
  group_by(wateryear)%>%
  summarize(
    storm_num= n(),
    mean_depth_in = mean(total_depth_in),
    min_depth_in = min(total_depth_in), 
    max_depth_in = max(total_depth_in),
    mean_duration_hr = mean(duration_hr),
    min_duration_hr = min(duration_hr),
    max_duration_hr = max(duration_hr))


#HOW MUCH IT'S RAINED THIS WATER YEAR 
current_wateryear_rain_total<-round(
  filter(rain_yearly,wateryear==dates$current_water_year)%>%
    select(depth_in)
  ,1)

#AVERAGE RAINFALL PER YEAR   
average_wateryear_rain_total<-round(
  mean(rain_yearly$depth_in,0)
)

