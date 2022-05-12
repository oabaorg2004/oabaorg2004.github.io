<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
    <html>
        <head>
            <title>Vehículos</title>
        </head>
        <body>
        <h1>Visualizar todos los vehículos en una tabla que contendré la marca el modelo y su precio, ordenados por marca</h1>
        
        <table border="1px">
        <tr>
            <th>Marca</th>
            <th>Modelo</th>
            <th>Precio</th>
        </tr>
        <xsl:for-each select="vehiculos/vehiculo">
        <xsl:sort select="marca"/>
        <tr>
            <td><xsl:value-of select="marca"/></td>
            <td><xsl:value-of select="modelo"/></td>
            <td><xsl:value-of select="precio"/></td>
        </tr>
        </xsl:for-each>
        </table>
        <h1>En una tabla, marca modelo, cambio, precio y combustible de los coches gasolina y automáticos.</h1>
        <table border="1px">
        <tr>
            <th>Marca</th>
            <th>Modelo</th>
            <th>Cambio</th>
            <th>Precio</th>
            <th>Combustible</th>
        </tr>
        <xsl:for-each select="vehiculos/vehiculo">
        <xsl:if test="@combustible = 'gasolina' and @cambio = 'automatico'">
        <tr>
            <td><xsl:value-of select="marca"/></td>
            <td><xsl:value-of select="modelo"/></td>
            <td><xsl:value-of select="@cambio"/></td>
            <td><xsl:value-of select="precio"/></td>
            <td><xsl:value-of select="@combustible"/></td>
        </tr>
        </xsl:if>
        </xsl:for-each>
        </table>
        <h1>En una tabla, marca, modelo, precio, Km, año, y potencia, mostrando los coches mas baratos de 20.000€ en fondo verde.</h1>
        <table border="1px">
        <tr>
            <th>Marca</th>
            <th>Modelo</th>
            <th>Precio</th>
            <th>Km</th>
            <th>Año</th>
            <th>Potencia</th>
        </tr>
        <xsl:for-each select="vehiculos/vehiculo">
        <xsl:choose>
        <xsl:when test="precio &lt; 20000">
        <tr>
            <td bgcolor="green"><xsl:value-of select="marca"/></td>
            <td bgcolor="green"><xsl:value-of select="modelo"/></td>
            <td bgcolor="green"><xsl:value-of select="precio"/></td>
            <td bgcolor="green"><xsl:value-of select="km"/></td>
            <td bgcolor="green"><xsl:value-of select="anno"/></td>
            <td bgcolor="green"><xsl:value-of select="potencia"/></td>
        </tr>
         </xsl:when>
        <xsl:otherwise>
        <tr>
            <td><xsl:value-of select="marca"/></td>
            <td><xsl:value-of select="modelo"/></td>
            <td><xsl:value-of select="precio"/></td>
            <td><xsl:value-of select="km"/></td>
            <td><xsl:value-of select="potencia"/></td>
        </tr>
        </xsl:otherwise>
      </xsl:choose>
        </xsl:for-each>
        </table>
        <h1>En una tabla, marca, modelo, combustible y precio de los coches, no gasolina. Ordenados por precio.</h1>
        <table border="1px">
        <tr>
            <th>Marca</th>
            <th>Modelo</th>
            <th>Combustible</th>
            <th>Precio</th>
        </tr>
        <xsl:for-each select="vehiculos/vehiculo">
        <xsl:sort select="precio" order="descending" data-type="number"/>
        <tr>
            <td><xsl:value-of select="marca"/></td>
            <td><xsl:value-of select="modelo"/></td>
            <td><xsl:value-of select="@combustible"/></td>
            <td><xsl:value-of select="precio"/></td>
        </tr>
        </xsl:for-each>
        </table>
        <h1>Tabla con los 3 coches más caros</h1>
        <table border="1px">
        <tr>
            <th>Marca</th>
            <th>Modelo</th>
            <th>Potencia</th>
            <th>Año</th>
            <th>Color</th>
            <th>Precio</th>
            <th>Km</th>
        </tr>
        <xsl:for-each select="vehiculos/vehiculo">
        <xsl:sort select="precio" order="descending" data-type="number"/>
        <xsl:if test="position() &lt; 4">
        <tr>
            <td><xsl:value-of select="marca"/></td>
            <td><xsl:value-of select="modelo"/></td>
            <td><xsl:value-of select="potencia"/></td>
            <td><xsl:value-of select="anno"/></td>
            <td><xsl:value-of select="color"/></td>
            <td><xsl:value-of select="precio"/></td>
            <td><xsl:value-of select="km"/></td>
            </tr>
        </xsl:if>
        </xsl:for-each>
        </table>
        </body>
    </html>

    </xsl:template>
</xsl:transform>