#GRAPHS
#DAILY TOTALS
daily_graph<-ggplot(rain_daily,aes(datetime,total_in))+
  geom_col()+
  labs(title="Total Daily Precip over Time",
       x="Day", 
       y="Daily Rain (in)")+
  theme_bw()

#MONTHLY TOTALS
monthly_graph<-ggplot(rain_monthly,aes(monthyear,precipitation,fill=statistic))+
  geom_col(position= position_dodge2(reverse= TRUE))+
  guides(fill=guide_legend(reverse=TRUE))+
  labs(title="Monthly Precipitation Totals for Current Water Year",
       x="Month",
       y="Precipitation (in)")+
  theme_bw()


#YEARLY TOTALS
yearly_graph<-ggplot(rain_yearly,aes(reorder(wateryear,desc(wateryear)),total_in))+
  geom_col()+
  geom_hline(yintercept= mean(rain_yearly$total_in),color="blue",lty="dashed")+
  labs(title="Total Daily Precip over Time",
       x="Year", 
       y="Yearly Rain Totals (in)")+
  theme_bw()+
  theme(axis.text.x=element_text(angle = 90, hjust =1))


daily_graph
monthly_graph
yearly_graph
