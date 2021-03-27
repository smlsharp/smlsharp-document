<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ltx="http://dlmf.nist.gov/LaTeXML"
    exclude-result-prefixes="ltx">
  <xsl:import href="urn:x-LaTeXML:XSLT:LaTeXML-html5.xsl"/>
  <xsl:template match="/" mode="header">
    <xsl:element name="header" namespace="{$html_ns}">
      <xsl:attribute name="class">ltx_page_header</xsl:attribute>
      <xsl:if test="//ltx:navigation/ltx:ref[@rel='start']/@title">
        <xsl:element name="div" namespace="{$html_ns}">
          <xsl:attribute name="class">ltx_document_title</xsl:attribute>
          <xsl:value-of select="//ltx:navigation/ltx:ref[@rel='start']/@title"/>
        </xsl:element>
      </xsl:if>
      <xsl:apply-templates select="." mode="header-navigation"/>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
