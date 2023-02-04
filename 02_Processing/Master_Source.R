#PRECIPITATION RAIN ANALYSIS BY ALEX BANS
---------------------------------------
#WEBSCRAPPING 
source("02_Processing/webscrapping.py")
  
#IMPORT DATA FROM WEB AND PROCESS 
source("02_Processing/01_Processing.R")

#PARSE STORMS FROM FULL PRECIP DATA 
source("02_Processing/02_Storm_Parsing.R")

#AGGERATE DAILY, MONTHLY, AND YEARLY SUMMARIES FROM FULL PRECIP DATA 
source("02_Processing/03_Aggregate.R")

#GRAPH AGGREGATED DATA 
source("02_Processing/04_Graphs.R")

#CREATE REPORT 
source("02_Processing/05_Report.R")

#COMPILE REPORT INTO PDF
source("02_Processing/06_Compile.R")
       

