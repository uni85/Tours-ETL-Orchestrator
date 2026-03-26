<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:key name="package-by-id" match="CyclingTours/TourPackages/Package" use="@id"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Cycling Tour Guide Roster</title>
                <style type="text/css">
                    body { font-family: 'Open Sans', sans-serif; margin: 20px; }
                    table { width: 100%; border-collapse: collapse; margin-top: 15px; }
                    th, td { border: 1px solid #e0e0e0; padding: 10px; text-align: left; vertical-align: top; }
                    th { background-color: #4CAF50; color: white; }
                    .guide-name { font-weight: bold; font-size: 1.1em; color: #2e7d32; }
                    .language { display: inline-block; background-color: #c8e6c9; border-radius: 4px; padding: 2px 6px; margin: 2px; font-size: 0.85em; }
                    .package-list { list-style-type: disc; margin: 5px 0 0 20px; padding: 0; }
                </style>
            </head>
            <body>
                <h1>🚴 Tour Guide Roster (6 Guides)</h1>
                <table>
                    <thead>
                        <tr>
                            <th>Guide Name (ID)</th>
                            <th>Languages Spoken</th>
                            <th>Assigned Packages</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="CyclingTours/Guides/Guide">
                            <tr>
                                <td>
                                    <span class="guide-name"><xsl:value-of select="Name"/></span>
                                    <br/>(ID: <xsl:value-of select="@id"/>)
                                </td>
                                <td>
                                    <xsl:for-each select="Languages/Language">
                                        <span class="language"><xsl:value-of select="."/></span>
                                    </xsl:for-each>
                                </td>
                                <td>
                                    <ul class="package-list">
                                        <xsl:for-each select="AssignedPackages/PackageRef">
                                            <xsl:variable name="packageId" select="."/>
                                            <li>
                                                <xsl:value-of select="key('package-by-id', $packageId)/Name"/>
                                                <span style="font-size: 0.8em; color: #999;"> (<xsl:value-of select="$packageId"/>)</span>
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>