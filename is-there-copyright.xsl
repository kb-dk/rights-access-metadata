<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               xmlns:md="http://www.loc.gov/mods/v3"
               xmlns:t="http://www.tei-c.org/ns/1.0"
               xmlns:xlink="http://www.w3.org/1999/xlink"
               xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
               xmlns:cdl="http://www.cdlib.org/inside/diglib/copyrightMD"
               xmlns:xs="http://www.w3.org/2001/XMLSchema"
               xmlns:dk="http://id.kb.dk/dk-corporate-creator"
               exclude-result-prefixes="xsl md t xlink xsi cdl dk xs"
               version="3.0">

  <xsl:param name="this_year" select="number('2075')"/>
  
  <xsl:template match="/">
    <xsl:variable name="created" as="xs:integer *">
      <xsl:for-each select=".//md:accessCondition/cdl:copyright">
        <xsl:for-each select="cdl:creation/cdl:year.creation">
          <xsl:value-of select="."/>
        </xsl:for-each>
      </xsl:for-each>
    </xsl:variable>

    <xsl:variable
        name="creator_dead"
        select="max(//dk:creator.corporate/dk:year.ended|//cdl:creator.person/cdl:year.death)"/>

    <xsl:variable
        name="free_after_years" select="'75'"/>
    
    <pre>
      The creator died at <xsl:value-of select="$creator_dead"/>
      <xsl:text>
      </xsl:text>
      The portrait was made <xsl:value-of select="$created"/>
      <xsl:text>
      </xsl:text>
      this_year - created = <xsl:value-of select="$this_year"/> -  <xsl:value-of select="$created"/> = <xsl:value-of select="$this_year - $created"/>
      <xsl:text>
      </xsl:text>
      which is <xsl:choose>
      <xsl:when test="$this_year - $created &gt; 140">safe. Clara did not survive to her 140th birtday</xsl:when>
      
</xsl:choose>
<xsl:text>
</xsl:text>

</pre>

  </xsl:template>

  
</xsl:transform>
