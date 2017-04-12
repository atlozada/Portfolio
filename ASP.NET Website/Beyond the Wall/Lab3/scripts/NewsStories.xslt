<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:template match="/">
    <html>
      <body>
        <h2>Top News Stories</h2>
        <table border="1">
          <tr bgcolor="#9acd32">

            <th align="left">Title</th>
            <th align="left">Image</th>
            <th align="left">Date</th>
            <th align="left">Description</th>


          </tr>
          <xsl:for-each select="news/story">

            <tr>

              <td>
                <xsl:value-of select="title"/>
              </td>
                <xsl:apply-templates select="img"/>
              <td>
                <xsl:value-of select="date"/>
              </td>
              <td>
                <xsl:value-of select="description"/>
              </td>

            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="img">
    <td>
      <img src="{.}"></img>
    </td>
  </xsl:template>


</xsl:stylesheet>
