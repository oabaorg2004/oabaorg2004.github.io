<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">

    <html>
        <head>
            <title>Tabla de Desayunos</title>
        </head>
        <body>
        <h1>Tabla con nombre, precio y calorias</h1>
        <table border="1px">
        <tr>
            <th>Nombre</th>
            <th>Calorias</th>
            <th>Precio</th>
        </tr>
        <xsl:for-each select="breakfast_menu/food">
        <tr>
            <td><xsl:value-of select="name"/></td>
            <td><xsl:value-of select="calories"/></td>
            <td><xsl:value-of select="price"/></td>
        </tr>
        </xsl:for-each>
        </table>
        <h1>Ordenado por nombre</h1>
        <table border="1px">
        <tr>
            <th>Nombre</th>
            <th>Calorias</th>
            <th>Precio</th>
        </tr>
         <xsl:for-each select="breakfast_menu/food">
         <xsl:sort select="name"/>
        <tr>
            <td><xsl:value-of select="name"/></td>
            <td><xsl:value-of select="calories"/></td>
            <td><xsl:value-of select="price"/></td>
        </tr>
        </xsl:for-each>
        </table>
        <h1>Ordenado por mayor de 850 calorias</h1>
        <table border="1px">
        <tr>
            <th>Nombre</th>
            <th>Calorias</th>
            <th>Precio</th>
        </tr>
        <xsl:for-each select="breakfast_menu/food">
        <xsl:if test="calories &gt; 850">
        <tr>
            <td><xsl:value-of select="name"/></td>
            <td><xsl:value-of select="calories"/></td>
            <td><xsl:value-of select="price"/></td>
        </tr>
        </xsl:if>
        </xsl:for-each>
        </table>
        <h1>Color rojo si el precio es mayor a 9 libras</h1>
        <table border="1px">
        <tr>
            <th>Nombre</th>
            <th>Calorias</th>
            <th>Precio</th>
        </tr>
        <xsl:for-each select="breakfast_menu/food">
        <xsl:choose>
        <xsl:when test="price &gt; 900">
          <tr>
            <td bgcolor="red"><xsl:value-of select="name"/></td>
            <td bgcolor="red"><xsl:value-of select="calories"/></td>
            <td bgcolor="red"><xsl:value-of select="price"/></td>
        </tr>
        </xsl:when>
        <xsl:otherwise>
          <tr>
            <td><xsl:value-of select="name"/></td>
            <td><xsl:value-of select="calories"/></td>
            <td><xsl:value-of select="price"/></td>
        </tr>
        </xsl:otherwise>
      </xsl:choose>
        </xsl:for-each>
        </table>
        </body>
    </html>

    </xsl:template>
</xsl:transform>