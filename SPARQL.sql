# Scratchpad for SPARQL queries

# get all buildings 
PREFIX core: <http://www.opengis.net/citygml/2.0>

SELECT ?o 
WHERE {
  <core:CityModel/> ?p ?o .  
  FILTER regex(str(?o), "Building", "i") 
}
# returns 82 buildings

# counts all surfaces of each building
PREFIX bld: <http://biglinkeddata.com/>
PREFIX bl: <https://w3id.org/biolink/vocab/>
PREFIX bldg:   <http://www.opengis.net/citygml/building/2.0> 

SELECT ?building  (COUNT(?surface) as ?n_surfaces )
WHERE {
  ?building <http://www.opengis.net/citygml/building/2.0boundedBy> ?surface .
}GROUP BY ?building


# counts all multisurfaces of each buliding
PREFIX bld: <http://biglinkeddata.com/>
PREFIX bl: <https://w3id.org/biolink/vocab/>
PREFIX bldg:   <http://www.opengis.net/citygml/building/2.0> 

SELECT ?b  (COUNT(?multisurface) as ?n_multisurfaces )
WHERE {
  #?building <http://www.opengis.net/citygml/building/2.0boundedBy> ?surface .
  #?s <http://www.opengis.net/citygml/2.0cityObjectMember> ?building ;
  ?b <http://www.opengis.net/citygml/building/2.0lod2MultiSurface> ?multisurface .
}GROUP BY ?b


# getting the wall surfaces of each buliding
PREFIX bld: <http://biglinkeddata.com/>
PREFIX bl: <https://w3id.org/biolink/vocab/>
PREFIX bldg:   <http://www.opengis.net/citygml/building/2.0> 

SELECT ?building  (COUNT(?wall_surface) as ?n_wall_surface )
WHERE {
  ?building <http://www.opengis.net/citygml/building/2.0boundedBy> ?wall_surface .
  filter( regex(str(?wall_surface), "WallSurface" ))
   
}GROUP BY ?building


# counts Wall-,Ground-,RoofSurfaces of each building
PREFIX bld: <http://biglinkeddata.com/>
PREFIX bl: <https://w3id.org/biolink/vocab/>
PREFIX bldg:   <http://www.opengis.net/citygml/building/2.0> 

SELECT ?building   (Sum(if(contains(str(?wall_surface),"Wall"), 1, 0)) as ?n_wall_surface) (Sum(if(contains(str(?wall_surface),"Roof"), 1, 0)) as ?n_roof_surface) (Sum(if(contains(str(?wall_surface),"Ground"), 1, 0)) as ?n_ground_surface) 

WHERE {
  ?building <http://www.opengis.net/citygml/building/2.0boundedBy> ?wall_surface .
}
GROUP BY ?building
ORDER BY DESC(?n_wall_surface)


# get all attributes of a building
PREFIX bldg:	<http://www.opengis.net/citygml/building/2.0> 
PREFIX ex:	<http://example.org/stuff/1.0/>
PREFIX gen: <http://www.opengis.net/citygml/generics/2.0>

SELECT ?building  ?ex_has ?value
WHERE {
  ?building <http://example.org/stuff/1.0/has> ?ex_has .
  ?ex_has gen:value ?value .
}

# counts the number of attributes of each building
PREFIX core: <http://www.opengis.net/citygml/2.0>

SELECT ?building (count(?ex_has) as ?count)
WHERE {
  <core:CityModel/> ?p ?building .  
  FILTER regex(str(?building), "Building", "i") 
  ?building <http://example.org/stuff/1.0/has> ?ex_has .
  
}
GROUP BY ?building
ORDER BY DESC(?count)


# filter attributes by regex
  PREFIX gen: <http://www.opengis.net/citygml/generics/2.0>

  SELECT ?building  ?ex_has ?value
  WHERE {
    ?building <http://example.org/stuff/1.0/has> ?ex_has .
    ?ex_has gen:value ?value .
    FILTER regex(str(?ex_has), "heatingDemandValue_s1", "i") 
  }

