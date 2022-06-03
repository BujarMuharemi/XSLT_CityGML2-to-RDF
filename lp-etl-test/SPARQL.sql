# Scratchpad for queries

#>>>counts all surfaces of each building
PREFIX bld: <http://biglinkeddata.com/>
PREFIX bl: <https://w3id.org/biolink/vocab/>
PREFIX bldg:   <http://www.opengis.net/citygml/building/2.0> 

SELECT ?building  (COUNT(?surface) as ?n_surfaces )
WHERE {
  ?building <http://www.opengis.net/citygml/building/2.0boundedBy> ?surface .
}GROUP BY ?building


#>>>counts all multisurfaces of each buliding
PREFIX bld: <http://biglinkeddata.com/>
PREFIX bl: <https://w3id.org/biolink/vocab/>
PREFIX bldg:   <http://www.opengis.net/citygml/building/2.0> 

SELECT ?b  (COUNT(?multisurface) as ?n_multisurfaces )
WHERE {
  #?building <http://www.opengis.net/citygml/building/2.0boundedBy> ?surface .
  #?s <http://www.opengis.net/citygml/2.0cityObjectMember> ?building ;
  ?b <http://www.opengis.net/citygml/building/2.0lod2MultiSurface> ?multisurface .
}GROUP BY ?b


#getting the wall surfaces of each buliding
PREFIX bld: <http://biglinkeddata.com/>
PREFIX bl: <https://w3id.org/biolink/vocab/>
PREFIX bldg:   <http://www.opengis.net/citygml/building/2.0> 

SELECT ?building  (COUNT(?wall_surface) as ?n_wall_surface )
WHERE {
  ?building <http://www.opengis.net/citygml/building/2.0boundedBy> ?wall_surface .
  filter( regex(str(?wall_surface), "WallSurface" ))
   
}GROUP BY ?building


#>>> counts Wall-,Ground-,RoofSurfaces of each building
PREFIX bld: <http://biglinkeddata.com/>
PREFIX bl: <https://w3id.org/biolink/vocab/>
PREFIX bldg:   <http://www.opengis.net/citygml/building/2.0> 

SELECT ?building   (Sum(if(contains(str(?wall_surface),"Wall"), 1, 0)) as ?n_wall_surface) (Sum(if(contains(str(?wall_surface),"Roof"), 1, 0)) as ?n_roof_surface) (Sum(if(contains(str(?wall_surface),"Ground"), 1, 0)) as ?n_ground_surface) 

WHERE {
  ?building <http://www.opengis.net/citygml/building/2.0boundedBy> ?wall_surface .
}
GROUP BY ?building
ORDER BY DESC(?n_wall_surface)



'''
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

 
 


