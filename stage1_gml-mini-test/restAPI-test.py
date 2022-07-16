import requests
import json

'''
script for testing of the ETL REST API
To do:
    - should update the xslt template of the XSLT Transformer Component with the local .xslt file
    - should execute the pipeline
    - should return the respons of the request as terminal output 

https://docs.python-requests.org/en/latest/api/
https://docs.python-requests.org/en/latest/api/#requests.Request
'''

#json=open("data/gml-mini-test/body.json", "r")
json = "test123"

mode="cors"
credentials="omit"
referrer="http://localhost:8080/"
url = "http://localhost:8080/resources/pipelines/1651656568788?unchecked=true"
headers = {"User-Agent": "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:99.0) Gecko/20100101 Firefox/99.0","Accept": "application/json, text/plain, */*","Accept-Language": "en-US,en;q=0.5","Content-Type": "application/json","Sec-Fetch-Dest": "empty","Sec-Fetch-Mode": "cors","Sec-Fetch-Site": "same-origin"}
response = requests.put(url, data=json, headers=headers)

print(response.content)