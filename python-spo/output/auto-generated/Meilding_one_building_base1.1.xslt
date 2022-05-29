<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:core="http://www.opengis.net/citygml/2.0" xmlns:gen="http://www.opengis.net/citygml/generics/2.0" xmlns:bldg="http://www.opengis.net/citygml/building/2.0" xmlns:app="http://www.opengis.net/citygml/appearance/2.0" xmlns:dem="http://www.opengis.net/citygml/relief/2.0" xmlns:gml="http://www.opengis.net/gml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:f="http://opendata.cz/xslt/functions#" xmlns:schema="http://schema.org/" xsi:schemaLocation="http://www.opengis.net/citygml/building/2.0 http://schemas.opengis.net/citygml/building/2.0/building.xsd http://www.opengis.net/citygml/appearance/2.0 http://schemas.opengis.net/citygml/appearance/2.0/appearance.xsd http://www.opengis.net/citygml/relief/2.0 http://schemas.opengis.net/citygml/relief/2.0/relief.xsd http://www.opengis.net/citygml/2.0 http://schemas.opengis.net/citygml/2.0/cityGMLBase.xsd http://www.opengis.net/citygml/generics/2.0 http://schemas.opengis.net/citygml/generics/2.0/generics.xsd" xmlns:ex="http://example.org/stuff/1.0/">

<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" normalization-form="NFC" />
<xsl:strip-space elements="*" />

<xsl:param name="ns">http://www.opengis.net/citygml/building/2.0/</xsl:param>

<!-- Convert text into IRI-safe slug. -->
<xsl:function name="f:slugify">
<xsl:param name="text" />
<xsl:value-of select="encode-for-uri(lower-case($text))" />
</xsl:function>

<!-- ROOT entity/subject  -->
<!-- Change to the root element of your CityGML file  -->
<xsl:template match="ROOT">
<xsl:variable name="id" select="f:slugify(@gml:id)" />

<ROOT rdf:about="{concat('ROOT/', $id)}">
<schema:identifier>
<xsl:value-of select="$id" />
</schema:identifier>
<xsl:apply-templates>
<xsl:with-param name="id" select="$id" tunnel="yes" />
</xsl:apply-templates>
</ROOT>
</xsl:template>

<!-- auto generate - Predicate:bldg:lod2MultiSurface  -->
<!-- auto generate - Object:gml:MultiSurface  -->
  <xsl:template match="bldg:WallSurface/bldg:lod2MultiSurface/gml:MultiSurface">  
    <xsl:variable name="id" select="f:slugify(@gml:id)" />

    <bldg:lod2MultiSurface>
      <gml:MultiSurface rdf:about="{concat('gml:MultiSurface/', $id)}">
        <schema:identifier>
          <xsl:value-of select="concat('gml:MultiSurface.',$id)" />          
        </schema:identifier>

        <xsl:apply-templates>
          <xsl:with-param name="id" select="$id" tunnel="yes" />
        </xsl:apply-templates>

      </gml:MultiSurface>
    </bldg:lod2MultiSurface>
  </xsl:template>

<!-- auto generate - Predicate:bldg:lod2MultiSurface  -->
<!-- auto generate - Object:gml:MultiSurface  -->
  <xsl:template match="bldg:GroundSurface/bldg:lod2MultiSurface/gml:MultiSurface">  
    <xsl:variable name="id" select="f:slugify(@gml:id)" />

    <bldg:lod2MultiSurface>
      <gml:MultiSurface rdf:about="{concat('gml:MultiSurface/', $id)}">
        <schema:identifier>
          <xsl:value-of select="concat('gml:MultiSurface.',$id)" />          
        </schema:identifier>

        <xsl:apply-templates>
          <xsl:with-param name="id" select="$id" tunnel="yes" />
        </xsl:apply-templates>

      </gml:MultiSurface>
    </bldg:lod2MultiSurface>
  </xsl:template>

<!-- auto generate - Predicate:*  -->
<!-- auto generate - Object:bldg:Building  -->
  <xsl:template match="*/*/bldg:Building">  
    <xsl:variable name="id" select="f:slugify(@gml:id)" />

    <*>
      <bldg:Building rdf:about="{concat('bldg:Building/', $id)}">
        <schema:identifier>
          <xsl:value-of select="concat('bldg:Building.',$id)" />          
        </schema:identifier>

        <xsl:apply-templates>
          <xsl:with-param name="id" select="$id" tunnel="yes" />
        </xsl:apply-templates>

      </bldg:Building>
    </*>
  </xsl:template>

<!-- auto generate - Predicate:bldg:lod2Solid  -->
<!-- auto generate - Object:gml:Solid  -->
  <xsl:template match="bldg:Building/bldg:lod2Solid/gml:Solid">  
    <xsl:variable name="id" select="f:slugify(@gml:id)" />

    <bldg:lod2Solid>
      <gml:Solid rdf:about="{concat('gml:Solid/', $id)}">
        <schema:identifier>
          <xsl:value-of select="concat('gml:Solid.',$id)" />          
        </schema:identifier>

        <xsl:apply-templates>
          <xsl:with-param name="id" select="$id" tunnel="yes" />
        </xsl:apply-templates>

      </gml:Solid>
    </bldg:lod2Solid>
  </xsl:template>

<!-- auto generate - Predicate:gml:exterior  -->
<!-- auto generate - Object:gml:LinearRing  -->
  <xsl:template match="gml:Polygon/gml:exterior/gml:LinearRing">  
    <xsl:variable name="id" select="f:slugify(@gml:id)" />

    <gml:exterior>
      <gml:LinearRing rdf:about="{concat('gml:LinearRing/', $id)}">
        <schema:identifier>
          <xsl:value-of select="concat('gml:LinearRing.',$id)" />          
        </schema:identifier>

        <xsl:apply-templates>
          <xsl:with-param name="id" select="$id" tunnel="yes" />
        </xsl:apply-templates>

      </gml:LinearRing>
    </gml:exterior>
  </xsl:template>

<!-- auto generate - Predicate:gml:surfaceMember  -->
<!-- auto generate - Object:gml:Polygon  -->
  <xsl:template match="gml:MultiSurface/gml:surfaceMember/gml:Polygon">  
    <xsl:variable name="id" select="f:slugify(@gml:id)" />

    <gml:surfaceMember>
      <gml:Polygon rdf:about="{concat('gml:Polygon/', $id)}">
        <schema:identifier>
          <xsl:value-of select="concat('gml:Polygon.',$id)" />          
        </schema:identifier>

        <xsl:apply-templates>
          <xsl:with-param name="id" select="$id" tunnel="yes" />
        </xsl:apply-templates>

      </gml:Polygon>
    </gml:surfaceMember>
  </xsl:template>

<!-- auto generate - Predicate:gml:exterior  -->
<!-- auto generate - Object:gml:CompositeSurface  -->
  <xsl:template match="gml:Solid/gml:exterior/gml:CompositeSurface">  
    <xsl:variable name="id" select="f:slugify(@gml:id)" />

    <gml:exterior>
      <gml:CompositeSurface rdf:about="{concat('gml:CompositeSurface/', $id)}">
        <schema:identifier>
          <xsl:value-of select="concat('gml:CompositeSurface.',$id)" />          
        </schema:identifier>

        <xsl:apply-templates>
          <xsl:with-param name="id" select="$id" tunnel="yes" />
        </xsl:apply-templates>

      </gml:CompositeSurface>
    </gml:exterior>
  </xsl:template>

<!-- Catch-all empty template -->
<xsl:template match="text()|@*" mode="#all" />

</xsl:stylesheet>
