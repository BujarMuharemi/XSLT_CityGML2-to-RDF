# citygml2-to-rdf
XSLT files for the transformation of citygml2 files into the rdf format. These are meant to be used with the [LinkedPipes ETL](https://github.com/linkedpipes/etl) Repo as ETL Tool. 

## Tools
- [LinkedPipes ETL](https://github.com/linkedpipes/etl) Repo 
-  [Tutorial](https://etl.linkedpipes.com/tutorials/how-to/convert_xml_to_rdf) was used as a base to get started with the transformation process.
- [RDF Grapher](https://www.ldf.fi/service/rdf-grapher) was used to visualize the resulting graphs and save them as image.

## To Do
- [ ] add source of the simplesolid file to readme
- [X] add lod2MultiSurface and generate ids for them
- [X] add the lod2Solid tree down to leafs
- [ ] link lod2Solid/surfaceMember nodes to the Polygons members