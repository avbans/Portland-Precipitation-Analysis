#PRECIPITATION RAIN ANALYSIS BY ALEX BANS
---------------------------------------
#LOAD RELEVENT LIBRARIES 
source("02_Processing/01_Libraries.R")

#LOAD MY CUSTOM FUNCTIONS 
  
#IMPORT DATA FROM WEB AND PROCESS 
source("02_Processing/01_Processing.R")

#PARSE STORMS FROM FULL PRECIP DATA 
source("02_Processing/02_Storm_Parsing.R")

#AGGERATE DAILY, MONTHLY, AND YEARLY SUMMARIES FROM FULL PRECIP DATA 
source("02_Processing/03_Aggregate.R")

#CALCULATE STORM SUMMARY STATISTICS
source("02_Processing/Summary_Statistics.R")

#GRAPH AGGREGATED DATA 
source("02_Processing/04_Graphs.R")

#CREATE REPORT 
source("02_Processing/05_Report.R")

#COMPILE REPORT INTO HTML DOCUMENT
source("02_Processing/06_Compile.R")



