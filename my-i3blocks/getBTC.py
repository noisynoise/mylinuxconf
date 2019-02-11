#!/usr/bin/python3
import os 
import requests
import json
import readline
import pprint
from datetime import datetime


### variables ###
pp = pprint.PrettyPrinter(indent=4)
base_uri = "http://api.kraken.com"


## TEST
# server time api :
# st_api = "/0/public/Time"

# # cust_api = input("please enter uri suffix: ")
# suff_api = "/0/public/Assets"
# suff_apii = "/0/public/AssetPairs"
# # list_api = [suff_api, suff_apii]
# test_api = base_uri + suff_api 
# my_req = requests.get(test_api)
# rsp = json.dumps(my_req.json(), sort_keys=True, indent=4)
# rsp_data = json.loads(rsp)
# pp.pprint(rsp_data["result"]["XXBT"])
# 
# 
# test2 = base_uri + suff_apii
# my_req = requests.get(test2)
# rsp = json.dumps(my_req.json(), sort_keys=True, indent=4)
# rsp_data = json.loads(rsp)
# pp.pprint(rsp_data["result"]["XXBTZEUR"])

pair_uri = "/0/public/Ticker?pair=XXBTZEUR"
BTC_api = base_uri + pair_uri
my_req = requests.get(BTC_api)
rsp = json.dumps(my_req.json(), sort_keys=True, indent=4)
rsp_data = json.loads(rsp)
BTC = rsp_data["result"]["XXBTZEUR"]["c"][0]
print(float(BTC))
