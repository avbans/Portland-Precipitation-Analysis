#THIS IS AN EXAMPLE OF DATE PARSING 
#FILTER FULL DATA SET TO THIS WATER YEAR 
rain_wateryear<-rain_full%>%
  filter(wateryear == current_water_year)

#FILTER STORMS FOR THIS WATER YEAR 
rain_storm_wateryear<-crossing(rain_wateryear,rain_storm_summary)%>% 
  filter(datetime >= eventstart,
         datetime < eventend)%>%
  select(wateryear,storm_id,datetime,depth_in,duration_hr)