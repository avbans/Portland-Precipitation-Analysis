#PROJECT: 
Portland Rain by Alex Vijay Bans 

#PROJECT DESCRIPTION: 
The goal of this project was to compile a report detailing precipitation in the 
local Portland metro area for the current water year in relation to past water years
for personal interests and comparing overall trends especially due to climate change. 

#INSTALLING THE PROJECT: 
Once the project is downloaded from GITHUB. 
Click on "Portland Rain.RProj" project file to access the analysis. 
Use renv::restore() to load the appropriate packages and package versions. 
You may have to install the packages that you may not have. 

#HOW TO USE THE PROJECT: 
Besides the README, renv folder/renv.lock file, and project file, 
there are 3 main files that you will need to pay attention to. 
These files are: "01_Input", "02_Processing", and "03_Output".

"01_Input" contain all data that are used by the project. 

"02_Processing" contain all of the scripts used on the project. 
"Master_Script.R" is the main script you will need, and it will run all other scripts for you. 
From this script you can see what scripts were used in the project, and where they are nested in the file structure.
The annotations in the script will explain what was accomplished. 
The "Archive" folder contains depreciated scripts. 

"03_Output" contains the summary report of the project, entitled "Precipitation Report.html"

#FUTURE ADDITIONS: 
This project is a work in progress and there are several potential additions that may be added. 
This includes: 
1.  Comparing the spatial variability of the area using other gauges from the network. 
2.  Adding in temperature and air quality data. 
3.  Adding in historical data. 
4.  Time Series analysis. 
5.  Estimate discharge based on curve number equations. 
6.  Stream discharge data
7.  Combined sewer overflow (CSO) events. 
8.  Return periods, interseason variation, etc. 
9.  Create email function that will automatically send a email the end of the water year. 
10. Send emails to people who subscribe via google sheets. 
11. Change project name to something more precise. 
12. Add data tables to report. 
13. Increase performance timing of scripts. 

#HOW TO CONTRIBUTE: 
Please direct any questions or suggestions directly to me at avbans93@gmail.com. 