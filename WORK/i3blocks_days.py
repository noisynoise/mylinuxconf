#!/usr/bin/python3

import os
from datetime import datetime
from datetime import date

now = datetime.now()
today = datetime.isocalendar(now)
year = (today[0])

mydate = date.today()
yearday = mydate.strftime("%j")

test3 = date(int(year), 12, 31)
totaldayz = test3.strftime("%j")
dayzleft = int(totaldayz) - int(yearday)
print(str(yearday) + "/" + str(dayzleft))
