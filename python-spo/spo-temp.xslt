<!-- base template for triples -->
  <xsl:template match="${{matchingRegex}}">  
    <xsl:variable name="id" select="f:slugify(../../@gml:id)" />

    <${{predicate}}>
      <${{object}} rdf:about="{concat('${{object}}/', $id)}">
        <schema:identifier>
          <xsl:value-of select="concat('${{object}}.',$id)" />          
        </schema:identifier>

        <xsl:apply-templates>
          <xsl:with-param name="id" select="$id" tunnel="yes" />
        </xsl:apply-templates>

      </${{object}}>
    </${{predicate}}>
  </xsl:template>