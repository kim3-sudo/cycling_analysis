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
from datetime import timedelta
import re
import time

now = datetime.now()
dt_string = now.strftime("_%d%m%Y_%H%M%S")
enddir = 'D:\\development\\touralpes\\'
endfile = enddir + 'scrape' + dt_string + '_'

header = {
  "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.75 Safari/537.36",
  "X-Requested-With": "XMLHttpRequest"
}

url_list = []
url_file = 'https://raw.githubusercontent.com/kim3-sudo/cycling_analysis/main/data/touralpessites.txt'
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
alldf = pd.DataFrame()

for index, url in enumerate(url_list):
    #time.sleep(1)
    print('On URL', index, 'of', len(url_list), ':', url)
    try:
        i = url
        raceid = url[37:]
        raceid = raceid.replace('/', '-')
        headers = {'User-Agent': 'Mozilla/5.0'}
        data = requests.get(url, headers = headers)
        
        soup = BeautifulSoup(data.text, 'lxml')
        
        stage = re.findall('tour-of-the-alps\/\d\d\d\d\/stage-\d\w?', i)[0]
        year = re.findall('\d\d\d\d', i)[0]
        
        table = soup.find('table', attrs = {'class': 'results'})
        
        data_rows = ''
    
        data_rows = table.find_all('tr')
    
        data = []
        for tr in data_rows:
            td = tr.find_all('td')
            row = [tr.text for tr in td]
            data.append(row)
        
        stageList = []
        for tr in data_rows:
            stage = str(stage).lstrip('[')
            stage = str(stage).rstrip(']')
            stage = re.sub('<[^<]+>', "", stage)
            stageList.append(stage)
        
        yearList = []
        for tr in data_rows:
            year = str(year).lstrip('[')
            year = str(year).rstrip(']')
            year = re.sub('<[^<]+>', "", year)
            yearList.append(year)
        
        df = pd.DataFrame(data, columns = ['rank','prev','standing','bib','rider','age','team', 'uci', 'point','time'])
        df['stage'] = stageList
        df['year'] = yearList
        df = df.iloc[1:]
        
        # Clean up rider using team
        for index, row in tqdm(df.iterrows(), desc='Team clean'):
            row['rider'] = str(row['rider']).replace(str(row['team']), '')
            row['rider'] = str(row['rider'])[1:]
            
        # Clean up times
        for index, row in tqdm(df.iterrows(), desc='Time clean'):
            row['time'] = str(row['time']).replace(',,', '+')
            currentTime = str(row['time'])
            n = len(currentTime) // 2
            if currentTime[:n] == currentTime[n:]:
                row['time'] = '+' + currentTime[:n]
        
        # Remove DNF or OTL obs
        for index, row in tqdm(df.iterrows(), desc='Remove DNF'):
            if str(row['rank']).isnumeric() == False:
                df = df.drop([index])
                
        # Standardize times to winner's time
        winTimeSeconds = 0
        for index, row in tqdm(df.iterrows(), desc='Normalize times'):
            #winTimeSeconds = 0
            activeTime = 0
            currentTime = str(row['time'])
            if '+' not in currentTime:
                winTimeH, winTimeM, winTimeS = 0, 0, 0
                seconds = 0
                count = 0
                for i in currentTime:
                    if i == ':':
                        count = count + 1
                if count == 1:
                    winTimeM, winTimeS = currentTime.split(':')
                    seconds = int(winTimeM) * 60 + int(winTimeS)
                elif count == 2:
                    winTimeH, winTimeM, winTimeS = currentTime.split(':')
                    seconds = int(winTimeH) * 3600 + int(winTimeM) * 60 + int(winTimeS)
                winTimeSeconds = seconds
                activeTime = seconds
            elif '+' in currentTime:
                addTimeH, addTimeM, addTimeS = 0, 0, 0
                addSeconds = 0
                count = 0
                for i in currentTime:
                    if i == ':':
                        count = count + 1
                if count == 0:
                    continue
                elif count == 1:
                    addTimeM, addTimeS = currentTime.split(':')
                    addSeconds = int(addTimeM) * 60 + int(addTimeS)
                elif count == 2:
                    addTimeH, addTimeM, addTimeS = currentTime.split(':')
                    addSeconds = int(addTimeH) * 3600 + int(addTimeM) * 60 + int(addTimeS)
                else:
                    continue
                activeTime = winTimeSeconds + addSeconds
            # convert back from seconds to proper time and change entry in df
            row['time'] = str(timedelta(seconds = activeTime))
        
        df.to_csv(endfile + str(raceid) + '.csv')
        alldf = alldf.append(df, ignore_index = True)

    except Exception as e:
        print('')
        print('Error', e)
        print('Maybe it was a TT or the year\s competition was skipped?')

alldf.to_csv(endfile + 'tour_of_the_alps_all.csv')
    