# just returns 44 building. This means some buildings, miss this attribute. 


# calculates average heatingDemandValue_s1 an shows the corresponding surfaces
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX gen: <http://www.opengis.net/citygml/generics/2.0>

SELECT ?building (AVG(xsd:float(?value)) as ?avg) (Sum(if(contains(str(?wall_surface),"Wall"), 1, 0)) as ?n_wall_surface) (Sum(if(contains(str(?wall_surface),"Roof"), 1, 0)) as ?n_roof_surface) (Sum(if(contains(str(?wall_surface),"Ground"), 1, 0)) as ?n_ground_surface) 

WHERE {
  ?building <http://example.org/stuff/1.0/has> ?ex_has .
  ?ex_has gen:value ?value .
  FILTER regex(str(?ex_has), "heatingDemandValue_s1", "i") 
  ?building <http://www.opengis.net/citygml/building/2.0boundedBy> ?wall_surface .
}
GROUP BY ?building

# calculates heatingDemandValue,footprinArea and shows the different surfaces
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX gen: <http://www.opengis.net/citygml/generics/2.0>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX gen: <http://www.opengis.net/citygml/generics/2.0>

SELECT ?building (AVG(xsd:float(?value)) as ?heatingDemandValue) (AVG(xsd:float(?value1)) as ?FootPrintArea) (Sum(if(contains(str(?wall_surface),"Wall"), 1, 0)) as ?n_wall_surface) (Sum(if(contains(str(?wall_surface),"Roof"), 1, 0)) as ?n_roof_surface) (Sum(if(contains(str(?wall_surface),"Ground"), 1, 0)) as ?n_ground_surface) 

WHERE {
  ?building <http://example.org/stuff/1.0/has> ?ex_has .
  FILTER regex(str(?ex_has), "heatingDemandValue_s1", "i") 
  ?ex_has gen:value ?value . 
  
  ?building <http://example.org/stuff/1.0/has> ?ex_has1 .
  FILTER regex(str(?ex_has1), "footprintArea", "i") 
  ?ex_has1 gen:value ?value1 . 
  
  ?building <http://www.opengis.net/citygml/building/2.0boundedBy> ?wall_surface .
}
GROUP BY ?building


# get all polygons of a roofSurface
PREFIX gml: <http://www.opengis.net/gml>
PREFIX bldg:   <http://www.opengis.net/citygml/building/2.0> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

SELECT   ?roof ?multisurface ?polygon 
WHERE {
  ?roof rdf:type bldg:RoofSurface ;
                bldg:lod2MultiSurface ?multisurface .
  ?multisurface gml:surfaceMember ?polygon .
}

# ch51_stage_2
PREFIX schema: <http://schema.org/>
PREFIX gml: <http://www.opengis.net/gml>
PREFIX bldg:   <http://www.opengis.net/citygml/building/2.0> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

SELECT   ?surface ?multisurface ?polygon 
WHERE {
  ?surface bldg:lod2MultiSurface ?multisurface .
  ?multisurface gml:surfaceMember ?polygon .
}

# ch51_stage_5
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX a: <http://10.93.18.43:3030/default>

SELECT ?subject ?predicate ?object
WHERE {
  GRAPH a: {
  	?roof rdf:type bldg:RoofSurface .
   	?roof gml:surfaceMember ?s  
  } 
  
}

# get all stringAttribute values of one building
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX gml: <http://www.opengis.net/gml>
PREFIX bldg:   <http://www.opengis.net/citygml/building/2.0> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX ex: 	<http://example.org/stuff/1.0/>
PREFIX  generics: <http://www.opengis.net/citygml/generics/2.0>
PREFIX graph: <http://10.93.18.43:3030/stage4Test10MB/1GB>

SELECT ?o ?a ?b
WHERE {
  GRAPH graph: {
    #?roof rdf:type bldg:Building .
   	#?roof gml:surfaceMember ?s
    	
	<bldg:Building/uuid_209ac87e-4fbb-47ca-b529-204fe730ff56> ex:has ?o .
    ?o generics:value ?b
    
    
  #?multisurface gml:surfaceMember ?polygon .
  } 
  
}
## draft

