# simplesolid-test
This test ist based on the previous *gml-mini-test*. 

In the subfolders you can find the input/output data, resulting graph images and the json file for importing into the ETL pipeline.


## graph visualization 
The following pictures show the different stages of the graph.

- Graph#4 
    - ![graph#4](./graph-images/rdf-grapher4_noIDs.png) 

- Graph#5 No working IDs
    - ![graph#5](./graph-images/rdf-grapher5_noIDs.png) 

- Graph#6 wrong IDs
    - ![graph#6wrong](./graph-images/rdf-grapher6_wrongIDs.png) 

- Graph#6 wrong linkage to polygons, just over the schema:identifier (unnecessary long)
    - ![graph#6wronglin](./graph-images/rdf-grapher6.svg) 

- Graph#7 fixed linkage
    - ![graph#7](./graph-images/rdf-grapher7.svg) 
    The two rdf:type edges on the polygon entities are there, because of the graph rendering tool. In the output rdf file there is just one edge.

