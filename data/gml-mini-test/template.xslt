<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:core="http://www.opengis.net/citygml/2.0" 
xmlns:gen="http://www.opengis.net/citygml/generics/2.0" 
xmlns:bldg="http://www.opengis.net/citygml/building/2.0" 
xmlns:app="http://www.opengis.net/citygml/appearance/2.0" 
xmlns:dem="http://www.opengis.net/citygml/relief/2.0" 
xmlns:gml="http://www.opengis.net/gml" 
xmlns:xlink="http://www.w3.org/1999/xlink" 
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
xmlns:schema="http://schema.org/"
xsi:schemaLocation="http://www.opengis.net/citygml/building/2.0 http://schemas.opengis.net/citygml/building/2.0/building.xsd http://www.opengis.net/citygml/appearance/2.0 http://schemas.opengis.net/citygml/appearance/2.0/appearance.xsd http://www.opengis.net/citygml/relief/2.0 http://schemas.opengis.net/citygml/relief/2.0/relief.xsd http://www.opengis.net/citygml/2.0 http://schemas.opengis.net/citygml/2.0/cityGMLBase.xsd http://www.opengis.net/citygml/generics/2.0 http://schemas.opengis.net/citygml/generics/2.0/generics.xsd">

<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" normalization-form="NFC"/>
<xsl:strip-space elements="*"/>


  <xsl:param name="ns">http://www.opengis.net/citygml/building/2.0/</xsl:param>
  <!-- Templates -->
<xsl:template match="/core:CityModel">
  <rdf:RDF><xsl:apply-templates/></rdf:RDF>
</xsl:template>

<xsl:template match="core:cityObjectMember/bldg:Building">
    <xsl:variable name="lod2Solid" select="bldg:lod2Solid"/>
    <xsl:variable name="Solid" select="gml:Solid"/>
    <xsl:variable name="id" select="@gml:id"/>
    
    
    <bldg:Building rdf:about="{concat('bldg:Building/', $id)}">
      <schema:identifier><xsl:value-of select="$id"/></schema:identifier>
      <xsl:apply-templates>
        <xsl:with-param name="iri-slug" select="$id" tunnel="yes"/>
      </xsl:apply-templates>
    </bldg:Building>
</xsl:template>
        

<!-- 
<xsl:template match="bldg:Building/bldg:lod2Solid/gml:Solid">
    <xsl:text>&lt;bldg:Building bldg:lod2Solid gml:Solid</xsl:text>        
</xsl:template>
 -->

<!-- Catch-all empty template -->
<xsl:template match="text()|@*" mode="#all"/>

</xsl:stylesheet>

