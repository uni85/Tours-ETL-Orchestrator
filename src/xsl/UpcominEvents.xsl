<!-- events.xsl: Lists upcoming events -->

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head><title>Upcoming Events</title></head>
      <body>
        <h1>Upcoming Events</h1>
        <table border="1">
          <tr><th>Name</th><th>Date</th><th>Location</th></tr>
          <xsl:for-each select="CyclingTours/Events/Event">
            <tr>
              <td><xsl:value-of select="Name"/></td>
              <td><xsl:value-of select="Date"/></td>
              <td><xsl:value-of select="Location"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
