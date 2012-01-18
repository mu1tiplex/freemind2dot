<?xml version="1.0"?>

<!-- Written by Michael Peeters michael@peeters-noppe.net in 2011 -->
<!-- To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty. See http://creativecommons.org/publicdomain/zero/1.0/ -->

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
                <!-- do nothing !-->
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

        <xsl:if test="arrowlink">
            <xsl:value-of select="arrowlink/@DESTINATION"/> -> <xsl:value-of select="@ID"/> [dir=none];
        </xsl:if>
        
        <xsl:apply-templates select="node" mode="tree"/>
</xsl:template>

</xsl:stylesheet>