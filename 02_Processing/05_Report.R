#' ---
#' title: "Precipitation Analysis"
#' author: "By: Alex Bans"
#' date: "`r format(lubridate::today(),'%B %d, %Y')`"
#' ---

#' ## Introduction 

#' Is there a way to align the titles to the middle? Can I also add paragraph indents? 
#' Station 20, the USGS rain gauge is located at 1333 NW Eastman Parkway. 
#' As of the date of the compilation of this document there have been _______ hourly precipitation measurements 
#' since its installation on ______-. 


#' Below is the report for the current current_water_year water year. The report includes:
#'    *1.The number of storms, their duration, and the amount of precipitation that has fallen. 
#'    *2.The monthly rainfall totals compared to the average month, as well as a cumulative precipitation curve (?)
#'    *3.The yearly water year total compared to all of the past water years, and the average water year. 
#' 
#'  
#' ## Results 

#+ echo=F
monthly_graph


#' Let me talk about graph number 1 here.

#+ echo=F
yearly_graph


#' ## Background 
#' This to include in here are things such as definitions,assumptions made, and methods. 


#' This project was written in R with the assistance of the TidyVerse, Lubridate, Zoo packages as well as several custom written functions to parse water year and storm data from the precipitation data. Data was read directly from the Web, saved locally, processed, parsed for relevant dates and events, summary data aggregated, and then graphed. 


#' Storm events were defined as having at least 0.02 inches of rainfall and having at least 12 hours of separation between each event. 

#' what i used to make the markdown file (here, knitter, etc.)
#' 
#' 


#' ## Future Ideas
#' There are several ideas that may or may not be incorporated in this report.
#' Firstly, I want to automate the compiling and distribution of this report at the end of the water year, every September 30th.Another thing I would be interested in doing is determining more interesting and relevant statistics in regards to the storm events that have occurred in the water year, such as return intervals (ex. 1 in 100 year storms).Finally, a useful potential update would be to incorporate other interesting environmental metrics such as snow events, temperature, air quality, and combined sewer overflow (CSO) events. 






