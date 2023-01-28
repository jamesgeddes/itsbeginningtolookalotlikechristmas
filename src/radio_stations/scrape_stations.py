# Not currently implemented

from bs4 import BeautifulSoup
import requests


def get_stations():
    response = requests.get('http://www.radiofeeds.co.uk/mp3.asp')
    soup = BeautifulSoup(response.text, 'lxml')
    result = []
    for radio in soup.find_all('a', {'onclick': 'if(!confirm(txt)) return false;'}):
        result.append({
            'Station Name': radio.get_text(),
            'Stream URL': radio.findNext('td', {'width': '68%'}).find('a').get('href')
        })
    return result