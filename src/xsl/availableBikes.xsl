<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Available Rental Bikes</title>
                <style type="text/css">
                    body { font-family: Arial, sans-serif; margin: 20px; }
                    ul { list-style: square; }
                    li { margin-bottom: 10px; border-bottom: 1px dashed #eee; padding-bottom: 5px;}
                    .bike-type { font-weight: bold; color: teal; }
                    .bike-loc { font-style: italic; }
                    h1 { color: #008080; }
                </style>
            </head>
            <body>
                <h1>Available Rental Bikes</h1>
                
                <xsl:variable name="availableCount" select="count(CyclingTours/RentalBikes/Bike[Status='Available'])"/>
                <p>Total Available Bikes: <xsl:value-of select="$availableCount"/></p>

                <ul>
                    <xsl:for-each select="CyclingTours/RentalBikes/Bike[Status='Available']">
                        <li>
                            Bike ID: <xsl:value-of select="@id"/>
                            - Type: <span class="bike-type"><xsl:value-of select="Type"/></span>
                            - Location: <span class="bike-loc"><xsl:value-of select="Location"/></span>
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>