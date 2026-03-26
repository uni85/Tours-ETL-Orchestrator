<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:key name="client-by-id" match="CyclingTours/Clients/Client" use="@id"/>
    <xsl:key name="package-by-id" match="CyclingTours/TourPackages/Package" use="@id"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Client Booking Report</title>
                <style type="text/css">
                    body { font-family: Verdana, Geneva, sans-serif; margin: 20px; }
                    table { width: 90%; border-collapse: collapse; margin-top: 15px; }
                    th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
                    th { background-color: #f0ad4e; color: white; }
                    .package-name { font-weight: bold; color: #d9534f; }
                </style>
            </head>
            <body>
                <h1>🗓️ Client Booking Report (12 Bookings)</h1>
                <table>
                    <thead>
                        <tr>
                            <th>Booking ID</th>
                            <th>Client Name &amp; Contact</th>
                            <th>Booked Package</th>
                            <th>Booking Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="CyclingTours/Bookings/Booking">
                            <xsl:variable name="clientRef" select="ClientRef"/>
                            <xsl:variable name="packageRef" select="PackageRef"/>
                            
                            <xsl:variable name="client" select="key('client-by-id', $clientRef)"/>
                            
                            <xsl:variable name="package" select="key('package-by-id', $packageRef)"/>
                            
                            <tr>
                                <td><xsl:value-of select="@id"/></td>
                                <td>
                                    <span style="font-weight: bold;"><xsl:value-of select="$client/Name"/></span> (ID: <xsl:value-of select="$clientRef"/>)
                                    <br/>Email: <xsl:value-of select="$client/Email"/>
                                    <br/>Phone: <xsl:value-of select="$client/Phone"/>
                                </td>
                                <td>
                                    <span class="package-name"><xsl:value-of select="$package/Name"/></span> (ID: <xsl:value-of select="$packageRef"/>)
                                    <br/>Duration: <xsl:value-of select="$package/Duration"/>
                                    <br/>Difficulty: <xsl:value-of select="$package/Difficulty"/>
                                </td>
                                <td><xsl:value-of select="Date"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>