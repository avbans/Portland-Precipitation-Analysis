library(tidyverse)
library(lubridate)


df<-rain_monthly%>%
  arrange(statistic,monthyear)%>%
  filter(statistic =="total_in")%>%
  mutate(cum=cumsum(precipitation))

sf<-max(df2$precipitation)/max(df2$cum)


monthly_graph<-ggplot(rain_monthly,aes(monthyear,precipitation,fill=statistic))+
  geom_col(position= position_dodge2(reverse= TRUE))+
  geom_line(df2,mapping=aes(x=monthyear, y=cum*sf))+
  scale_y_continuous(name="Precipitation (in)",
                     sec.axis = sec_axis(~./sf, name="Cumulative Rainfall (in)"))+
  labs(title="Total Monthly Precipitation for Current Water Year Compared to Average",
       x="Month",
       y="Precipitation (in)")+
  theme_bw()
  
df<-NULL

