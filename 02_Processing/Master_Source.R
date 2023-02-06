#PRECIPITATION RAIN ANALYSIS BY ALEX BANS
---------------------------------------
#LOAD RELEVENT LIBRARIES AND FUNCTIONS
source("02_Processing/01_Libraries.R")

#IMPORT DATA FROM WEB AND PROCESS 
source("02_Processing/02_Processing.R")

#PARSE STORMS FROM FULL PRECIP DATA 
source("02_Processing/03_Storm_Parsing.R")

#AGGERATE DAILY, MONTHLY, AND YEARLY SUMMARIES FROM FULL PRECIP DATA 
source("02_Processing/04_Aggregate.R")

#GRAPH AGGREGATED DATA 
source("02_Processing/05_Graphs.R")

#CALCULATE STORM SUMMARY STATISTICS
source("02_Processing/06_Summary_Statistics.R")

#CREATE REPORT 
source("02_Processing/07_Report.R")

#COMPILE REPORT INTO HTML DOCUMENT
source("02_Processing/08_Compile.R")

