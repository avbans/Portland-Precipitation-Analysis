#INSTALL BEAUTIFUL SOUP FOR WEB SCRAPPING, LXML FOR HTML PARSING, AND REQUESTS FOR HTML REQUESTING IN CMD
pip3 install beautifulsoup4
pip3 install lxml
pip3 install requests

#LOAD LIBRARIES
from bs4 import BeautifulSoup
import requests

#GRAB WEBSITE FROM URL AND SAVE IT AS AN OBJECT
html_text = requests.get(
  'https://or.water.usgs.gov/non-usgs/bes/gresham.rain').text
print(html_text)

with open('01_Input/gresham_rain.txt', 'w') as f:
  f.write(html_text)
