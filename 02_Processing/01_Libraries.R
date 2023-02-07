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

#FUNCTION FOR DIRECTING COMPILING R SCRIPT INTO MARKDOWNFILE

report_compiler<-function(input_location,input_name,output_location,output_name){
  project_directory = here()
  file_input <-paste(project_directory,input_location,input_name, sep = "/")
  file_output = paste(project_directory,output_location, output_name, sep = "/")
  
  rmarkdown::render(input = file_input,
                    output_file = file_output)
}


