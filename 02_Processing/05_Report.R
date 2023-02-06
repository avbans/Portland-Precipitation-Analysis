#' ---
#' title: "Precipitation Analysis"
#' author: "By: Alex Bans"
#' date: "`r format(dates$today,'%B %d, %Y')`"
#' output:
#'    html_document:
#'      theme: united
#'      highlight: haddock
#' ---

#' ## Introduction 

#' Station 20, the USGS rain gauge, is located at 1333 NW Eastman Parkway. 
#' As of the date of the compilation of this document there have been over 
#' `r length(rain_full$depth_in)` hourly precipitation measurements 
#' and
#' `r length(rain_storm_full$storm_id)` storm events recorded
#' since its installation in 1997.  
#' 
#' 
#' Below is a summary report for the `r dates$current_water_year` Water Year,
#' which includes:
#' 
#' 1. An interactive hour by hour rain graph. 
#' 
#' 2. The monthly rainfall totals compared to the average month, as well as a 
#' cumulative precipitation. 
#' 
#' 3. The number of storms and the minimum/maximum precipitation and duration
#' for each storm of the water year compared to the average Water Year. 
#' 
#' 4. The yearly water year total compared to all of the past water years, 
#' and the average water year. 
#' 
#'  

#' ## Results 

#' #### Hourly Breakdown
#' Below is an interactive hour by hour graph of the precipitation for the 
#' current Water Year. You can pan to any time interval you wish. 
#+ echo=F
graphs$hourly

#' #### Annual Breakdown 
#+ echo=F
graphs$monthly

#' #### Storm Breakdown
#' There were `r length(rain_storm_wateryear$total_depth_in)` storm events 
#' this Water Year compared to the average year which has around 
#'  `r round(mean(rain_storm_avg$storm_num),0)` storm events. 

#' Storms ranged from `r min(rain_storm_wateryear$total_depth_in)` inches 
#' up to `r max(rain_storm_wateryear$total_depth_in)` inches of precipitation, 
#' while the average year ranges from `r mean(rain_storm_avg$min_depth_in)` inches 
#' to `r mean(rain_storm_avg$max_depth_in)` inches. 

#' Storms events lasted any where from `r min(rain_storm_wateryear$duration_hr)`
#' hours to `r max(rain_storm_wateryear$duration_hr)` hours. While on average 
#' storms last from `r min(rain_storm_avg$min_duration_hr)` hours to 
#' `r max(rain_storm_avg$max_duration_hr)` hours. 
#' 
#' 

#' #### Breakdown by Water Year
#' It has rained
#'  `r current_wateryear_rain_total` inches this water year. 
#' which is
#' `r ifelse(current_wateryear_rain_total > average_wateryear_rain_total,"greater than","less than")`
#' the average of `r average_wateryear_rain_total` inches.

#+ echo=F
graphs$yearly

#' ## Background

#' This project was written in R with the assistance of the TidyVerse, 
#' Lubridate, Zoo, Plotly,GGHighlight, Here,and Markdown packages, 
#' as well as several custom written functions to parse 
#' water year and storm data from the precipitation data.
#' 
#' Data was read directly from the Web (https://or.water.usgs.gov/non-usgs/bes/gresham.html)
#' processed, parsed for relevant dates 
#' and events, summary data aggregated, and then graphed before being 
#' compiled directly into a HTML document. 
#' 
#' Storm events were defined as having at least 0.02 inches of rainfall 
#' and having at least 12 hours of separation between each event. 
#' 
#' 
#' THIS PROJECT IS CURRENTLY A WORK IN PRORGRESS. 
#' 
#' 

#' ## Future Ideas
#' There are several ideas that may or may not be incorporated in this report.
#' Firstly, I want to automate the compiling and distribution of this report at 
#' the end of the water year, every September 30th.
#' Another thing I would be interested in doing is calculating 
#' more sophisticated statistics in regards to the storm events that have occurred 
#' in the water year, such as return intervals (ex. 1 in 100 year storms).
#'  Utilizing the other rain gauges in the network could be used for spatial 
#'  analysis. 
#'  Finally, a useful potential update would be to incorporate 
#'  other interesting environmental metrics such as snow events, 
#'  temperature, air quality, and combined sewer overflow (CSO) events. 
#'  The separation of storm events can also be useful for storm water runoff 
#'  modeling. 