# 
PREFIX bl: <https://w3id.org/biolink/vocab/>
PREFIX schema: <http://schema.org/>
PREFIX bld: <http://biglinkeddata.com/>
PREFIX gr: <http://purl.org/goodrelations/v1#>
PREFIX gm: <http://def.seegrid.csiro.au/isotc211/iso19107/2003/geometry#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX gml: <http://www.opengis.net/gml>
PREFIX bldg:   <http://www.opengis.net/citygml/building/2.0> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX ex: 	<http://example.org/stuff/1.0/>
PREFIX  generics: <http://www.opengis.net/citygml/generics/2.0>


SELECT ?building (count(?o)as ?sn)
WHERE {
    ?building rdf:type bldg:Building .
  	
  	#?building bldg:boundedBy  ?surface .
    #?surface rdf:type bldg:WallSurface .
  	FILTER NOT EXISTS { ?building bldg:boundedBy ?surface }
  	?building ex:has ?o
}

group by ?building


# return just buildings which have more than 4 walls
SELECT ?building (count(?surface)as ?no_wall_surfaces) #((bldg:boundedBy) as ?a)
WHERE {
    ?building rdf:type bldg:Building .
?building bldg:boundedBy ?surface .
?surface rdf:type bldg:WallSurface .
  	#?building ex:has ?o
}
group by ?building
having (?no_wall_surfaces>4)




'''
# union
PREFIX bld: <http://biglinkeddata.com/>
PREFIX bl: <https://w3id.org/biolink/vocab/>
PREFIX bldg:   <http://www.opengis.net/citygml/building/2.0> 
PREFIX gen: <http://www.opengis.net/citygml/generics/2.0>

SELECT ?building ?value ?value_e
{
  {
    ?building <http://example.org/stuff/1.0/has> ?ex_has .
    ?ex_has gen:value ?value_e .
    FILTER regex(str(?ex_has), "primaryEnergyDemandClass", "i") 

    #FILTER regex(str(?building), "d53e2acb", "i") 
  } union
  {
    ?building <http://example.org/stuff/1.0/has> ?ex_has .
    ?ex_has gen:value ?value .
    FILTER regex(str(?ex_has), "footprintArea", "i") 
  }
}

# Draft after here
PREFIX bld: <http://biglinkeddata.com/>
PREFIX bl: <https://w3id.org/biolink/vocab/>
PREFIX bldg:   <http://www.opengis.net/citygml/building/2.0> 


CONSTRUCT {<bldg:Building/uuid_209ac87e-4fbb-47ca-b529-204fe730ff56> bldg:boundedBy ?object}
SELECT ?object
SELECT ?object (count(distinct ?object) as ?count)
WHERE {
	<bldg:Building/uuid_209ac87e-4fbb-47ca-b529-204fe730ff56> ?predicate ?object
	<bldg:Building/uuid_209ac87e-4fbb-47ca-b529-204fe730ff56> bldg:boundedBy ?object
}
GROUP BY ?object


SELECT  ?o
WHERE {
  <core:CityModel/> <http://www.opengis.net/citygml/2.0cityObjectMember> ?o
}
'''
SELECT ?x
WHERE
{ ?x ns:SomePredicate ?y .
  FILTER regex(?y, "YOUR_REGEX", "i") }


PREFIX bld: <http://biglinkeddata.com/>
PREFIX bl: <https://w3id.org/biolink/vocab/>
PREFIX bldg:   <http://www.opengis.net/citygml/building/2.0> 

SELECT ?a ?surface
WHERE {
  #<core:CityModel/> <http://www.opengis.net/citygml/2.0cityObjectMember> ?o 
  #?s <http://www.opengis.net/citygml/2.0cityObjectMember> ?o ;
  ?a <http://www.opengis.net/citygml/building/2.0boundedBy> ?surface .
  #FILTER regex(?y, "YOUR_REGEX", "i") }
}#GROUP BY ?a

 
 


