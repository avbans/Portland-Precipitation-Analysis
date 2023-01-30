#PORTLAND RAIN ANALYSIS BY ALEX BANS
---------------------------------------
#WEBSCRAPE HYDRADATA USING PYTHON 
library(reticulate)
source_python("02_Processing/02_webscrapping.py")

#PROCESS DATA
source("02_Processing/03_processing.R")

#MANIPULATE DATE

#GRAPH DATA
source("02_Processing/05_graphs.R")
