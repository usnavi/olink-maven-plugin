<?xml version="1.0"?>
<!--
Simple XProc example - transforming a source XML file into XHTML using
an external stylesheet. This time, the resultant XHTML is saved to a file
-->

<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" version="1.0"
		xmlns:cx="http://xmlcalabash.com/ns/extensions">
  <p:import href="http://xmlcalabash.com/extension/steps/library-1.0.xpl"/>
  <p:input port="parameters" kind="parameter" />

  <!--
      XInclude the source XML Document
  -->
  <p:xinclude>
    <p:input port="source">
      <p:document href="../../../../olink.xml" />
    </p:input>
  </p:xinclude>

  <!--
      Apply the Transform
  -->
  <p:xslt>
    <p:input port="stylesheet">
      <p:document href="make-olink-db.xsl" />
    </p:input>
  </p:xslt>


  <cx:message>
    <p:with-option name="message" select="'aldksjfdsalk;fj '"/>
  </cx:message>
  <!--
      Output to file
  -->
  <p:store href="../../../olink.db" method="xml" />
</p:declare-step>
