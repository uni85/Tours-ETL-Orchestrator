<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:key name="paths-by-dest" match="CyclingTours/CyclingPaths/Path" use="@destinationRef"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Cycling Paths Grouped by Destination</title>
                <style type="text/css">
                    body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; margin: 20px; }
                    .destination { background-color: #0077b6; color: white; padding: 10px; margin-top: 20px; border-radius: 5px 5px 0 0; }
                    .path-list { border: 1px solid #ccc; padding: 15px; margin-bottom: 20px; list-style-type: none; }
                    .path-item { margin-bottom: 8px; }
                    .path-name { font-weight: bold; color: #03045e; }
                    .detail { font-size: 0.9em; color: #666; margin-left: 15px; }
                </style>
            </head>
            <body>
                <h1>🗺️ Cycling Paths by Destination (12 Destinations)</h1>
                
                <xsl:for-each select="CyclingTours/Destinations/Destination[@id = key('paths-by-dest', @id)/@destinationRef]">
                    <xsl:variable name="currentDestId" select="@id"/>
                    
                    <div class="destination">
                        <h2><xsl:value-of select="Name"/> (<xsl:value-of select="Country"/>)</h2>
                        <p><xsl:value-of select="Description"/></p>
                    </div>

                    <ul class="path-list">
                        <xsl:for-each select="key('paths-by-dest', $currentDestId)">
                            <li class="path-item">
                                <span class="path-name"><xsl:value-of select="Name"/></span> (Path ID: <xsl:value-of select="@id"/>)
                                <div class="detail">
                                    Length: <xsl:value-of select="Length"/> <xsl:value-of select="Length/@unit"/> | 
                                    Difficulty: <xsl:value-of select="Difficulty"/> |
                                    Terrain: <xsl:value-of select="Terrain"/>
                                </div>
                            </li>
                        </xsl:for-each>
                    </ul>
                </xsl:for-each>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>