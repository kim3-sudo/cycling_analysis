# -*- coding: utf-8 -*-
"""
Created on Tue Apr 20 16:08:31 2021

@author: kim3
"""

import pandas as pd
import requests
from bs4 import BeautifulSoup
from tqdm import tqdm
from datetime import datetime

now = datetime.now()
dt_string = now.strftime("_%d%m%Y_%H%M%S")
enddir = 'D:\\development\\'
endfile = enddir + 'scrape' + dt_string + '.csv'

header = {
  "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.75 Safari/537.36",
  "X-Requested-With": "XMLHttpRequest"
}

url_list = []
url_file = 'https://raw.githubusercontent.com/kim3-sudo/cycling_analysis/main/data/touralpssites.txt'
header = {
  "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.75 Safari/537.36",
  "X-Requested-With": "XMLHttpRequest"
}

src_file = requests.get(url_file)
text = src_file.text.split("\n")
for line in text:
    url_list.append(line)

print('Cleaning url list')
for i in url_list:
    if (i == ''):
        url_list.remove(i)

df = pd.DataFrame()

for url in tqdm(url_list):
    i = url
    raceid = url[32:]
    raceid = raceid.replace('/', '-')
    headers = {'User-Agent': 'Mozilla/5.0'}
    data = requests.get(url, headers = headers)
    
    soup = BeautifulSoup(data.text, 'lxml')
    
    table = soup.find('table', attrs = {'class': 'results'})
    
    data_rows = ''
    try:
        data_rows = table.find_all('tr')
    
        data = []
        for tr in data_rows:
            td = tr.find_all('td')
            row = [tr.text for tr in td]
            data.append(row)
        
        df = pd.DataFrame(data, columns = ['rank','prev','standing','bib','rider','age','team', 'uci', 'point','time'])
        
        # Clean up rider using team
        for index, row in df.iterrows():
            row['rider'] = str(row['rider']).replace(str(row['team']), '')
            row['rider'] = str(row['rider'])[1:]
            row['time'] = str(row['time']).replace(',,', '+')
        df.to_csv(endfile + str(raceid) + '.csv')
    except Exception as e:
        print('')
        print('Error: ', e)
    