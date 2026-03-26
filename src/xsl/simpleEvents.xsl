<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <EventList count="{count(CyclingTours/Events/Event)}">
            <xsl:for-each select="CyclingTours/Events/Event">
                <SimplifiedEvent id="{@id}">
                    <Name><xsl:value-of select="Name"/></Name>
                    <Date><xsl:value-of select="Date"/></Date>
                    <Location><xsl:value-of select="Location"/></Location>
                </SimplifiedEvent>
            </xsl:for-each>
        </EventList>
    </xsl:template>

</xsl:stylesheet>