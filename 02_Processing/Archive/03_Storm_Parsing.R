#THIS SCRIPT PARSES STORM EVENTS FROM TIDY PRECIPTATION DATA

rain_storm_full<-rain_full%>%
  arrange(datetime)%>%
  mutate(log =row_number())%>%
  mutate(rainflag = ifelse(depth_in>0,"rain","no rain"))%>%
  mutate(rainflag_length = sequence(rle(rainflag)$lengths))%>%
  mutate(eventflag = ifelse(
    rainflag == "rain",
    "event",
    ifelse(
      rainflag == "no rain" & rainflag_length < 12,
      "event",
      "no event"
      
    )
  )
  )%>%
  filter(eventflag == "event")%>%
  mutate(storm_id= cumsum(c(1, abs(log[-length(log)]-log[-1])>1)))
  


rain_storm_full<-rain_storm_full%>%
  group_by(storm_id)%>%
  summarize(
    eventstart = first(datetime),
    eventend = last(datetime),
    total_depth_in = sum(depth_in))%>%
    mutate(duration_hr = as.numeric(difftime(eventend,eventstart, units='h')))%>%
  mutate(wateryear = get_wateryear(eventend,10))%>%
  filter(total_depth_in>0.02)%>%
  mutate(storm_id =row_number())



