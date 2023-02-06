#GRAPHS
source("02_Processing/03_Aggregate.R")

#INTERACTIVE HOURLY RAIN GRAPH FOR WATER YEAR 
hourly_graph<-ggplot(rain_wateryear,aes(datetime,depth_in))+
  geom_line(color= "#966633")+
  labs(title="Interactive Hour by Hour Precipitation for Current Water Year",
                   x="Datetime",
                   y="Precipitation (in)")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))
  

hourly_graph<-ggplotly(hourly_graph, 
                       dynamicTicks = TRUE,
                       originaldata = TRUE)


#GRAPH OF MONTHLY TOTALS COMPARED TO AVERAGE MONTHS WITH CUMULATIVE TOTALS
#AGGREGATE AVERAGE MONTHLY RAIN TOTALS 
rain_month_avg<-rain_full%>%
  group_by(month = as.yearmon(datetime))%>%
  summarize(depth_in =sum(depth_in))%>%
  group_by(month=month(month,label=TRUE))%>%
  summarize(avg=mean(depth_in))

#COMBINE MONTHLY AVERAGE WTIH RAIN TOTALS 
rain_monthly<-merge(rain_monthly,
                    rain_month_avg,
                    by.x = "month")
#CLEAN UP DATA FRAME AND TIDY 

rain_monthly<-rain_monthly%>%
  select(monthyear,total,avg)%>%
  gather(key=statistic,value=depth_in,2:3)%>%
  arrange(statistic,monthyear)

#USE MONTHLY TOTALS TO CREATE A SCALE FACTOR FOR GRAPHING CUMULATIVE TOTALS
df<-rain_monthly%>%
  arrange(statistic,monthyear)%>%
  filter(statistic =="total")%>%
  mutate(cum=cumsum(depth_in))

.scalefactor<-max(df$depth_in)/max(df$cum)


monthly_graph<- ggplot(rain_monthly,aes(monthyear,depth_in,fill=statistic))+
  geom_col(position= position_dodge2(reverse= TRUE))+
  geom_line(df,mapping=aes(x=monthyear, y=cum*.scalefactor),
            size= 1, 
            linetype = "dashed",
            color = "#FFCC33")+
  scale_y_continuous(name="Precipitation (in)",
                     sec.axis = sec_axis(~./.scalefactor, name="Cumulative Rainfall (in)"))+
  labs(title="Total Monthly Precipitation for Current Water Year Compared to Average",
       x="Month",
       y="Precipitation (in)")+
  theme_classic()+
  scale_fill_manual(values = c("#006699","#966633"),
                    name = "Key",
                    labels = c("Average", "Current Total"),
                    guide = guide_legend(reverse = TRUE))+
  theme(legend.position = "bottom")+
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.ticks.y.right = element_line(color = "#FFCC33",
                                          linewidth =5))

#YEARLY TOTALS WITH MEAN LINE 
yearly_graph<-ggplot(rain_yearly,aes(x=reorder(wateryear,desc(wateryear)), 
                                     y=depth_in))+
  geom_col(fill ="#966633")+
  gghighlight(wateryear==dates$current_water_year)+
  geom_hline(yintercept= mean(rain_yearly$depth_in),
             color="#006699",
             lty="dashed", 
             size =1)+
  labs(title="Total Precipitation by Water Year",
       x="Year", 
       y="Precipitation (in)")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text.x=element_text(angle = 90, 
                                 hjust =1))


#CREATE A LIST OF GRAPHS AND REMOVE NO LONGER RELEVENT OBJECTS
graphs<-list("hourly" = hourly_graph,
             "monthly"=monthly_graph, 
             "yearly"= yearly_graph)


rm(list=c("rain_month_avg",
          "df",
          "hourly_graph",
         "monthly_graph",
         "yearly_graph"))

graphs$monthly
