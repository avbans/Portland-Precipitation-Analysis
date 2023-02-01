#GRAPHS
library(tidyverse)

#STORMS FOR CURRENT WATER YEAR 
wateryearstorms_graph<-ggplot(rain_wateryear,aes(datetime,total_in))+
geom_col()+
  facet_wrap(~storm,scale='free')+
  labs(title="Storms for Current Water Year",
       x="Datetime",
       y="Precipitation (in)")+
  theme_bw()


#MONTHLY TOTALS
df<-rain_monthly%>%
  arrange(statistic,monthyear)%>%
  filter(statistic =="total_in")%>%
  mutate(cum=cumsum(precipitation))

sf<-max(df$precipitation)/max(df$cum)


monthly_graph<-ggplot(rain_monthly,aes(monthyear,precipitation,fill=statistic))+
  geom_col(position= position_dodge2(reverse= TRUE))+
  geom_line(df,mapping=aes(x=monthyear, y=cum*sf))+
  scale_y_continuous(name="Precipitation (in)",
                     sec.axis = sec_axis(~./sf, name="Cumulative Rainfall (in)"))+
  labs(title="Total Monthly Precipitation for Current Water Year Compared to Average",
       x="Month",
       y="Precipitation (in)")+
  theme_bw()

df<-NULL



#YEARLY TOTALS
yearly_graph<-ggplot(rain_yearly,aes(reorder(wateryear,desc(wateryear)),total_in))+
  geom_col()+
  geom_hline(yintercept= mean(rain_yearly$total_in),color="blue",lty="dashed")+
  labs(title="Total Precipitation by Water Year",
       x="Year", 
       y="Precipitation (in)")+
  theme_bw()+
  theme(axis.text.x=element_text(angle = 90, hjust =1))

wateryearstorms_graph
monthly_graph
yearly_graph
