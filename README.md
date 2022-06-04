# XSLT_CityGML2-to-RDF
XSLT files for the transformation of citygml2 files into the rdf format. These are meant to be used with the [LinkedPipes ETL](https://github.com/linkedpipes/etl) Repo as ETL Tool. In this repository you can find the input/output files and also the json files, to import the pipeline into your LP ETL setup. 


## Tools
- [LinkedPipes ETL](https://github.com/linkedpipes/etl) Tool
    -  [Tutorial](https://etl.linkedpipes.com/tutorials/how-to/convert_xml_to_rdf) was used as a base to get started with the transformation process.
- [RDF Grapher](https://www.ldf.fi/service/rdf-grapher) was used to visualize the resulting graphs and save them as image.
- [Apache Jena Fuseki](https://jena.apache.org/documentation/fuseki2/) as SPARQL server and RDF database


## Test setups
Multiple tests were performed, to get the final results. The first *gml-mini-test*, was used as a starting point for the project. The second *gml-simplesolid-test*, builds on the first and creates the final graph. In the respective test folders, you can find more information about each of them.


### Setups
Chronological order of conducted tests.
1. [gml-mini-test](./gml-mini-test/README.md) 
2. [gml-simplesolid-test](./gml-simplesolid-test/README.md)
3. [python-spo](./python-spo/README.md)
4. [lp-etl-test](./lp-etl-test/README.md)
5. [final-xslt](./final-xslt/README.md)

## Results
TBA
