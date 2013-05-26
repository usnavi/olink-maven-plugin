<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version='1.0'>

  <xsl:import href="../html/docbook.xsl"/>
  
  <xsl:output indent="yes" method="xml"/>
  
  <xsl:template match="/">
    <xsl:apply-templates mode="olink.mode"/>
  </xsl:template>

</xsl:stylesheet>