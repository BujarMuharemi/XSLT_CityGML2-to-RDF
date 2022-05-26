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

<!-- auto generate - Predicate:core:cityObjectMember  -->
<!-- auto generate - Object:bldg:Building  -->
  <xsl:template match="core:CityModel/core:cityObjectMember/bldg:Building">
    <xsl:variable name="id" select="f:slugify(@gml:id)" />

    <core:cityObjectMember>
      <bldg:Building rdf:about="{concat('bldg:Building/', $id)}">
        <schema:identifier>
          <xsl:value-of select="concat('bldg:Building.',$id)" />
        </schema:identifier>

        <xsl:apply-templates>
          <xsl:with-param name="id" select="$id" tunnel="yes" />
        </xsl:apply-templates>

      </bldg:Building>
    </core:cityObjectMember>
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

