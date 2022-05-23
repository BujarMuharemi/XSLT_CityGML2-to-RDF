from lxml import etree
from io import StringIO, BytesIO
import re
from pathlib import Path

"""
Description: Script for testing the possibility of auto generating XSLT-RDF templates files from the original CityGML files.
This should be possible because XML is a tree structure and thats just a restricted graph. 
"""

# reading spo-temp file
f = open(r'/home/bujar/Documents/_HFT/BA_IDP/Repo/citygml2-to-rdf/python-spo/spo-temp.xslt', "r")
og_lines = f.readlines() #original template, read from the file
output_file = []


xml = '<a xmlns="test"><b xmlns="test"/></a>'
root = etree.parse(r'/home/bujar/Documents/_HFT/BA_IDP/Repo/citygml2-to-rdf/gml-simplesolid-test/data/SimpleSolid.gml')


# changes the template according to the parameters, so it can later be written to the output flie
def writeToTemplate(matchingRegex,predicate,object):
    print("-------",matchingRegex,"\t",predicate,"\t",object)
    lines=og_lines[:]
    
    for i in range(len(lines)):               
        if re.search(r"\${{matchingRegex}}", lines[i]): 
            lines[i] = re.sub("\${{matchingRegex}}",matchingRegex,lines[i])
        elif re.search(r"\${{predicate}}", lines[i]): 
            lines[i] = re.sub("\${{predicate}}",predicate,lines[i])
        elif re.search(r"\${{object}}", lines[i]): 
            lines[i] = re.sub("\${{object}}",object,lines[i])
        #print(lines[i])
        
        #lines[i] = re.sub("\${{matchingRegex}}",matchingRegex,lines[i])
        #lines[i] = re.sub("\${{predicate}}",predicate,lines[i])
        #lines[i] = re.sub("\${{object}}",object,lines[i])
        #print(lines[i])
    #print("lines:\t",lines,"\n\n")
    output_file.append(lines)
    #lines=og_lines
    #print(output_file)


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

#writeToTemplate("bldg:Building/bldg:boundedBy/bldg:WallSurface","bldg:boundedBy","bldg:WallSurface")
#writeToTemplate("bldg:Building/bldg:lod2Solid/gml:Solid","bldg:lod2Solid","bldg:Solid")


#testing
#for item in output_file:
#    print(item)
#    print("\n\n")


#writing to file
with open('.\\output.xslt', 'w') as f:
    for item in output_file:
        for i in item:
            i = i.rstrip()
            f.write("%s\n" % i)

