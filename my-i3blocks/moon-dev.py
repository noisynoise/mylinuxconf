#!/usr/bin/python3
import requests
import json
from datetime import datetime

### variables ###
base_uri = "http://api.farmsense.net/v1/moonphases/?d="
oneday = int(86400)
now = datetime.now()
daydict = {}
moondict = {}

### classes ###
class Dates:
    def __init__(self, now):
        self.now = now

    def todayts(self):
        todayts = int(datetime.timestamp(now))
        daydict["today"] = todayts
        return moondict

    def yesterdayts(self):
        yesterdayts = int(datetime.timestamp(now)) - oneday
        daydict["yesterday"] = yesterdayts
        return moondict

class GetURI:
    def __init__(self, timestamp):
        self.timestamp = str(timestamp)

    def myuri(self):
        fulluri = base_uri + self.timestamp
        return fulluri

class MoonState:
    def __init__(self, fulluri):
        self.fulluri = fulluri

    def apirequest(self):
        moon_req = requests.get(self.fulluri)
        moon_json = json.dumps(moon_req.json(), sort_keys=True, indent=4)
        moon_datas = json.loads(moon_json)
        return moon_datas

### Main ###
moondate = Dates(now)
todayts = moondate.todayts()
yesterdayts = moondate.yesterdayts()

for keys,values in daydict.items():
    uri = GetURI(values)
    uri_checked = uri.myuri()
    moon_data = MoonState(uri_checked)
    mdata = moon_data.apirequest()
    moondict[str(keys)] = mdata

currentmoonillu=(moondict['today'][0]['Illumination'])
currentmoonphase=(moondict['today'][0]['Phase'])
currentmoonindex=(moondict['today'][0]['Index'])
lastmoonillu=(moondict['yesterday'][0]['Illumination'])
lastmoonphase=(moondict['yesterday'][0]['Phase'])
lastmoonindex=(moondict['yesterday'][0]['Index'])
# print("[Phase: " + currentmoonphase + "] - [Day: " + str(currentmoonindex) + "] - [Illu: " + str(currentmoonillu) + "]")
print(moondict['today'])

