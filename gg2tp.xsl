<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tp="http://www.plazi.org/taxpub" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">
    <xsl:output method="xml" encoding="UTF-8" doctype-system="file:/media/thc4/KINGSTON8/Work/Plazi/TaxPubJATS-green/tax-treatment-NS0.dtd"/>
    
    <xsl:template match="/">
        <xsl:apply-templates select="//treatment"/>
    </xsl:template>
    <xsl:template match="treatment">
        <tp:taxon-treatment>
            <xsl:apply-templates/>
        </tp:taxon-treatment>
    </xsl:template>
    <xsl:template match="subSubSection[@type = 'nomenclature']">
        <tp:nomenclature>
            <xsl:apply-templates/>
        </tp:nomenclature>
    </xsl:template>
    <xsl:template match="taxonomicName">
        <tp:taxon-name>
            <xsl:apply-templates/>
        </tp:taxon-name>
    </xsl:template>
    <xsl:template match="pageBreakToken">
        <xsl:processing-instruction name="PageBreak"><xsl:value-of select="@pageNumber"/></xsl:processing-instruction>
    </xsl:template>
    <xsl:template match="subSubSection">
        <tp:treatment-sec sec-type="{@type}">
            <xsl:apply-templates/>
        </tp:treatment-sec>
    </xsl:template>
    <xsl:template match="paragraph">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="materialsCitation">
        <tp:material-citation>
          <xsl:apply-templates/>
        </tp:material-citation>
    </xsl:template>
    <xsl:template match="normalizedToken">
        <xsl:value-of select="@originalValue"/>
        <xsl:text> </xsl:text>
    </xsl:template>
    <xsl:template match="text()">
        <xsl:value-of select="translate(normalize-space(),'&#10;', ' ')"/>
        <xsl:text> </xsl:text>
    </xsl:template>
    <xsl:template match="paragraph[parent::subSubSection[@type = 'nomenclature']]">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="materialsCitation/*">
        <named-content content-type="{local-name()}">
            <xsl:apply-templates/>
        </named-content>
    </xsl:template>
    <xsl:template match="table">
        <table-wrap><table><xsl:apply-templates/></table></table-wrap>
    </xsl:template>
    <xsl:template match="td">
        <td><xsl:apply-templates/></td>
    </xsl:template>
    <xsl:template match="tr">
        <tr><xsl:apply-templates/></tr>
    </xsl:template>
</xsl:stylesheet>
