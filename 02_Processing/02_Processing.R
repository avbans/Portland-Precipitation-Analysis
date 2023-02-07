#THIS SCRIPT DOWNLOADS HYDRA RAIN DATA AND PROCESSES IT FOR ANALYSIS

#READ DATA DIRECTLY FROM WEB AND INTIAL CLEAN UP 
rain_raw<-read_table(url('https://or.water.usgs.gov/non-usgs/bes/gresham.rain'),
                     skip=9)%>%
  filter(!row_number()%in% c(1))%>% 
  select(-c("Total"))

#SAVE DATA FOR IF OFFLINE
write.table(rain_raw,"01_Input/gresham_rain.txt")

#TIDY DATA, REMOVE NA'S, AND ADJUST UNITS
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











