<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               xmlns:md="http://www.loc.gov/mods/v3"
               xmlns:t="http://www.tei-c.org/ns/1.0"
               xmlns:xlink="http://www.w3.org/1999/xlink"
               xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
               xmlns:cdl="http://www.cdlib.org/inside/diglib/copyrightMD"
               xmlns:dk="http://id.kb.dk/dk-corporate-creator"
               exclude-result-prefixes="xsl md t xlink xsi cdl dk"
               version="3.0">

  <xsl:param name="this_year" select="'2050'"/>
  
  <xsl:template match="/">
    <xsl:variable name="created">
      <xsl:for-each select=".//md:accessCondition/cdl:copyright">
        <xsl:for-each select="cdl:creation/cdl:year.creation">
          <xsl:value-of select="."/>
        </xsl:for-each>
      </xsl:for-each>
    </xsl:variable>

    <xsl:variable
        name="creator_dead"
        select="max(//dk:creator.corporate/dk:year.ended|//cdl:creator.person/cdl:year.death)"/>


    
<p>
<xsl:value-of select="$created"/>
<xsl:text>
</xsl:text>
<xsl:value-of select="$creator_dead"/>
</p>
  </xsl:template>

  
</xsl:transform>
