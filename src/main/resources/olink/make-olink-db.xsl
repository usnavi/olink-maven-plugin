<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:ol="http://docs.rackspace.com/olink"
		exclude-result-prefixes="ol"
                version='2.0'>

  <xsl:import href="docbook-xsl/html/docbook.xsl"/>
  
  <xsl:output indent="yes" method="xml"/>
  
  <xsl:template match="/">
    <targetset> 
      <sitemap>	
	<dir>
	  <xsl:apply-templates select="ol:books/ol:book" mode="process-book"/>
	</dir>
      </sitemap>
    </targetset>
  </xsl:template>
  
  <xsl:template match="ol:book" mode="process-book">
    <xsl:variable name="path" select="@path"/>
    <xsl:variable name="book" select="document(resolve-uri($path, base-uri(.)))"/>
   
    <document targetdoc="{$book/*/@xml:id}" 
	      baseuri="index.html"> 
      <xsl:apply-templates select="$book" mode="olink.mode"/>
    </document>
  </xsl:template>

</xsl:stylesheet>
