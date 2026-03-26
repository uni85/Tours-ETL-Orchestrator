<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="text"/>

    <xsl:template name="json-string">
        <xsl:param name="text"/>
        <xsl:text>"</xsl:text>
        <xsl:value-of select="$text"/>
        <xsl:text>"</xsl:text>
    </xsl:template>

    <xsl:template match="/">
        <xsl:text>{"paths": [</xsl:text>
        <xsl:for-each select="CyclingTours/CyclingPaths/Path">
            <xsl:text>{</xsl:text>
                <xsl:call-template name="json-string"><xsl:with-param name="text">id</xsl:with-param></xsl:call-template><xsl:text>:</xsl:text><xsl:call-template name="json-string"><xsl:with-param name="text" select="@id"/></xsl:call-template><xsl:text>,</xsl:text>
                <xsl:call-template name="json-string"><xsl:with-param name="text">name</xsl:with-param></xsl:call-template><xsl:text>:</xsl:text><xsl:call-template name="json-string"><xsl:with-param name="text" select="Name"/></xsl:call-template><xsl:text>,</xsl:text>
                <xsl:call-template name="json-string"><xsl:with-param name="text">length</xsl:with-param></xsl:call-template><xsl:text>:</xsl:text><xsl:value-of select="Length"/><xsl:text>,</xsl:text>
                <xsl:call-template name="json-string"><xsl:with-param name="text">unit</xsl:with-param></xsl:call-template><xsl:text>:</xsl:text><xsl:call-template name="json-string"><xsl:with-param name="text" select="Length/@unit"/></xsl:call-template><xsl:text>,</xsl:text>
                <xsl:call-template name="json-string"><xsl:with-param name="text">difficulty</xsl:with-param></xsl:call-template><xsl:text>:</xsl:text><xsl:call-template name="json-string"><xsl:with-param name="text" select="Difficulty"/></xsl:call-template>
            <xsl:text>}</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>,&#xa;</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>]}</xsl:text>
    </xsl:template>

</xsl:stylesheet>