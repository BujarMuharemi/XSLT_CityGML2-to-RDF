from lxml import etree
from io import StringIO, BytesIO
import re,sys
from pathlib import Path

"""
Description: Script for testing the possibility of auto generating XSLT-RDF templates files from the original CityGML files.
This should be possible because XML is a tree structure and thats just a restricted graph. 

TODO:    
    - missing ids for objects: gml:MultiSurface   
    - Building>Solid Linkage ? really necessary ?
"""
##################################################################################################
# File Parameters
# file output
path = "python-spo\\output\\auto-generated\\"
output_filename = "Meilding_one_building_base1.xslt"

# reading spo-temp file
spo_template = open(r'python-spo\\templates\\spo-temp.xslt', "r")
spo_temp_og_lines = spo_template.readlines() #original template, read from the file
spo_output_file = []

# blank-output-template
blank_output_template = open(r'python-spo\\templates\\blank-output-template.xslt', "r")
output_template_lines = blank_output_template.readlines() #original template, read from the file

# reading input gml file
root = etree.parse(r'python-spo\\input\\Meilding_one_building.gml')
#root = etree.parse(r'/home/bujar/Documents/_HFT/BA_IDP/Data/Meidling/Meidling_citygml/Meilding_building/Meilding_one_building.gml')


##################################################################################################
# Functions
# changes the template according to the parameters, so it can later be written to the output flie
def writeToOutputTemplate(matchingRegex,predicate,object):
    #print("-------",matchingRegex,"\t",predicate,"\t",object)
    lines=spo_temp_og_lines[:]
    
    for i in range(len(lines)):               
        if re.search(r"\${{matchingRegex}}", lines[i]): 
            lines[i] = re.sub("\${{matchingRegex}}",matchingRegex,lines[i])
        elif re.search(r"\${{predicate}}", lines[i]): 
            lines[i] = re.sub("\${{predicate}}",predicate,lines[i])
        elif re.search(r"\${{object}}", lines[i]): 
            lines[i] = re.sub("\${{object}}",object,lines[i])

        #print(lines[i])
    #print("lines:\t",lines,"\n\n")
    spo_output_file.append(lines)
    #lines=og_lines
    #print(output_file)


##################################################################################################
# Main 
# getting all paths of the elements
paths = [root.getpath(d) for d in root.iter()]
output = set() # set for storing just unique triples

# FIXME: exterior>CompositeSurface>surfaceMember is missing because it has a / length of 8 ? @simple solid test
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
print(output)

# showing found triples
print("\n═══ Number of found SPO Triples: ",len(output),"═══")
output_array=list(output)

for i in range(len(output_array)):
    print(i,":",output_array[i])

# getting input of user, of triples which should be ignored
try:
    blacklist = input("\nEnter number of triples, which should be skipped (like 5,6,7)\n").split(",") # getting blacklist from user
    blacklist = sorted(list(map(int,blacklist))) # converting input to int and sort then ascending
except:
    print(e)
    print("Pleas enter a valid number")
    sys.exit()

print("\n═══ Removing choosen triples ═══")
removedCount=0 # counter when removing an element
for i in blacklist:
    print("removed: ",output_array[i-removedCount])
    output_array.remove(output_array[i-removedCount])
    removedCount+=1

print("\n═══ Writing to output file ═══")
writeCount=0
for triples in output_array:
    print(">> to output ",writeCount,": ",triples)
    writeToOutputTemplate(triples, triples.split("/")[1], triples.split("/")[2])
    writeCount+=1
print("Wrote ",writeCount," triples to file.")


# turning the spo_output_file from a 2d array to a 1d string array
ab=''.join(str(item) for innerlist in spo_output_file for item in innerlist)

# writing to blak-output-template
for l in range(len(output_template_lines)):
    if re.search(r"\${{spo_temp_output}}", output_template_lines[l]): 
        output_template_lines[l] = ab

#writing to file
path = path + output_filename
with open(path, 'w') as spo_template:
    for line in output_template_lines:
        line = line.strip() # removing whitespaces
        #print(line) # print out every line, which is written to the file
        spo_template.write("%s\n" % line)

print("Wrote to file.")