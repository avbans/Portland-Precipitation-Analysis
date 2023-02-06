#LOAD LIBRARIES AND FUNCTIONS 

#FOR DATA MANIPULATION AND GRAPHING 
library(tidyverse)
library(plotly)
library(gghighlight)

#FOR WORKING WITH DATES AND TIMS
library(lubridate)
library(zoo)

#FOR DIRECTORIES AND CREATING MARKDOWN FILES
library(here)
library(markdown)

#WATER YEAR FUNCTION
water_year<-function(date,Y){
  x<-as.character(ifelse(month(date)<Y,year(date), year(date)+1))
  x<-paste0((as.numeric(str_sub(x,1))-1),"-",str_sub(x, 1))
}


