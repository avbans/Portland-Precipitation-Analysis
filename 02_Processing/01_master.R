#PRECIPITATION RAIN ANALYSIS BY ALEX BANS
---------------------------------------
#IMPORT DATA FROM WEB AND PROCESS 
source("02_Processing/03_processing.R")

#PARSE STORMS FROM FULL PRECIP DATA 
source("02_Processing/04_stormparsing.R")

#AGGERATE DAILY, MONTHLY, AND YEARLY SUMMARIES FROM FULL PRECIP DATA 
source("02_Processing/05_aggregate.R")

#GRAPH AGGREGATED DATA 
source("02_Processing/06_graphs.R")

