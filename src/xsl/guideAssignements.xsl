<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

    <xsl:key name="package-by-id" match="CyclingTours/TourPackages/Package" use="@id"/>

    <xsl:template match="/">
        <GuideRoster>
            <xsl:for-each select="CyclingTours/Guides/Guide">
                <Guide id="{@id}">
                    <Name><xsl:value-of select="Name"/></Name>
                    <Languages>
                        <xsl:for-each select="Languages/Language">
                            <Language><xsl:value-of select="."/></Language>
                        </xsl:for-each>
                    </Languages>
                    <AssignedPackages>
                        <xsl:for-each select="AssignedPackages/PackageRef">
                            <xsl:variable name="packageId" select="."/>
                            <Package id="{$packageId}">
                                <Name><xsl:value-of select="key('package-by-id', $packageId)/Name"/></Name>
                            </Package>
                        </xsl:for-each>
                    </AssignedPackages>
                </Guide>
            </xsl:for-each>
        </GuideRoster>
    </xsl:template>

</xsl:stylesheet>