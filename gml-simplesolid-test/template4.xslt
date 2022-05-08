<!-- rdf-grapher4_noIDs -->
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:core="http://www.opengis.net/citygml/2.0" xmlns:gen="http://www.opengis.net/citygml/generics/2.0" xmlns:bldg="http://www.opengis.net/citygml/building/2.0" xmlns:app="http://www.opengis.net/citygml/appearance/2.0" xmlns:dem="http://www.opengis.net/citygml/relief/2.0" xmlns:gml="http://www.opengis.net/gml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:f="http://opendata.cz/xslt/functions#" xmlns:schema="http://schema.org/" xsi:schemaLocation="http://www.opengis.net/citygml/building/2.0 http://schemas.opengis.net/citygml/building/2.0/building.xsd http://www.opengis.net/citygml/appearance/2.0 http://schemas.opengis.net/citygml/appearance/2.0/appearance.xsd http://www.opengis.net/citygml/relief/2.0 http://schemas.opengis.net/citygml/relief/2.0/relief.xsd http://www.opengis.net/citygml/2.0 http://schemas.opengis.net/citygml/2.0/cityGMLBase.xsd http://www.opengis.net/citygml/generics/2.0 http://schemas.opengis.net/citygml/generics/2.0/generics.xsd">

  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" normalization-form="NFC" />
  <xsl:strip-space elements="*" />


  <xsl:param name="ns">http://www.opengis.net/citygml/building/2.0/</xsl:param>

  <!-- Convert text into IRI-safe slug. -->
  <xsl:function name="f:slugify">
    <xsl:param name="text" />
    <xsl:value-of select="encode-for-uri(lower-case($text))" />
  </xsl:function>

  <!-- Templates -->
  <xsl:template match="/core:CityModel">
    <rdf:RDF>
      <xsl:apply-templates />
    </rdf:RDF>
  </xsl:template>

  <!-- bldg:Building -->
  <xsl:template match="core:cityObjectMember/bldg:Building">
    <xsl:variable name="id" select="f:slugify(@gml:id)" />

    <bldg:Building rdf:about="{concat('bldg:Building/', $id)}">
      <schema:identifier>
        <xsl:value-of select="$id" />
      </schema:identifier>
      <xsl:apply-templates>
        <xsl:with-param name="id" select="$id" tunnel="yes" />
      </xsl:apply-templates>
    </bldg:Building>
  </xsl:template>

  <!-- bldg:WallSurface -->
  <xsl:template match="bldg:WallSurface">
    <xsl:variable name="id" select="f:slugify(@gml:id)" />

    <bldg:boundedBy>
      <bldg:WallSurface rdf:about="{concat('bldg:WallSurface/', f:slugify(@gml:id))}">
        <schema:identifier>
          <xsl:value-of select="$id" />
        </schema:identifier>
        <xsl:apply-templates>
          <xsl:with-param name="id" select="$id" tunnel="yes" />
        </xsl:apply-templates>
      </bldg:WallSurface>
    </bldg:boundedBy>
  </xsl:template>

  <!-- bldg:lod2MultiSurface -->
  <xsl:template match="bldg:lod2MultiSurface/gml:MultiSurface">
    <xsl:variable name="id" select="../../bldg:WallSurface//@gml:id" />

    <bldg:lod2MultiSurface>
      <gml:MultiSurface rdf:about="{concat('bldg:MultiSurface/', $id)}">
        <schema:identifier>
          <xsl:value-of select="$id" />
        </schema:identifier>
        <xsl:apply-templates>
          <xsl:with-param name="id" select="$id" tunnel="yes" />
        </xsl:apply-templates>
      </gml:MultiSurface>
    </bldg:lod2MultiSurface>
  </xsl:template>



  <!-- gml:Polygon apply templates needs to be reconfigured. Also the matching in the hierarchy doesnt work.  -->
  <xsl:template match="gml:Polygon[@gml:id]">
    <!-- <xsl:variable name="id2" select="f:slugify(@gml:id)"/> -->
    <xsl:variable name="id" select="f:slugify(@gml:id)" />

    <gml:surfaceMember>
      <gml:Polygon rdf:about="{concat('gml:Polygon/', f:slugify(@gml:id))}">
        <schema:identifier>
          <xsl:value-of select="$id" />

        </schema:identifier>
        <!-- <xsl:apply-templates>
          <xsl:with-param name="id" select="@gml:id" tunnel="yes" />
        </xsl:apply-templates> -->
      </gml:Polygon>
    </gml:surfaceMember>
  </xsl:template>

  <!-- bldg:RoofSurface -->
  <xsl:template match="bldg:RoofSurface">
    <xsl:variable name="id" select="f:slugify(@gml:id)" />

    <bldg:boundedBy>
      <bldg:RoofSurface rdf:about="{concat('bldg:RoofSurface/', f:slugify(@gml:id))}">
        <schema:identifier>
          <xsl:value-of select="$id" />
        </schema:identifier>
        <xsl:apply-templates>
          <xsl:with-param name="id" select="$id" tunnel="yes" />
        </xsl:apply-templates>
      </bldg:RoofSurface>
    </bldg:boundedBy>
  </xsl:template>

  <!-- bldg:GroundSurface -->
  <xsl:template match="bldg:GroundSurface">
    <xsl:variable name="id" select="f:slugify(@gml:id)" />

    <bldg:boundedBy>
      <bldg:GroundSurface rdf:about="{concat('bldg:GroundSurface/', f:slugify(@gml:id))}">
        <schema:identifier>
          <xsl:value-of select="$id" />
        </schema:identifier>
        <xsl:apply-templates>
          <xsl:with-param name="id" select="$id" tunnel="yes" />
        </xsl:apply-templates>
      </bldg:GroundSurface>
    </bldg:boundedBy>
  </xsl:template>


  <!-- Catch-all empty template -->
  <xsl:template match="text()|@*" mode="#all" />

</xsl:stylesheet>