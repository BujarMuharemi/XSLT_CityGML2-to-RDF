# SPO Python Test
This part of the projects contains a python script for generating a XSLT template. That template can be used as base, which saves a lot of time. It generates an XSLT file from a CityGML input file. That file should only have one instance of a building. It should also be as similar as possible to the other buildings, which want to transformed.



## Algorithm

## Folders
- graph-images: graphs which were created by the xslt files. Also contains the RDF files
- input: used citygml files
- output 
    - auto-generated: contains the unedited xslt output of the script
    - edited: templates which were edited from the aut-generated folder
    - drafts: were created while writing the python script
- templates: contains the templates which are used as base by the python script


## Stept/Tutorial
## Results
Two datasets were tested with the script. For once the SimpleSolid bulding from the previous test and also one building from the Meilding dataset.

### Simple Solid test
First graph, where just the root node was added. 
[First Graph](./graph-images/SimpleSolid_base1_edited.svg) .

[First Graph](./graph-images/SimpleSolid_base2_edited.svg) .

