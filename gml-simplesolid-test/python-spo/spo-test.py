from lxml import etree
from io import StringIO, BytesIO
import re

# Script for testing the possibility of auto generating XSLT-RDF templates files from the original CityGML files.
# This should be possible because XML is a tree structure and thats just a restricted graph. 


xml = '<a xmlns="test"><b xmlns="test"/></a>'
root = etree.parse(r'path to file...')
#print(etree.tostring(root))

#for tags in root.iter('gml:surfaceMember'):
#     print(tags.tag, tags.text)

#for element in root.iter():
#    print("%s - %s" % (element.tag, element.text))

# getting all paths of the elements
paths = [root.getpath(d) for d in root.iter()]

output = set()

# exterior>CompositeSurface>surfaceMember is missing because it has a / length of 8
for e in paths:
    if(e.count("/")%2!=0 and e.count("/")>1):
        array = e.split("/")
        a3 = array[-3:] 
        a3[1]=re.sub("\[[0-9]\]","",a3[1]) 
        a = '/'.join(a3)
        output.add(a)
        print(e.count("/"),"\t",e)

print("\nNumber of found SPO Triples: ",len(output))
for a in output:
    print(a)