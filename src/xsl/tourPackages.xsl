<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>All Available Tour Packages</title>
                <style type="text/css">
                    body { font-family: Arial, sans-serif; margin: 20px; }
                    table { width: 80%; border-collapse: collapse; margin-top: 15px; }
                    th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
                    th { background-color: #f2f2f2; }
                    h1 { color: #333; }
                </style>
            </head>
            <body>
                <h1>Comprehensive List of Tour Packages (12 Total)</h1>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Package Name</th>
                            <th>Duration</th>
                            <th>Difficulty</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="CyclingTours/TourPackages/Package">
                            <tr>
                                <td><xsl:value-of select="@id"/></td>
                                <td><xsl:value-of select="Name"/></td>
                                <td><xsl:value-of select="Duration"/></td>
                                <td>
                                    <xsl:choose>
                                        <xsl:when test="Difficulty='Advanced'"><span style="color: red; font-weight: bold;"><xsl:value-of select="Difficulty"/></span></xsl:when>
                                        <xsl:when test="Difficulty='Intermediate'"><span style="color: orange;"><xsl:value-of select="Difficulty"/></span></xsl:when>
                                        <xsl:otherwise><xsl:value-of select="Difficulty"/></xsl:otherwise>
                                    </xsl:choose>
                                </td>
                                <td>
                                    <xsl:value-of select="Price"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="Price/@currency"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>