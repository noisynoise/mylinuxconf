#!/usr/bin/python3

import os
from datetime import datetime
from datetime import date

now = datetime.now()
today = datetime.isocalendar(now)
yearweek = today[1]
year = (today[0])

mydate = date.today()
yearday = mydate.strftime("%j")

lastyearday = date(int(year), 12, 31)
totaldayz = lastyearday.strftime("%j")
dayzleft = int(totaldayz) - int(yearday)
print(str(yearday) + "/" + str(dayzleft) + " - Week " + str(yearweek))
