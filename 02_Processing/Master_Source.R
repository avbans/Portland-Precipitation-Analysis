#PRECIPITATION RAIN ANALYSIS BY ALEX BANS
---------------------------------------
#IMPORT DATA FROM WEB AND PROCESS 
source("02_Processing/01_Processing.R")

#PARSE STORMS FROM FULL PRECIP DATA 
source("02_Processing/02_Storm_Parsing.R")

#AGGERATE DAILY, MONTHLY, AND YEARLY SUMMARIES FROM FULL PRECIP DATA 
source("02_Processing/03_Aggregate.R")

#GRAPH AGGREGATED DATA 
source("02_Processing/04_Graphs.R")

#COMPILE REPORT 


