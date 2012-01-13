﻿<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" />

<xsl:template match="map">
    digraph export { 
    <xsl:apply-templates select="node" mode="labels"/>
    <xsl:apply-templates select="node" mode="tree"/>
    }
</xsl:template>

<xsl:template match="node" mode="labels">
        <xsl:value-of select="@ID"/> [label="<xsl:value-of select="@TEXT"/>"]; 
        <xsl:choose>    
            <xsl:when test="not(node())">
                
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="node" mode="labels"/>
            </xsl:otherwise>
        </xsl:choose>            
</xsl:template>

<xsl:template match="node" mode="tree">
        <xsl:if test="parent::node">
            <xsl:value-of select="../@ID"/> -> <xsl:value-of select="@ID"/> ;
        </xsl:if>    
        <xsl:apply-templates select="node" mode="tree"/>
</xsl:template>

</xsl:stylesheet>