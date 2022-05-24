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

<!-- auto generate - Predicate:bldg:lod2MultiSurface  -->
<!-- auto generate - Object:gml:MultiSurface  -->
  <xsl:template match="bldg:RoofSurface/bldg:lod2MultiSurface/gml:MultiSurface">
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

<!-- auto generate - Predicate:bldg:boundedBy  -->
<!-- auto generate - Object:bldg:GroundSurface  -->
  <xsl:template match="bldg:Building/bldg:boundedBy/bldg:GroundSurface">
    <xsl:variable name="id" select="f:slugify(@gml:id)" />

    <bldg:boundedBy>
      <bldg:GroundSurface rdf:about="{concat('bldg:GroundSurface/', $id)}">
        <schema:identifier>
          <xsl:value-of select="concat('bldg:GroundSurface.',$id)" />
        </schema:identifier>

        <xsl:apply-templates>
          <xsl:with-param name="id" select="$id" tunnel="yes" />
        </xsl:apply-templates>

      </bldg:GroundSurface>
    </bldg:boundedBy>
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

<!-- auto generate - Predicate:bldg:boundedBy  -->
<!-- auto generate - Object:bldg:WallSurface  -->
  <xsl:template match="bldg:Building/bldg:boundedBy/bldg:WallSurface">
    <xsl:variable name="id" select="f:slugify(@gml:id)" />

    <bldg:boundedBy>
      <bldg:WallSurface rdf:about="{concat('bldg:WallSurface/', $id)}">
        <schema:identifier>
          <xsl:value-of select="concat('bldg:WallSurface.',$id)" />
        </schema:identifier>

        <xsl:apply-templates>
          <xsl:with-param name="id" select="$id" tunnel="yes" />
        </xsl:apply-templates>

      </bldg:WallSurface>
    </bldg:boundedBy>
  </xsl:template>

<!-- auto generate - Predicate:bldg:boundedBy  -->
<!-- auto generate - Object:bldg:RoofSurface  -->
  <xsl:template match="bldg:Building/bldg:boundedBy/bldg:RoofSurface">
    <xsl:variable name="id" select="f:slugify(@gml:id)" />

    <bldg:boundedBy>
      <bldg:RoofSurface rdf:about="{concat('bldg:RoofSurface/', $id)}">
        <schema:identifier>
          <xsl:value-of select="concat('bldg:RoofSurface.',$id)" />
        </schema:identifier>

        <xsl:apply-templates>
          <xsl:with-param name="id" select="$id" tunnel="yes" />
        </xsl:apply-templates>

      </bldg:RoofSurface>
    </bldg:boundedBy>
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

