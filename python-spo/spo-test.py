from lxml import etree
from io import StringIO, BytesIO
import re
from pathlib import Path

"""
Description: Script for testing the possibility of auto generating XSLT-RDF templates files from the original CityGML files.
This should be possible because XML is a tree structure and thats just a restricted graph. 
"""

# reading spt-temp file
f = open(r'D:\Documents\_UNI\BA-IDP\repo\citygml2-to-rdf\python-spo\spo-temp.xslt', "r")
og_lines = f.readlines()
output_file = []

xml = '<a xmlns="test"><b xmlns="test"/></a>'
root = etree.parse(r'D:\Documents\_UNI\BA-IDP\repo\citygml2-to-rdf\gml-simplesolid-test\data\SimpleSolid.gml')


# changes the template according to the parameters, so it can later be written to the output flie
def writeToTemplate(matchingRegex,predicate,object):
    print("-------",matchingRegex,predicate,object)
    lines=og_lines

    for i in range(len(og_lines)):        
        lines[i] = re.sub("\${{matchingRegex}}",matchingRegex,og_lines[i])
        lines[i] = re.sub("\${{predicate}}",predicate,og_lines[i])
        lines[i] = re.sub("\${{object}}",object,og_lines[i])
    #print(lines,"\n\n")
    output_file.append(lines)
    print(len(output_file))


# getting all paths of the elements
paths = [root.getpath(d) for d in root.iter()]
output = set() # set for storing just unique triples

# exterior>CompositeSurface>surfaceMember is missing because it has a / length of 8 ?
for e in paths:
    #print(e)
    
    if(e.count("/")%2!=0 and e.count("/")>1):
        array = e.split("/")         
        array.pop(0) # remove first empty element
        #print(array)
        a3 = array[-3:] 
        #print(a3)
        a3[1]=re.sub("\[[0-9]+\]","",a3[1]) 
        a = '/'.join(a3)
        output.add(a)
        #print(e.count("/"),"\t",e)
    #elif(e.count("/")==4): #needs also too look up if this element has any children
        #print("possible attribute:\t",e.count("/"),"\t",e)


#showing found triples
print("\nNumber of found SPO Triples: ",len(output))
for a in output:
    print(a)
    writeToTemplate(a,a.split("/")[1],a.split("/")[2])


#testing
for item in output_file:
    print(item)
    print("\n\n")


#writing to file
with open('.\\output.xslt', 'w') as f:
    for item in output_file:
        for i in item:
            i = i.rstrip()
            f.write("%s\n" % i)

