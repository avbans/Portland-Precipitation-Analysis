#RAIN STORM PARSING


rain_storm<-rain_full%>%
  arrange(datetime)%>%
  mutate(log =row_number())%>%
  mutate(rainflag = ifelse(total_in>0,"rain","no rain"))%>%
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
  mutate(storm = cumsum(c(1, abs(log[-length(log)]-log[-1])>1)))
  


rain_storm<-rain_storm%>%
  group_by(storm)%>%
  summarize(
    precipitation = sum(total_in),
    eventstart = first(datetime),
    eventend = last(datetime))%>%
    mutate(duration = as.numeric(difftime(eventend,eventstart, units='h')))%>%
  filter(precipitation>0.02)%>%
  mutate(storm =row_number())%>%
  arrange(desc(eventstart))
rain_storm


