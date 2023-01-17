#LOAD LIBRARIES 
import requests

#SAVES WEBSITE HTML RESPONSE PARSE AS TEXT AND SAVE AS OBJECT
html_text = requests.get('https://or.water.usgs.gov/non-usgs/bes/gresham.rain').text

#EXPORT OBJECT AS .TXT FILE 
with open('01_Input/gresham_rain.txt', 'w') as f:
  f.write(html_text)
