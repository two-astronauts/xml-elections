<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : elections.xsl
    Created on : 5 de noviembre de 2021, 09:56 PM
    Author     : User
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>elections.xsl</title>
            </head>
            <body>
                <h1>Todos los departamentos</h1>
                <table border="1">
                    <tr style="color: red">
                        <th>
                            Region
                        </th>
                        <th>
                            Departamento
                        </th>
                        <th>
                            Inscritos
                        </th>
                        <th>
                            Blancos
                        </th>
                        <th>
                            Partido 1
                        </th>
                        <th>
                            Partido 2
                        </th>
                        <th>
                            Partido 3
                        </th>
                        <th>
                            % Abstención
                        </th>
                        <th>
                            Cantidad de letras
                        </th>
                    </tr>
                    <xsl:for-each select="//departamento">
                        <xsl:sort order="ascending" select="."/>
                        <tr>
                            <td>
                                <xsl:number value="position()" format="1."/>
                                <xsl:value-of select="./@region"/>
                            </td>
                            <td>
                                <xsl:value-of select="./@nombre"/>
                            </td>
                            <td>
                                <xsl:value-of select="./@inscritos"/>
                            </td>
                            <td>
                                <xsl:value-of select="./blanco"/>
                            </td>
                            <td>
                                <xsl:value-of select="./partido1"/>
                            </td>
                            <td>
                                <xsl:value-of select="./partido2"/>
                            </td>
                            <td>
                                <xsl:value-of select="./partido3"/>
                            </td>
                            <td>
                                <xsl:value-of select="format-number((( ./@inscritos - (./blanco + ./partido1 + ./partido2 + ./partido3)) * 100) div ./@inscritos, '0,00%')"/>
                            </td>
                            <xsl:if test="./@region = 'andina'">
                                <td>
                                    <xsl:value-of select="string-length(./@nombre)"/>
                                </td>
                            </xsl:if>
                        </tr>
                    </xsl:for-each>
                    <tr>
                        <td colspan="4">
                            Totales en Colombia
                        </td>
                        <td>
                            <xsl:value-of select="sum(//departamento/partido1)"/>
                        </td>
                        <td>
                            <xsl:value-of select="sum(//departamento/partido2)"/>
                        </td>
                        <td>
                            <xsl:value-of select="sum(//departamento/partido3)"/>
                        </td>
                    </tr>
                </table>

                <h1>Solo región Caribe</h1>
                <table border="1">
                    <tr style="color: red">
                        <th>
                            Region
                        </th>
                        <th>
                            Departamento
                        </th>
                        <th>
                            Inscritos
                        </th>
                        <th>
                            Blancos
                        </th>
                        <th>
                            Partido 1
                        </th>
                        <th>
                            Partido 2
                        </th>
                        <th>
                            Partido 3
                        </th>
                    </tr>
                    <xsl:for-each select="//departamento[@region = 'caribe']">
                        <xsl:sort order="ascending" select="."/>
                        <tr>
                            <td>
                                <xsl:number value="position()" format="1."/>
                                <xsl:value-of select="./@region"/>
                            </td>
                            <td>
                                <xsl:value-of select="./@nombre"/>
                            </td>
                            <td>
                                <xsl:value-of select="./@inscritos"/>
                            </td>
                            <td>
                                <xsl:value-of select="./blanco"/>
                            </td>
                            <td>
                                <xsl:value-of select="./partido1"/>
                            </td>
                            <td>
                                <xsl:value-of select="./partido2"/>
                            </td>
                            <td>
                                <xsl:value-of select="./partido3"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
